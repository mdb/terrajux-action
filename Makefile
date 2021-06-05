.PHONY: build

build:
	docker build -t terrajux-action .

test:
	docker run \
		--rm \
		--tty \
		--interactive \
		--env "GITHUB_REPOSITORY=terraform-aws-modules/terraform-aws-iam" \
		--env "GITHUB_REF=v3.15.0" \
		--env "GITHUB_HEAD_REF=v3.14.0" \
		--env "GITHUB_WORKSPACE=." \
		terrajux-action \
