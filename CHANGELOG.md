## v3

### v3.0.3 - 2022-09-13

#### Bugs fixed

- Fix workaround added in 3.0.1 and adjusted in 3.0.2 [#69](https://github.com/jupyterhub/action-k3s-helm/pull/69) ([@consideRatio](https://github.com/consideRatio))

### v3.0.2 - 2022-09-13

#### Bugs fixed

- Apply workaround added in 3.0.1 only when possible [#67](https://github.com/jupyterhub/action-k3s-helm/pull/67) ([@consideRatio](https://github.com/consideRatio))

### v3.0.1 - 2022-09-12

#### Bugs fixed

- Workaround kubectl exec and kubectl logs issues with k3s [#64](https://github.com/jupyterhub/action-k3s-helm/pull/64) ([@consideRatio](https://github.com/consideRatio))

#### Maintenance and upkeep improvements

- Update cri-dockerd from 0.2.3 to 0.2.5 [#66](https://github.com/jupyterhub/action-k3s-helm/pull/66) ([@consideRatio](https://github.com/consideRatio))
- Update cri-dockerd from 0.2.2 to 0.2.3 [#61](https://github.com/jupyterhub/action-k3s-helm/pull/61) ([@consideRatio](https://github.com/consideRatio))

#### Documentation improvements

- docs: fix readme example to use v3 [#60](https://github.com/jupyterhub/action-k3s-helm/pull/60) ([@consideRatio](https://github.com/consideRatio))

### v3.0.0 - 2022-06-13

#### Breaking changes

- The action drops support for use with k8s 1.19 and lower.
- Calico bumped from 3.20 to 3.21 for when k3s 1.20 is used.
- Calico bumped from 3.20 to 3.23 for when k3s 1.21+ is used.
- The `docker-enabled` input now provides
  [cri-dockerd](https://github.com/Mirantis/cri-dockerd) and configures k3s for
  use against it, and like this we retain support for it with k3s version 1.24+.

#### Bugs fixed

- Make cri-dockerd function with calico [#54](https://github.com/jupyterhub/action-k3s-helm/pull/54) ([@consideRatio](https://github.com/consideRatio))

#### Maintenance and upkeep improvements

- Install and use cri-dockerd as a dockershim for k8s 1.24+ support [#51](https://github.com/jupyterhub/action-k3s-helm/pull/51) ([@consideRatio](https://github.com/consideRatio))
- ci: keep v1/v2/v3... tags updated instead of branches [#45](https://github.com/jupyterhub/action-k3s-helm/pull/45) ([@consideRatio](https://github.com/consideRatio))
- Drop support for k3s 1.19 or lower, bump calico to 3.21 for k3s 1.20, and calico 3.23 for k3s 1.21+ [#43](https://github.com/jupyterhub/action-k3s-helm/pull/43) ([@consideRatio](https://github.com/consideRatio))

#### Documentation improvements

- Fix some incorrect versions which were modified in v2 [#38](https://github.com/jupyterhub/action-k3s-helm/pull/38) ([@manics](https://github.com/manics))
- Add changelog for 2.0.0 [#36](https://github.com/jupyterhub/action-k3s-helm/pull/36) ([@consideRatio](https://github.com/consideRatio))

#### Continuous integration

- ci: test network policies in more situations [#52](https://github.com/jupyterhub/action-k3s-helm/pull/52) ([@consideRatio](https://github.com/consideRatio))
- ci: test against k3s-channel=latest and use k8s-namespace-report [#50](https://github.com/jupyterhub/action-k3s-helm/pull/50) ([@consideRatio](https://github.com/consideRatio))
- ci: use pre-commit.ci and dependabot [#46](https://github.com/jupyterhub/action-k3s-helm/pull/46) ([@consideRatio](https://github.com/consideRatio))

#### Contributors to this release

([GitHub contributors page for this release](https://github.com/jupyterhub/action-k3s-helm/graphs/contributors?from=2021-10-05&to=2022-06-13&type=c))

[@consideRatio](https://github.com/search?q=repo%3Ajupyterhub%2Faction-k3s-helm+involves%3AconsideRatio+updated%3A2021-10-05..2022-06-13&type=Issues) | [@manics](https://github.com/search?q=repo%3Ajupyterhub%2Faction-k3s-helm+involves%3Amanics+updated%3A2021-10-05..2022-06-13&type=Issues)

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
