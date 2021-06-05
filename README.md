[![CI](https://github.com/mdb/terrajux-action/actions/workflows/main.yml/badge.svg)](https://github.com/mdb/terrajux-action/actions/workflows/main.yml)

# terrajux-action

A [GitHub Action](https://github.com/features/actions) for executing [terrajux](https://github.com/rhenning/terrajux).

`terrajux-action` visualizes all code differences introduced by a Terraform module change, including those of upstream module dependencies.

## Inputs

### `repo`

**required** The GitHub Terraform module repository to pass as `<giturl>` to `terrajux`. Specified in `username/repository` format.

For common workflows, this might be `${{ env.GITHUB_REPOSITORY }}`. See [GitHub Actions default environment variables](https://docs.github.com/en/actions/reference/environment-variables#default-environment-variables) for more information.

### `v1ref`

**required** The GitHub Terraform module repository git ref to pass as `<v1ref>` to `terrajux`.

For common workflows, this might be `${{ env.GITHUB_REF }}`. See [GitHub Actions default environment variables](https://docs.github.com/en/actions/reference/environment-variables#default-environment-variables) for more information.

### `v2ref`

**required** The GitHub Terraform module repository git ref to pass as `<v2ref>` to `terrajux`.

For common workflows, this might be `${{ env.GITHUB_HEAD_REF }}` or `${{ env.GITHUB_BASE_REF }}`. See [GitHub Actions default environment variables](https://docs.github.com/en/actions/reference/environment-variables#default-environment-variables) for more information.

### `subpath`

The GitHub module repository subpath to pass as the `<subpath>` to `terrajux`. Defaults to `"."`.

### Example usage

A common configuration to run `terrajux` against a pull request might look like the following:

```yaml
- uses: mdb/terrajux-action@main
  with:
    repo: ${{ env.GITHUB_REPOSITORY }}
    v1ref: ${{ env.GITHUB_REF }}
    v2ref: ${{ env.GITHUB_HEAD_REF }}
```

...and would offer a diff view of all code differences -- including those amongst upstream Terraform module dependencies -- introduced by the pull request.

See `terrajux-action`'s own `.github/workflows` for additional examples.

## TODO

* more robust tests
* research the use of [actions/checkout](https://github.com/actions/checkout) rather than tasking `terrajux` to `git clone`
* associate changelog with each release
* experimental: research techniques for exiting nonzero based on "policy" violations
