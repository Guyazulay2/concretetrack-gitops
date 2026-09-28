{{- define "ct.labels" -}}
app.kubernetes.io/part-of: concretetrack
app.kubernetes.io/managed-by: {{ .Release.Service }}
app.kubernetes.io/version: {{ .Values.image.tag | quote }}
{{- end }}

{{- define "ct.podSecurity" -}}
automountServiceAccountToken: false
securityContext:
  runAsNonRoot: true
  seccompProfile: {type: RuntimeDefault}
{{- end }}

{{- define "ct.containerSecurity" -}}
securityContext:
  allowPrivilegeEscalation: false
  readOnlyRootFilesystem: true
  capabilities: {drop: ["ALL"]}
{{- end }}
