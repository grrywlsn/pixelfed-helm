{{/* vim: set filetype=mustache: */}}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
*/}}
{{- define "pixelfed.fullname" -}}
{{- if .Values.fullnameOverride -}}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}
{{- define "pixelfed.secretNames" -}}
{{- $names := list -}}
{{- if .Values.existingSecret }}{{ $names = append $names .Values.existingSecret }}{{ end -}}
{{- range .Values.existingSecrets }}{{ $names = append $names . }}{{ end -}}
{{- if empty $names }}{{ $names = append $names (include "pixelfed.fullname" .) }}{{ end -}}
{{- join "," $names -}}
{{- end -}}
