# NZBGet Helm Chart

This Helm chart deploys [NZBGet](https://nzbget.net/) on Kubernetes with flexible configuration options for development and production environments.

---

## Installing the Chart

To install the chart with the release name `my-nzbget`:

```bash
helm install nzbget https://pascal0030.github.io/helm-charts/
```

To install with custom values:

```bash
helm install nzbget https://pascal0030.github.io/helm-charts/ -f my-values.yaml
```

To uninstall/delete the `nzbget` deployment:

```bash
helm uninstall nzbget
```

---

## Configuration

The following table lists the configurable parameters of the NZBGet chart and their default values.

| Parameter                        | Description                                         | Default                |
| --------------------------------- | --------------------------------------------------- | ---------------------- |
| `image.repository`                | NZBGet image repository                             | `linuxserver/nzbget`   |
| `image.tag`                       | NZBGet image tag                                    | `""`                   |
| `image.pullPolicy`                | NZBGet image pull policy                            | `Always`               |
| `auth.username`                   | NZBGet web UI username                              | `admin`                |
| `auth.createSecret`               | Automatically create a secret for credentials        | `true`                 |
| `auth.existingSecret`             | Name of existing secret for credentials             | `""`                   |
| `config.existingConfigMap`        | Existing ConfigMap with NZBGet configuration        | `""`                   |
| `config.existingSecret`           | Existing secret with NZBGet configuration           | `""`                   |
| `config.nzbgetconfig`             | Custom configuration for NZBGet (nzbget.conf)       | See `values.yaml`      |
| `service.type`                    | Kubernetes service type                             | `ClusterIP`            |
| `service.port`                    | Service port                                        | `6789`                 |
| `persistence.enabled`             | Enable data persistence                             | `false`                |
| `persistence.size`                | PVC storage size                                    | `1Gi`                  |
| `persistence.accessModes`         | PVC access modes                                    | `[ReadWriteOnce]`      |
| `resources`                       | Resource requests and limits                        | `{}`                   |
| `env`                             | Additional environment variables                    | `[]`                   |
| `extraSecrets`                    | Additional secrets to mount                         | `[]`                   |
| `extraConfigs`                    | Additional configMaps to mount                      | `[]`                   |
| `extraVolumes`                    | Additional PVCs to mount                            | `[]`                   |
| `livenessProbe.enabled`           | Enable liveness probe                               | `true`                 |
| `readinessProbe.enabled`          | Enable readiness probe                              | `true`                 |
| `startupProbe.enabled`            | Enable startup probe                                | `false`                |
| `ingress.enabled`                 | Enable ingress                                      | `false`                |
| `ingress.hosts`                   | Ingress hosts and paths                             | See `values.yaml`      |
| `networkPolicy.enabled`           | Enable NetworkPolicy                                | `false`                |
| `podAnnotations`                  | Additional pod annotations                          | `{}`                   |
| `podLabels`                       | Additional pod labels                               | `{}`                   |
| `nodeSelector`                    | Node selector                                       | `{}`                   |
| `tolerations`                     | Tolerations                                         | `[]`                   |
| `affinity`                        | Affinity                                            | `{}`                   |

See `values.yaml` for a full list and detailed configuration.

---

## Example: Basic Installation

Create a `values.yaml` file:

```yaml
auth:
  username: "myuser"

persistence:
  enabled: true
  size: 10Gi
```

Install the chart:

```bash
helm install my-nzbget charts/nzbget -f values.yaml
```

---

## Example: Ingress

```yaml
ingress:
  enabled: true
  hosts:
    - host: nzbget.local
      paths:
        - path: /
          pathType: Prefix
```

---

## Links

- [NZBGet Official Site](https://nzbget.net/)
