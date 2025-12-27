# bazarr Helm Chart

This Helm chart deploys [bazarr](https://bazarr.net/) on Kubernetes with flexible configuration options for development and production environments.

---

## Installing the Chart

To install the chart with the release name `my-bazarr`:

```bash
helm install bazarr https://pascal0030.github.io/helm-charts/
```

To install with custom values:

```bash
helm install bazarr https://pascal0030.github.io/helm-charts/ -f my-values.yaml
```

To uninstall/delete the `bazarr` deployment:

```bash
helm uninstall bazarr
```

---

## Configuration

The following table lists the configurable parameters of the bazarr chart and their default values.

| Parameter                        | Description                                         | Default                |
| --------------------------------- | --------------------------------------------------- | ---------------------- |
| `image.repository`                | bazarr image repository                             | `linuxserver/bazarr`   |
| `image.tag`                       | bazarr image tag                                    | `latest`               |
| `image.pullPolicy`                | bazarr image pull policy                            | `Always`               |
| `config.sidecarContainer`         | Enable sidecar container for API key export         | `true`                 |
| `config.secretName`               | Secret name for API key                             | `bazarr-api-key`       |
| `service.type`                    | Kubernetes service type                             | `ClusterIP`            |
| `service.port`                    | Service port                                        | `7878`                 |
| `persistence.enabled`             | Enable data persistence                             | `true`                 |
| `persistence.size`                | PVC storage size                                    | `2Gi`                  |
| `persistence.accessModes`         | PVC access modes                                    | `[ReadWriteOnce]`      |
| `resources`                       | Resource requests and limits                        | `{}`                   |
| `env`                             | Additional environment variables                    | `[]`                   |
| `extraSecrets`                    | Additional secrets to mount                         | `[]`                   |
| `extraVolumes`                    | Additional PVCs to mount                            | `[]`                   |
| `nfsVolumes`                      | Additional NFS volumes to mount                     | `[]`                   |
| `livenessProbe.enabled`           | Enable liveness probe                               | `true`                 |
| `readinessProbe.enabled`          | Enable readiness probe                              | `true`                 |
| `startupProbe.enabled`            | Enable startup probe                                | `false`                |
| `ingress.enabled`                 | Enable ingress                                      | `false`                |
| `ingress.hosts`                   | Ingress hosts and paths                             | See `values.yaml`      |
| `networkPolicy.enabled`           | Enable NetworkPolicy                                | `false`                |
| `networkPolicy.destinations.nzbget.Port` | Allow traffic to NZBGet on this port         | `6789`                 |
| `networkPolicy.destinations.nzbget.selectorLabels` | Selector labels for NZBGet destination | `{}`                   |
| `metrics.enabled`                 | Enable the bazarr metrics exporter deployment       | `false`                |
| `metrics.image.repository`        | Metrics exporter image repository                   | `onedr0p/exportarr`    |
| `metrics.apiKey`                  | API key for bazarr metrics exporter                 | `""`                   |
| `metrics.serviceMonitor.enabled`  | Create a ServiceMonitor for metrics exporter        | `false`                |
| `metrics.service.port`            | Port the metrics exporter listens on                | `9707`                 |
| `metrics.containerPort`           | Port the metrics exporter container listens on      | `9707`                 |
| `metrics.resources`               | Resource requests/limits for metrics exporter       | `{}`                   |
| `podAnnotations`                  | Additional pod annotations                          | `{}`                   |
| `podLabels`                       | Additional pod labels                               | `{}`                   |
| `nodeSelector`                    | Node selector                                       | `{}`                   |
| `tolerations`                     | Tolerations                                         | `[]`                   |
| `affinity`                        | Affinity                                            | `{}`                   |
| `route.main.enabled`              | Enable Gateway API HTTPRoute creation via templates | `true`                 |
| `route.main.hostnames`            | Hostnames the HTTPRoute should match                | See `values.yaml`      |
| `route.main.parentRefs`           | Gateway parentRefs to attach the HTTPRoute to       | See `values.yaml`      |

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
helm install my-bazarr charts/bazarr -f values.yaml
```

---

## Example: Ingress

```yaml
ingress:
  enabled: true
  hosts:
    - host: bazarr.local
      paths:
        - path: /
          pathType: Prefix
```

---

## Links

- [bazarr Official Site](https://bazarr.net/)
