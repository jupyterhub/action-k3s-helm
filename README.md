# GitHub Action: Install K3s, Calico and Helm
[![GitHub Action badge](https://github.com/manics/action-k3s-helm/workflows/Test/badge.svg)](https://github.com/manics/action-k3s-helm/actions)

Install K3s with Calico for network policies, and Helm 3.


## Optional input parameters
- `k3s-version`: K3s version, see https://github.com/rancher/k3s/releases.
   Versions 1.16 and later are supported.
- `helm-version`: Helm version, see https://github.com/helm/helm/releases.
   Versions 3.1 and later are supported.
- `metrics-enabled`: Enable or disable K3S metrics-server, `true` (default) or `false`
- `traefik-enabled`: Enable or disable K3S Traefik ingress, `true` (default) or `false`
- `docker-enabled`: Use Docker for K3s, `true` or `false` (default)


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


This is based on https://github.com/jupyterhub/zero-to-jupyterhub-k8s/blob/08c13609c1d0c6cb07d45d49d0a876100cf941eb/ci/common by [@consideratio](https://github.com/consideratio).
