NAME=terrajux-action
VERSION := $(shell cat VERSION)
GIT_SHA := $(shell git rev-parse --short HEAD)

.PHONY: build test release

build:
	docker build -t terrajux-action .

test:
	docker run \
		--rm \
		--tty \
		--interactive \
		--entrypoint /test.sh \
		$(NAME)

prerelease:
	gh \
		release \
			create \
				"$(VERSION)-$(GIT_SHA)" \
				--title "$(VERSION)-$(GIT_SHA)" \
				--notes "$(NAME) prerelease version $(VERSION)-$(GIT_SHA)" \
				--prerelease

release:
	gh \
		release \
			create \
				"$(VERSION)" \
				--title "$(VERSION)" \
				--notes "$(NAME) version $(VERSION)"

delete-tag:
	git \
		push \
			--delete \
			origin \
			$(VERSION)-$(GIT_SHA)
