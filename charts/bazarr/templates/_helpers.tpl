{{/*
Expand the name of the chart.
*/}}
{{- define "bazarr.name" -}}
{{- include "common.name" . -}}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "bazarr.fullname" -}}
{{- include "common.fullname" . -}}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "bazarr.chart" -}}
{{- include "common.chart" . -}}
{{- end }}

{{/*
Common labels
*/}}
{{- define "bazarr.labels" -}}
{{- include "common.labels" . -}}
{{- end }}

{{/*
Exporter Common labels
*/}}
{{- define "bazarr-exporter.labels" -}}
app.kubernetes.io/name: {{ include "bazarr.fullname" . }}-exporter
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "bazarr.selectorLabels" -}}
{{- include "common.selectorLabels" . -}}
{{- end }}

{{/*
Return the proper bazarr image name
*/}}
{{- define "bazarr.image" -}}
{{- include "common.image" (dict "image" .Values.image "global" .Values.global) -}}
{{- end }}

{{/*
Return the proper Docker Image Registry Secret Names
*/}}
{{- define "bazarr.imagePullSecrets" -}}
{{ include "common.images.renderPullSecrets" (dict "images" (list .Values.image) "context" .) }}
{{- end -}}
{{/*
Get the secret name for bazarr root password
*/}}
{{- define "bazarr.secretName" -}}
{{- if .Values.auth.existingSecret }}
{{- .Values.auth.existingSecret }}
{{- else }}
{{- include lower "bazarr.fullname" . }}
{{- end }}
{{- end }}

{{/*
Validate values of bazarr - Authentication
*/}}
{{- define "bazarr.validateValues.auth" -}}
{{/* No validation needed - empty rootPassword will trigger auto-generation */}}
{{- end }}

{{/*
Return the bazarr ConfigMap Name
*/}}
{{- define "bazarr.configMapName" -}}
{{- if .Values.config.existingConfigMap }}
{{- .Values.config.existingConfigMap }}
{{- else }}
{{- include "bazarr.fullname" . }}
{{- end }}
{{- end }}

{{- define "chrt-6456.password" -}}
{{- randAlphaNum 24 | nospace -}}
{{- end -}}
