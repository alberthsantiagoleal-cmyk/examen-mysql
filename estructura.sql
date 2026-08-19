DROP TABLE IF EXISTS consultas;
DROP TABLE IF EXISTS control_vacaciones;
DROP TABLE IF EXISTS gestion_sustitutos;
DROP TABLE IF EXISTS gestion_pacientes;
DROP TABLE IF EXISTS gestion_empleados;
DROP TABLE IF EXISTS gestion_medicos;

CREATE TABLE gestion_medicos (
    documento     INT PRIMARY KEY,
    nombre        VARCHAR(100) NOT NULL,
    apellido      VARCHAR(100) NOT NULL,
    especialidad  VARCHAR(50)  NOT NULL,
    tipo          ENUM('Titular','Interino','Sustituto') NOT NULL,
    dia_semana    ENUM('Lunes','Martes','Miercoles','Jueves','Viernes','Sabado','Domingo') NOT NULL,
    hora_inicio   TIME NOT NULL,
    hora_fin      TIME NOT NULL
);

CREATE TABLE gestion_empleados (
    documento      INT PRIMARY KEY,
    nombre         VARCHAR(100) NOT NULL,
    apellido       VARCHAR(100) NOT NULL,
    cargo          ENUM('ATS','Auxiliar de enfermeria','Celador') NOT NULL,
    turno_trabajo  VARCHAR(50)  NOT NULL
);

CREATE TABLE gestion_sustitutos (
    id                    INT AUTO_INCREMENT PRIMARY KEY,
    documento_reemplazado INT NOT NULL,
    documento_sustituto   INT NOT NULL,
    fecha_ini             DATE NOT NULL,
    fecha_fin             DATE NOT NULL,
    FOREIGN KEY (documento_reemplazado) REFERENCES gestion_medicos(documento),
    FOREIGN KEY (documento_sustituto)   REFERENCES gestion_medicos(documento)
);

CREATE TABLE gestion_pacientes (
    documento          INT PRIMARY KEY,
    nombre             VARCHAR(100) NOT NULL,
    apellido           VARCHAR(100) NOT NULL,
    fecha_nacimiento   DATE NOT NULL,
    telefono           VARCHAR(15),
    documento_asignado INT,
    FOREIGN KEY (documento_asignado) REFERENCES gestion_medicos(documento)
);

CREATE TABLE control_vacaciones (
    documento  INT PRIMARY KEY,
    fecha_ini  DATE NOT NULL,
    fecha_fin  DATE NOT NULL,
    estado     ENUM('Planificada','Disfrutada') NOT NULL,
    FOREIGN KEY (documento) REFERENCES gestion_empleados(documento)
);

CREATE TABLE consultas (
    id                  INT AUTO_INCREMENT PRIMARY KEY,
    documento_paciente  INT NOT NULL,
    documento_medico    INT NOT NULL,
    fecha               DATE NOT NULL,
    hora                TIME NOT NULL,
    motivo              VARCHAR(200),
    FOREIGN KEY (documento_paciente) REFERENCES gestion_pacientes(documento),
    FOREIGN KEY (documento_medico)   REFERENCES gestion_medicos(documento)
);

