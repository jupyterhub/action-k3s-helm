# GitHub Action: Install K3s, Calico and Helm
[![GitHub Action badge](https://github.com/manics/action-k3s-helm/workflows/Test/badge.svg)](https://github.com/manics/action-k3s-helm/actions)

Install K3s (1.16+), Calico (3.17) for network policy enforcement, and Helm (3.1+).


## Optional input parameters
- `k3s-version` or `k3s-channel`: Specify a K3s [version](https://github.com/rancher/k3s/releases) or [release channel](https://update.k3s.io/v1-release/channels). Versions 1.16 and later are supported. Defaults to the stable channel.
- `helm-version`: Specify a Helm [version](https://github.com/helm/helm/releases). Versions 3.1 and later are supported. Defaults to the latest version.
- `metrics-enabled`: Enable or disable K3S metrics-server, `true` (default) or `false`.
- `traefik-enabled`: Enable or disable K3S Traefik ingress, `true` (default) or `false`.
- `docker-enabled`: Enable K3s to use the Docker daemon, `true` or `false` (default).
- `extra-setup-args`: Extra arguments passed unquoted to the K3s setup script, use this if you require advanced customisation.


## Outputs
- `kubeconfig`: The path to the kube-config file.
The `KUBECONFIG` environment variable is also set by this action.


## Example
```
name: Example
on: push

jobs:
  build:
    runs-on: ubuntu-latest
    name: Install K3s
    steps:
      - id: k3s
        uses: manics/action-k3s-helm@main
        with:
          k3s-version: v1.19.3+k3s1
          helm-version: v3.3.4
      - run: |
          echo "kubeconfig: $KUBECONFIG"
          kubectl get pods --all-namespaces
          helm list
        shell: bash
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
