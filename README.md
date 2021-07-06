[![CI](https://github.com/mdb/terrajux-action/actions/workflows/main.yml/badge.svg)](https://github.com/mdb/terrajux-action/actions/workflows/main.yml)

# terrajux-action

A [GitHub Action](https://github.com/features/actions) for executing [terrajux](https://github.com/rhenning/terrajux).

`terrajux-action` makes [Terraform](https://www.terraform.io) code review easier by reporting transitive module dependencies' [code diffs](https://en.wikipedia.org/wiki/Diff) alongside those associated with a [Terraform root module](https://www.terraform.io/docs/language/modules/index.html#the-root-module) edit.

## Inputs

### `git_url`

**required** The Terraform module git repository URL to pass as `<giturl>` to `terrajux`.

For common workflows, this might be `file://${{ github.workspace }}`. See [GitHub Actions `github` context](https://docs.github.com/en/actions/reference/context-and-expression-syntax-for-github-actions#github-context) for more information.

### `v1_ref`

**required** The GitHub Terraform module repository git ref to pass as `<v1ref>` to `terrajux`.

For common workflows, this might be `${{ github.ref }}`. See [GitHub Actions `github` context](https://docs.github.com/en/actions/reference/context-and-expression-syntax-for-github-actions#github-context) for more information.

### `v2_ref`

**required** The GitHub Terraform module repository git ref to pass as `<v2ref>` to `terrajux`.

For common workflows, this might be `${{ github.base_ref }}` or `${{ github.head_ref }}`. See [GitHub Actions `github` context](https://docs.github.com/en/actions/reference/context-and-expression-syntax-for-github-actions#github-context) for more information.

### `subpath`

The GitHub module repository subpath to pass as the `<subpath>` to `terrajux`. Defaults to `"."`.

### Example usage

A common configuration to run `terrajux` against a pull request might look like the following:

```yaml
- uses: actions/checkout@main
- uses: mdb/terrajux-action@main
  with:
    git_url: file://${{ github.workspace }}
    v1_ref: ${{ github.ref }}
    v2_ref: ${{ github.base_ref }}
```

...and would offer a diff view of all code differences -- including those amongst upstream Terraform module dependencies -- introduced by the pull request.

Alternatively, `terrajux-action` can be run using a pre-built container image, which tends to be a bit faster:

```yaml
- uses: actions/checkout@main
- uses: docker://registry.hub.docker.com/clapclapexcitement/terrajux-action:latest
  with:
    git_url: file://${{ github.workspace }}
    v1_ref: ${{ github.ref }}
    v2_ref: ${{ github.base_ref }}
```

See `terrajux-action`'s own `.github/workflows` for additional examples.

## TODO

* more robust tests
* associate changelog with each release
* experimental: research techniques for exiting nonzero based on "policy" violations
