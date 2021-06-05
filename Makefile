.PHONY: build test

build:
	docker build -t terrajux-action .

test:
	docker run \
		--rm \
		--tty \
		--interactive \
		--entrypoint /test.sh \
		terrajux-action
