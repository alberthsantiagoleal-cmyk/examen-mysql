INSERT INTO Examen.gestion_medicos
(documento, nombre, apellido, especialidad, tipo, dia_semana, hora_inicio, hora_fin)
VALUES(123456, 'Juan Esteban', 'Leal Portilla', 'Odontologo', 'Titular', 'Lunes', 8, 14);

INSERT INTO Examen.gestion_medicos
(documento, nombre, apellido, especialidad, tipo, dia_semana, hora_inicio, hora_fin)
VALUES(12345, 'Isaias', 'Vargas', 'Cirujano', 'interino', 'martes', 10, 20);

INSERT INTO Examen.gestion_empleados
(documento, nombre, apellido, cargo, turno_trabajo)
VALUES(1230, 'Esteban', 'Vargas', 'ATS', '8:00 a 20:00');

INSERT INTO Examen.gestion_empleados
(documento, nombre, apellido, cargo, turno_trabajo)
VALUES(454545, 'Isabella', 'Suarez', 'auxiliar de enfermeria', '8:00 a 18:00');

INSERT INTO Examen.gestion_pacientes
(documento, nombre, apellido, fecha_nacimiento, telefono, documento_asignado, doctor_asignado)
VALUES(808080, 'ALberth Santiago', 'Leal Herrera', '23122007', 3223378814, 123456, 'Juan Esteban');

INSERT INTO Examen.gestion_pacientes
(documento, nombre, apellido, fecha_nacimiento, telefono, documento_asignado, doctor_asignado)
VALUES(809090, 'Sebastian', 'Leal', '25/11/2007', 3253348814, 12345, 'Isaias');

INSERT INTO Examen.gestion_sustitutos
(documento_reemplazado, nombre_reemp, documento_sustituto, nombre_sustituto, fecha_ini, fecha_fin)
VALUES(12345, 'Isaias', 123456, 'Juan Esteban', '10/08/2026', '11/08/2026');

INSERT INTO Examen.gestion_sustitutos
(documento_reemplazado, nombre_reemp, documento_sustituto, nombre_sustituto, fecha_ini, fecha_fin)
VALUES(123456, 'Juan Esteban', 12345, 'Isaias', '10/05/2026', '11/05/2026');

INSERT INTO Examen.control_vacaciones
(documento, nombre, apellido, fecha_ini, fecha_fin, estado)
VALUES(454545, 'Isabella', 'Vargas', '10/05/2026', '15/05/2026', 'planificada');

INSERT INTO Examen.control_vacaciones
(documento, nombre, apellido, fecha_ini, fecha_fin, estado)
VALUES(1230, 'Esteban', 'Vargas', '10/04/2026', '15/06/2026', 'disfrutada');
