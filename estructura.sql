CREATE table gestion_medicos(
	documento int(12) primary key,
	nombre varchar(100),
	apellido varchar(100),
	especialidad varchar(50),
	tipo varchar(50),
	dia_semana varchar(50),
	hora_inicio int(20),
	hora_fin int(20)
);
CREATE table gestion_sustitutos(
	documento_reemplazado int(12),
	nombre_reemp varchar(50),
	documento_sustituto int(12),
	nombre_sustituto varchar(50),
	fecha_ini date,
	fecha_fin date,
	foreign key (documento_sustituto) references gestion_medicos(documento) 
);
CREATE table gestion_empleados(
	documento int(12) primary key,
	nombre varchar(100),
	apellido varchar(100),
	cargo varchar(50),
	turno_trabajo varchar(50)
);
CREATE table gestion_pacientes(
	documento int(12) primary key,
	nombre varchar(100),
	apellido varchar(100),
	fecha_nacimiento date,
	telefono int(10),
	documento_asignado int(12),
	doctor_asignado varchar(100),
	foreign key (documento_asignado) references gestion_medicos(documento)
);
CREATE table control_vacaciones(
	documento int(12) primary key,
	nombre varchar(100),
	apellido varchar(100),
	fecha_ini date,
	fecha_fin date,
	estado varchar(30),
	foreign key (documento) references gestion_empleados(documento)
);
CREATE table consultas(
	documento int(12) primary key,
	nombre varchar(100),
	apellido varchar(100),
	horas_semana int(200)
);

