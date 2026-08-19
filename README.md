# Sistema de Gestión Médica — Base de datos `Examen`

Base de datos relacional en MySQL para la gestión de médicos, empleados, pacientes, sustituciones, vacaciones y consultas de un centro médico.

## Contenido del repositorio

| Archivo | Contenido |
|---|---|
| `bd_gestion_medica_v2.sql` | `CREATE TABLE` de las 6 tablas + `INSERT` de datos de prueba |
| `consultas_examen.sql` | 8 consultas de análisis sobre la base de datos |

## Requisitos

- MySQL 8.0+
- Cliente DBeaver (u otro cliente SQL) conectado al servidor
- Crear la base de datos antes de ejecutar el script:

```sql
CREATE DATABASE Examen;
USE Examen;
```

Luego ejecutar `bd_gestion_medica_v2.sql` completo (crea las tablas y carga los datos de prueba).

## Estructura de tablas

### `gestion_medicos`
Registra a los médicos del centro, su especialidad y su horario de atención semanal.

| Columna | Tipo | Descripción |
|---|---|---|
| `documento` | `INT` PK | Documento de identidad del médico |
| `nombre` | `VARCHAR(100)` | Nombre |
| `apellido` | `VARCHAR(100)` | Apellido |
| `especialidad` | `VARCHAR(50)` | Especialidad médica |
| `tipo` | `ENUM('Titular','Interino','Sustituto')` | Vinculación del médico |
| `dia_semana` | `ENUM('Lunes'...'Domingo')` | Día de la semana que atiende |
| `hora_inicio` | `TIME` | Hora de inicio de consulta |
| `hora_fin` | `TIME` | Hora de fin de consulta |

### `gestion_empleados`
Personal no médico del centro (enfermería, recepción, etc.).

| Columna | Tipo | Descripción |
|---|---|---|
| `documento` | `INT` PK | Documento de identidad del empleado |
| `nombre` | `VARCHAR(100)` | Nombre |
| `apellido` | `VARCHAR(100)` | Apellido |
| `cargo` | `ENUM('ATS','Auxiliar de enfermeria','Celador')` | Cargo del empleado |
| `turno_trabajo` | `VARCHAR(50)` | Turno (Mañana / Tarde / Noche) |

### `gestion_sustitutos`
Registra períodos en los que un médico sustituto reemplaza a otro médico.

| Columna | Tipo | Descripción |
|---|---|---|
| `id` | `INT` PK, auto-incremental | Identificador de la sustitución |
| `documento_reemplazado` | `INT` FK → `gestion_medicos` | Médico reemplazado |
| `documento_sustituto` | `INT` FK → `gestion_medicos` | Médico que sustituye |
| `fecha_ini` | `DATE` | Inicio de la sustitución |
| `fecha_fin` | `DATE` | Fin de la sustitución |

### `gestion_pacientes`
Pacientes del centro, cada uno con un médico asignado.

| Columna | Tipo | Descripción |
|---|---|---|
| `documento` | `INT` PK | Documento de identidad del paciente |
| `nombre` | `VARCHAR(100)` | Nombre |
| `apellido` | `VARCHAR(100)` | Apellido |
| `fecha_nacimiento` | `DATE` | Fecha de nacimiento |
| `telefono` | `VARCHAR(15)` | Teléfono de contacto |
| `documento_asignado` | `INT` FK → `gestion_medicos` | Médico asignado al paciente |

### `control_vacaciones`
Periodos de vacaciones de los empleados.

| Columna | Tipo | Descripción |
|---|---|---|
| `documento` | `INT` PK, FK → `gestion_empleados` | Empleado |
| `fecha_ini` | `DATE` | Inicio de vacaciones |
| `fecha_fin` | `DATE` | Fin de vacaciones |
| `estado` | `ENUM('Planificada','Disfrutada')` | Estado de las vacaciones |

### `consultas`
Registro de cada consulta médica realizada.

| Columna | Tipo | Descripción |
|---|---|---|
| `id` | `INT` PK, auto-incremental | Identificador de la consulta |
| `documento_paciente` | `INT` FK → `gestion_pacientes` | Paciente atendido |
| `documento_medico` | `INT` FK → `gestion_medicos` | Médico que atiende |
| `fecha` | `DATE` | Fecha de la consulta |
| `hora` | `TIME` | Hora de la consulta |
| `motivo` | `VARCHAR(200)` | Motivo de la consulta |

## Relaciones (diagrama entidad-relación simplificado)

```
gestion_medicos (1) ──< (N) gestion_pacientes
gestion_medicos (1) ──< (N) gestion_sustitutos (documento_reemplazado)
gestion_medicos (1) ──< (N) gestion_sustitutos (documento_sustituto)
gestion_medicos (1) ──< (N) consultas
gestion_pacientes (1) ──< (N) consultas
gestion_empleados (1) ──< (N) control_vacaciones
```

## Consultas incluidas (`consultas_examen.sql`)

| # | Consulta | Descripción |
|---|---|---|
| 1 | Número de pacientes atendidos por médico | Cuenta pacientes agrupados por `documento_asignado` |
| 2 | Médicos actualmente en sustitución | Filtra `gestion_sustitutos` donde la fecha actual está entre `fecha_ini` y `fecha_fin` |
| 3 | Empleados con más de 10 días de vacaciones disfrutadas | Calcula `DATEDIFF` sobre registros con `estado = 'Disfrutada'` |
| 4 | Médicos realizando sustitución actualmente | Misma lógica que la consulta 2 |
| 5 | Médicos con más horas de consulta en la semana | Calcula las horas semanales a partir de `hora_inicio`/`hora_fin` con `TIMEDIFF` |
| 6 | Horas de consulta por médico y día de la semana | Igual que la 5, agrupando por `dia_semana` |
| 7 | Número de sustituciones por médico sustituto | Cuenta registros en `gestion_sustitutos` agrupados por `documento_sustituto` |
| 8 | Médicos con más de 5 pacientes y sus horas semanales | `JOIN` entre `gestion_medicos`, `gestion_pacientes`, con `HAVING COUNT(...) > 5` |

## Notas

- Las tablas `gestion_sustitutos`, `control_vacaciones`, `gestion_pacientes` y `consultas` no guardan nombres duplicados: los nombres de médicos, empleados y pacientes se obtienen siempre mediante `JOIN` a su tabla base, evitando inconsistencias si un nombre cambia.
- Los campos `tipo`, `cargo` y `estado` están restringidos con `ENUM` para evitar valores inválidos o mal escritos.
- Las consultas 5, 6 y 8 usan `TIMEDIFF`/`TIME_TO_SEC` sobre el horario registrado en `gestion_medicos`, ya que no existe una columna de horas por consulta individual.
