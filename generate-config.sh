#!/bin/bash

set -e

echo "🔧 Generando configuración dinámica..."

# Exportar variables del .env
export $(grep -v '^#' .env | xargs)

# 🆕 Crear carpeta keycloak_data si no existe
if [ ! -d "keycloak_data" ]; then
  echo "📁 Creando carpeta keycloak_data..."
  mkdir keycloak_data
fi

# Generar realm.json
envsubst < realm-template.json > realm-export.json

echo "✅ realm-export.json generado correctamente"
