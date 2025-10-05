{{/*
Expand the name of the chart.
*/}}
{{- define "basarr.name" -}}
{{- include "common.name" . -}}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "basarr.fullname" -}}
{{- include "common.fullname" . -}}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "basarr.chart" -}}
{{- include "common.chart" . -}}
{{- end }}

{{/*
Common labels
*/}}
{{- define "basarr.labels" -}}
{{- include "common.labels" . -}}
{{- end }}

{{/*
Exporter Common labels
*/}}
{{- define "basarr-exporter.labels" -}}
app.kubernetes.io/name: {{ include "basarr.fullname" . }}-exporter
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "basarr.selectorLabels" -}}
{{- include "common.selectorLabels" . -}}
{{- end }}

{{/*
Return the proper basarr image name
*/}}
{{- define "basarr.image" -}}
{{- include "common.image" (dict "image" .Values.image "global" .Values.global) -}}
{{- end }}

{{/*
Return the proper Docker Image Registry Secret Names
*/}}
{{- define "basarr.imagePullSecrets" -}}
{{ include "common.images.renderPullSecrets" (dict "images" (list .Values.image) "context" .) }}
{{- end -}}
{{/*
Get the secret name for basarr root password
*/}}
{{- define "basarr.secretName" -}}
{{- if .Values.auth.existingSecret }}
{{- .Values.auth.existingSecret }}
{{- else }}
{{- include lower "basarr.fullname" . }}
{{- end }}
{{- end }}

{{/*
Validate values of basarr - Authentication
*/}}
{{- define "basarr.validateValues.auth" -}}
{{/* No validation needed - empty rootPassword will trigger auto-generation */}}
{{- end }}

{{/*
Return the basarr ConfigMap Name
*/}}
{{- define "basarr.configMapName" -}}
{{- if .Values.config.existingConfigMap }}
{{- .Values.config.existingConfigMap }}
{{- else }}
{{- include "basarr.fullname" . }}
{{- end }}
{{- end }}

{{- define "chrt-6456.password" -}}
{{- randAlphaNum 24 | nospace -}}
{{- end -}}
