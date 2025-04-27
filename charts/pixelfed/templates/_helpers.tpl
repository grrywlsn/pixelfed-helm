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

{{/*
Use the release name of this chart to override the name of the Redis subchart.
Doing this allows multiple Pixelfed charts and Redis subcharts to be installed in one namespace without clashing.
*/}}
{{- $redisFullnameOverride := printf "%s-redis" .Release.Name }}
{{- if .Values.redis.internal }}
{{- include "redis" (mergeOverwrite (deepCopy .Values.redis) (dict "fullnameOverride" $redisFullnameOverride)) }}
{{- end }}