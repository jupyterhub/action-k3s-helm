# How to make a release

This action is published to the [GitHub Actions Marketplace](https://github.com/marketplace/actions/k3s-with-calico-and-helm)

To make a release you need push rights to the [action-k3s-helm GitHub repository](https://github.com/jupyterhub/action-k3s-helm).

## Steps to make a release

1. Make sure `CHANGELOG.md` is up-to-date.

1. Create a new _GitHub release_ by clicking on `Draft a new release` https://github.com/jupyterhub/action-k3s-helm/releases
   and creating a new tag for `main`.
   Remember to prefix the tag with `v`, e.g. `v3.0.5`

1. Check everything again, then click `Publish release`.
   This will create a tag, and trigger a CI action to update the major (`v3`) pointer.
