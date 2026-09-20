# 🗄️ Sistema de Gestión de Base de Datos — Liga Deportiva (SQL & DER)

Proyecto final de **Base de Datos I** enfocado en el diseño, modelado conceptual, normalización hasta la Tercera Forma Normal (3FN) y la implementación física en MySQL de un sistema para la gestión de deportes de equipo, torneos, partidos y estadios.

---

## 🏛️ Estructura del Repositorio

- db-liga-deportiva/
  - sql/
    - esquema_deportes.sql
  - diagramas/
    - modelo_conceptual.png
    - modelo_logico_mysql.png
  - doc/
    - caso_estudio.txt
    - informe_modelado.docx
  - README.md

---

## 📋 Consigna y Requerimientos
El sistema modela la información de torneos, partidos, estadios, equipos (con sus respectivos cuerpos técnicos, directores técnicos y jugadores), árbitros, hinchas y personal de prensa. 
* 📌 *Podés leer el detalle completo de los requerimientos en:* `doc/caso_estudio.txt`

---

## 📊 Fases del Modelado y Diseño

### 1. Modelo Conceptual (DER)
Se desarrolló el diagrama entidad-relación identificando las entidades principales del dominio, cardinalidades y atributos multivaluados.
* 📌 *Ver imagen en:* `diagramas/modelo_conceptual.png`

### 2. Proceso de Normalización (Hasta 3FN)
* **1° Forma Normal (1FN):** Eliminación de atributos multivaluados y descomposición de atributos compuestos.
* **2° Forma Normal (2FN):** Verificación de dependencia funcional completa en tablas con claves compuestas.
* **3° Forma Normal (3FN):** Eliminación de dependencias transitivas. Se implementó una tabla asociativa `Partido_Equipo` para resolver la relación N:M y registrar la cantidad de goles.

### 3. Modelo Lógico Relacional
El esquema final normalizado consta de tablas estructuradas con sus respectivas Claves Primarias (PK) y Claves Foráneas (FK) para garantizar la integridad referencial.
* 📌 *Ver diagrama físico en:* `diagramas/modelo_logico_mysql.png`

---

## 💻 Script SQL (DDL)

El script completo de creación de la base de datos y sus tablas con restricciones de integridad (DDL) se encuentra en `sql/esquema_deportes.sql`.

### Instrucciones de Ejecución:
1. Clonar o descargar el repositorio.
2. Abrir tu gestor de base de datos MySQL (MySQL Workbench, phpMyAdmin, etc.)[cite: 3].
3. Ejecutar el script ubicado en `sql/esquema_deportes.sql` para generar la base de datos `Deportes` y todas sus relaciones de forma automatizada.

---

> 🎓 **Contexto académico:** Trabajo Práctico Final aprobado para la materia Base de Datos I — Carrera de Analista de Sistemas.
