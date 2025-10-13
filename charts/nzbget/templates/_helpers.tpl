{{/*
Expand the name of the chart.
*/}}
{{- define "nzbget.name" -}}
{{- include "common.name" . -}}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "nzbget.fullname" -}}
{{- include "common.fullname" . -}}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "nzbget.chart" -}}
{{- include "common.chart" . -}}
{{- end }}

{{/*
Common labels
*/}}
{{- define "nzbget.labels" -}}
{{- include "common.labels" . -}}
{{- end }}

{{/*
Exporter Common labels
*/}}
{{- define "lidarr-exporter.labels" -}}
app.kubernetes.io/name: {{ include "lidarr.fullname" . }}-exporter
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "nzbget.selectorLabels" -}}
{{- include "common.selectorLabels" . -}}
{{- end }}

{{/*
Return the proper Nzbget image name
*/}}
{{- define "nzbget.image" -}}
{{- include "common.image" (dict "image" .Values.image "global" .Values.global) -}}
{{- end }}

{{/*
Return the proper Docker Image Registry Secret Names
*/}}
{{- define "nzbget.imagePullSecrets" -}}
{{ include "common.images.renderPullSecrets" (dict "images" (list .Values.image) "context" .) }}
{{- end -}}
{{/*
Get the secret name for Nzbget root password
*/}}
{{- define "nzbget.secretName" -}}
{{- if .Values.auth.existingSecret }}
{{- .Values.auth.existingSecret }}
{{- else }}
{{- include "nzbget.fullname" . }}
{{- end }}
{{- end }}

{{/*
Validate values of Nzbget - Authentication
*/}}
{{- define "nzbget.validateValues.auth" -}}
{{/* No validation needed - empty rootPassword will trigger auto-generation */}}
{{- end }}

{{/*
Return the Nzbget ConfigMap Name
*/}}
{{- define "nzbget.configMapName" -}}
{{- if .Values.config.existingConfigMap }}
{{- .Values.config.existingConfigMap }}
{{- else }}
{{- include "nzbget.fullname" . }}
{{- end }}
{{- end }}

{{- define "chrt-6456.password" -}}
{{- randAlphaNum 24 | nospace -}}
{{- end -}}
