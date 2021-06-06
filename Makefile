NAME=terrajux-action
VERSION := $(shell cat VERSION)
GIT_SHA := $(shell git rev-parse --short HEAD)

.PHONY: build test release

build:
	@@docker build -t ghcr.io/mdb/$(NAME) .

test:
	@@docker run \
		--rm \
		--tty \
		--interactive \
		--entrypoint /test.sh \
		$(NAME)

check-tag:
	@@if git rev-parse $(VERSION) >/dev/null 2>&1; then \
		echo "found existing $(VERSION) git tag"; \
		exit 1; \
	fi

prerelease: check-tag
	@@gh \
		release \
			create \
				"$(VERSION)-$(GIT_SHA)" \
				--title "$(VERSION)-$(GIT_SHA)" \
				--notes "$(NAME) prerelease version $(VERSION)-$(GIT_SHA)" \
				--prerelease

release: check-tag
	@@gh \
		release \
			create \
				"$(VERSION)" \
				--title "$(VERSION)" \
				--notes "$(NAME) version $(VERSION)"

delete-prerelease-tag:
	@@git \
		push \
			--delete \
			origin \
			$(VERSION)-$(GIT_SHA)

delete-release-tag:
	@@git \
		push \
			--delete \
			origin \
			$(VERSION)
