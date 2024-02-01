# GitHub Action: Install K3s, Calico and Helm

[![GitHub Action badge](https://github.com/jupyterhub/action-k3s-helm/workflows/Test/badge.svg)](https://github.com/jupyterhub/action-k3s-helm/actions)

Creates a Kubernetes cluster using [K3s](https://k3s.io/) (1.24+) with
[Calico](https://www.projectcalico.org/) (3.27.0) for
[NetworkPolicy](https://kubernetes.io/docs/concepts/services-networking/network-policies/)
enforcement, and installs [Helm 3](https://helm.sh/) (3.5+).

## Optional input parameters

- `k3s-version` or `k3s-channel`: Specify a K3s [version](https://github.com/rancher/k3s/releases) or [release channel](https://update.k3s.io/v1-release/channels). Versions 1.24 and later are supported. Defaults to the stable channel.
- `helm-version`: Specify a Helm [version](https://github.com/helm/helm/releases). Versions 3.1 and later are supported. Defaults to the latest version.
- `metrics-enabled`: Enable or disable K3S metrics-server, `true` (default) or `false`.
- `traefik-enabled`: Enable or disable K3S Traefik ingress, `true` (default) or `false`.
- `docker-enabled`: Enable K3s to use the Docker daemon, `true` or `false` (default).
- `extra-setup-args`: Extra arguments passed unquoted to the K3s setup script, use this if you require advanced customisation.

## Outputs

- `kubeconfig`: The absolute path to the kubeconfig file (`$HOME/.kube/config`).
  The `KUBECONFIG` environment variable is also set by this action but may be removed in a future breaking release.
- `k3s-version`: Installed k3s version, such as v1.29.0+k3s1
- `k8s-version`: Installed k8s version, such as v1.29.0
- `calico-version`: Installed calico version, such as v3.27.0
- `helm-version`: Installed helm version, such as v3.13.0

## Example

```yaml
name: Example workflow

on:
  pull_request:
  push:
  workflow_dispatch:

jobs:
  k8s-test:
    runs-on: ubuntu-22.04
    steps:
      # GitHub Action reference: https://github.com/jupyterhub/action-k3s-helm
      - name: Start a local k8s cluster
        uses: jupyterhub/action-k3s-helm@v4
        with:
          # See available:
          # - k3s release channels at https://github.com/k3s-io/k3s/blob/HEAD/channel.yaml
          # - k3s versions at https://github.com/k3s-io/k3s/tags
          # - helm versions at https://github.com/helm/helm/tags
          k3s-channel: latest
          # k3s-version: v1.29.0+k3s1
          # helm-version: v3.13.0

      - name: Verify function of k8s, kubectl, and helm
        run: |
          echo "kubeconfig: $KUBECONFIG"
          kubectl version
          kubectl get pods --all-namespaces

          helm version
          helm list
```

## Development

This is based on https://github.com/jupyterhub/zero-to-jupyterhub-k8s/blob/08c13609c1d0c6cb07d45d49d0a876100cf941eb/ci/common by [@consideratio](https://github.com/consideratio).

This action aims to to provide an easy to use Kubernetes cluster with the following features:

- K3s
- Helm 3+
- Calico network provider that supports network policies

A small number of features are configurable.
All K3s defaults are kept except where they conflict with the deployment of Calico.
Due to the difficulty in comprehensively testing this action the aim is to minimise the number of arguments.
If you have an advanced use case hopefully `extra-setup-args` will be sufficient.
