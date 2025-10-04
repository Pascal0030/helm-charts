{{/*
Expand the name of the chart.
*/}}
{{- define "radarr.name" -}}
{{- include "common.name" . -}}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "radarr.fullname" -}}
{{- include "common.fullname" . -}}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "radarr.chart" -}}
{{- include "common.chart" . -}}
{{- end }}

{{/*
Common labels
*/}}
{{- define "radarr.labels" -}}
{{- include "common.labels" . -}}
{{- end }}

{{/*
Exporter Common labels
*/}}
{{- define "radarr-exporter.labels" -}}
app.kubernetes.io/name: {{ include "radarr.fullname" . }}-exporter
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "radarr.selectorLabels" -}}
{{- include "common.selectorLabels" . -}}
{{- end }}

{{/*
Return the proper radarr image name
*/}}
{{- define "radarr.image" -}}
{{- include "common.image" (dict "image" .Values.image "global" .Values.global) -}}
{{- end }}

{{/*
Return the proper Docker Image Registry Secret Names
*/}}
{{- define "radarr.imagePullSecrets" -}}
{{ include "common.images.renderPullSecrets" (dict "images" (list .Values.image) "context" .) }}
{{- end -}}
{{/*
Get the secret name for radarr root password
*/}}
{{- define "radarr.secretName" -}}
{{- if .Values.auth.existingSecret }}
{{- .Values.auth.existingSecret }}
{{- else }}
{{- include lower "radarr.fullname" . }}
{{- end }}
{{- end }}

{{/*
Validate values of radarr - Authentication
*/}}
{{- define "radarr.validateValues.auth" -}}
{{/* No validation needed - empty rootPassword will trigger auto-generation */}}
{{- end }}

{{/*
Return the radarr ConfigMap Name
*/}}
{{- define "radarr.configMapName" -}}
{{- if .Values.config.existingConfigMap }}
{{- .Values.config.existingConfigMap }}
{{- else }}
{{- include "radarr.fullname" . }}
{{- end }}
{{- end }}

{{- define "chrt-6456.password" -}}
{{- randAlphaNum 24 | nospace -}}
{{- end -}}
