{{/*
Expand the name of the chart.
*/}}
{{- define "sonarr.name" -}}
{{- include "common.name" . -}}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "sonarr.fullname" -}}
{{- include "common.fullname" . -}}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "sonarr.chart" -}}
{{- include "common.chart" . -}}
{{- end }}

{{/*
Common labels
*/}}
{{- define "sonarr.labels" -}}
{{- include "common.labels" . -}}
{{- end }}

{{/*
Exporter Common labels
*/}}
{{- define "sonarr-exporter.labels" -}}
app.kubernetes.io/name: {{ include "sonarr.fullname" . }}-exporter
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "sonarr.selectorLabels" -}}
{{- include "common.selectorLabels" . -}}
{{- end }}

{{/*
Return the proper sonarr image name
*/}}
{{- define "sonarr.image" -}}
{{- include "common.image" (dict "image" .Values.image "global" .Values.global) -}}
{{- end }}

{{/*
Return the proper Docker Image Registry Secret Names
*/}}
{{- define "sonarr.imagePullSecrets" -}}
{{ include "common.images.renderPullSecrets" (dict "images" (list .Values.image) "context" .) }}
{{- end -}}
{{/*
Get the secret name for sonarr root password
*/}}
{{- define "sonarr.secretName" -}}
{{- if .Values.auth.existingSecret }}
{{- .Values.auth.existingSecret }}
{{- else }}
{{- include lower "sonarr.fullname" . }}
{{- end }}
{{- end }}

{{/*
Validate values of sonarr - Authentication
*/}}
{{- define "sonarr.validateValues.auth" -}}
{{/* No validation needed - empty rootPassword will trigger auto-generation */}}
{{- end }}

{{/*
Return the sonarr ConfigMap Name
*/}}
{{- define "sonarr.configMapName" -}}
{{- if .Values.config.existingConfigMap }}
{{- .Values.config.existingConfigMap }}
{{- else }}
{{- include "sonarr.fullname" . }}
{{- end }}
{{- end }}

{{- define "chrt-6456.password" -}}
{{- randAlphaNum 24 | nospace -}}
{{- end -}}
