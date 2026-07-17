# 📚 Repositorio Académico — Ingeniería Civil en Informática UACh

Material académico de la carrera de Ingeniería Civil en Informática de la Universidad Austral de Chile, recopilado y mantenido por el **Centro de Estudiantes (CEE)** y sus colaboradores.

Aquí encontrarás apuntes, presentaciones, guías, programas de curso y material de apoyo de las asignaturas, organizado según la malla curricular.

## 🗂 Estructura

```
Repositorio Académico Informática/
├── Ciencias Básicas/                 ← asignaturas BAIN / DYRE (matemáticas, física, química, idiomas…)
│   └── BAIN091 - Estadística y Probabilidades para Ingeniería/
│       └── 2025-2/                   ← material del período (año-semestre) en que se cursó
│           └── ...
├── Informática/                      ← asignaturas INFO / EICI / optativos, por semestre de la malla
│   ├── Semestre 01/
│   │   ├── INFO063 - Introducción a la Programación/
│   │   └── ...
│   ├── ...
│   └── Semestre 11/
└── Sin Clasificar/                   ← cursos fuera de la malla (optativos con código propio, talleres, etc.)
```

Convenciones:

- **Carpeta de asignatura**: `CÓDIGO - Nombre Oficial` (p. ej. `INFO245 - Interacción Humano-Computador`).
- **Carpeta de período**: `AÑO-SEMESTRE` (p. ej. `2026-1` = primer semestre de 2026). Cada cohorte tiene su propia carpeta, porque el material cambia entre años.
- Los nombres de archivo se conservan tal como los publicó el docente.

## 🤝 Cómo contribuir

### Opción A — automática (recomendada)

Usa la herramienta [siveduc-dl](https://github.com/CEE-Informatica-UACh/siveduc-dl) del CEE:

```bash
# en el repositorio del scraper
npm run login     # sesión con TU cuenta SIVEDUC
npm run crawl
npm run scrape
npm run export -- --dest "ruta/a/Repositorio Académico Informática"
```

`export` deposita automáticamente lo descargado en la carpeta correcta según la malla, **sin sobreescribir** lo que ya exista. Después solo haz commit y pull request:

```bash
git checkout -b aporte/<tu-usuario>
git add .
git commit -m "Aporte: INFO245 2026-1, INFO248 2026-1"
git push origin aporte/<tu-usuario>
```

### Opción B — manual

Copia tus archivos respetando la estructura: `Área / [Semestre NN /] CÓDIGO - Nombre / AÑO-SEMESTRE / archivo`.

### Reglas

1. Solo material al que accediste **legítimamente** como estudiante del curso.
2. No subas material con datos personales de terceros (listas de notas, correos, etc.).
3. No sobreescribas archivos existentes; si hay una versión nueva, agrégala con sufijo (`v2`, año, etc.).
4. Archivos de máximo 100 MB (límite de GitHub).
5. Certámenes y pruebas: solo si el docente los publicó o autorizó su difusión.

## ⚖️ Uso responsable

El material docente tiene derechos de autor de sus profesores/as. Este repositorio existe para **apoyar el estudio de los estudiantes de la carrera**: úsalo con fines académicos y no redistribuyas su contenido fuera de ese contexto. Si eres docente y quieres que se retire algún material, contacta al CEE y será removido de inmediato.

## 🏛 Mantenido por

Centro de Estudiantes de Ingeniería Civil en Informática — Universidad Austral de Chile.
