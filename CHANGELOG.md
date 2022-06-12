## v3 - unreleased

- The action drops support for use with k8s 1.19 and lower.
- Calico bumped from 3.20 to 3.21 for when k3s 1.20 is used.
- Calico bumped from 3.20 to 3.23 for when k3s 1.21+ is used.

## v2

### v2.0.0 - 2021-10-04

With this version we drop support for k8s version 1.16 by bumping the installed
calico resources to version 3.20 that require k8s 1.17+. We also fix a critical
bug for anyone using this action and not explicitly disabling traefik to be
installed as an ingress controller via `traefik-enabled: false`.

#### Enhancements made

- Group emitted logs for readability [#31](https://github.com/jupyterhub/action-k3s-helm/pull/31) ([@consideRatio](https://github.com/consideRatio))

#### Bugs fixed

- Fix failing traefik install [#34](https://github.com/jupyterhub/action-k3s-helm/pull/34) ([@consideRatio](https://github.com/consideRatio))
- fix: restrict kubeconfig permissions to current user to avoid helm's warnings [#26](https://github.com/jupyterhub/action-k3s-helm/pull/26) ([@consideRatio](https://github.com/consideRatio))

#### Maintenance and upkeep improvements

- Bump calico 3.17 to 3.20 - drop support for k8s 1.16 [#29](https://github.com/jupyterhub/action-k3s-helm/pull/29) ([@consideRatio](https://github.com/consideRatio))

#### Documentation improvements

- Update README example [#35](https://github.com/jupyterhub/action-k3s-helm/pull/35) ([@consideRatio](https://github.com/consideRatio))

#### Continuous integration

- ci: ensure actions-tagger has the permissions to update branches/tags [#28](https://github.com/jupyterhub/action-k3s-helm/pull/28) ([@consideRatio](https://github.com/consideRatio))
- ci: emit a namespace report of kube-system on failure [#27](https://github.com/jupyterhub/action-k3s-helm/pull/27) ([@consideRatio](https://github.com/consideRatio))

#### Contributors to this release

([GitHub contributors page for this release](https://github.com/jupyterhub/action-k3s-helm/graphs/contributors?from=2021-01-15&to=2021-10-04&type=c))

[@consideRatio](https://github.com/search?q=repo%3Ajupyterhub%2Faction-k3s-helm+involves%3AconsideRatio+updated%3A2021-01-15..2021-10-04&type=Issues) | [@manics](https://github.com/search?q=repo%3Ajupyterhub%2Faction-k3s-helm+involves%3Amanics+updated%3A2021-01-15..2021-10-04&type=Issues)
