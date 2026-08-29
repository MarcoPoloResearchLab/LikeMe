# LikeMe

Static site for `https://likeme.mprlab.com/`.

## Lifecycle

- `make release` validates the site and prepares a versioned Pages archive locally.
- `make publish` publishes the exact prepared archive as a GitHub Release asset.
- `make deploy` activates that published archive on the `gh-pages` branch and verifies the live release marker.

The repository-owned deployment command is `make deploy`. GitHub Pages is still configured to serve `main` until the one-time operator cutover to `gh-pages`; before that cutover, a default-branch push can still update the live site.
