{{- define "generateImageName" -}}
{{- if hasPrefix "sha256:" ( .Values.nginx.image.tag | toString ) }}
{{- printf "%v@%v" .Values.nginx.image.name .Values.nginx.image.tag }}
{{- else }}
{{- printf "%v:%v" .Values.nginx.image.name .Values.nginx.image.tag }}
{{- end }}
{{- end }}