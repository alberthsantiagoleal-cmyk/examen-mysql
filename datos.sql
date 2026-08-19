INSERT INTO gestion_medicos (documento, nombre, apellido, especialidad, tipo, dia_semana, hora_inicio, hora_fin) VALUES
(100126789, 'Carlos',   'Ramirez',  'Cardiologia',    'Planta',    'Lunes',     '08:00:00', '14:00:00'),
(100234567, 'Maria',    'Gomez',    'Pediatria',      'Planta',    'Martes',    '07:00:00', '13:00:00'),
(100345678, 'Andres',   'Torres',   'Dermatologia',   'Planta',    'Miercoles', '09:00:00', '15:00:00'),
(100456789, 'Laura',    'Perez',    'Ginecologia',    'Sustituto', 'Jueves',    '08:00:00', '12:00:00'),
(100567890, 'Jorge',    'Martinez', 'Ortopedia',      'Planta',    'Viernes',   '10:00:00', '16:00:00'),
(100678901, 'Paula',    'Rojas',    'Medicina General','Sustituto','Lunes',     '13:00:00', '19:00:00');

INSERT INTO gestion_empleados (documento, nombre, apellido, cargo, turno_trabajo) VALUES
(200112233, 'Diana',    'Suarez',   'Enfermera',      'Manana'),
(200223344, 'Felipe',   'Castro',   'Recepcionista',  'Tarde'),
(200334455, 'Natalia',  'Ortiz',    'Auxiliar',       'Manana'),
(200445566, 'Ricardo',  'Mendez',   'Enfermero',      'Noche'),
(200556677, 'Camila',   'Vargas',   'Recepcionista',  'Manana');

INSERT INTO gestion_sustitutos (documento_reemplazado, documento_sustituto, fecha_ini, fecha_fin) VALUES
(100126789, 100678901, '2026-08-01', '2026-08-05'),
(100567890, 100456789, '2026-08-10', '2026-08-15'),
(100345678, 100678901, '2026-08-20', '2026-08-22');

INSERT INTO gestion_pacientes (documento, nombre, apellido, fecha_nacimiento, telefono, documento_asignado) VALUES
(300112233, 'Sofia',    'Herrera',  '1990-04-12', '3011234567', 100126789),
(300223344, 'Mateo',    'Lopez',    '1985-11-03', '3022345678', 100234567),
(300334455, 'Valentina','Diaz',     '2001-07-22', '3033456789', 100345678),
(300445566, 'Santiago', 'Nino',     '1978-02-18', '3044567890', 100126789),
(300556677, 'Isabella', 'Cardenas', '1995-09-30', '3055678901', 100567890),
(300667788, 'Juan',     'Salazar',  '1962-12-05', '3066789012', 100234567);

INSERT INTO control_vacaciones (documento, fecha_ini, fecha_fin, estado) VALUES
(200112233, '2026-09-01', '2026-09-10', 'Aprobada'),
(200223344, '2026-10-01', '2026-10-05', 'Pendiente'),
(200445566, '2026-08-15', '2026-08-20', 'Rechazada');

INSERT INTO consultas (documento_paciente, documento_medico, fecha, hora, motivo) VALUES
(300112233, 100126789, '2026-08-05', '08:30:00', 'Control de arritmia'),
(300223344, 100234567, '2026-08-05', '09:00:00', 'Revision pediatrica'),
(300334455, 100345678, '2026-08-06', '10:00:00', 'Consulta dermatologica'),
(300445566, 100126789, '2026-08-06', '11:00:00', 'Dolor en el pecho'),
(300556677, 100567890, '2026-08-07', '10:30:00', 'Dolor de rodilla'),
(300667788, 100234567, '2026-08-07', '07:30:00', 'Control general'),
(300112233, 100126789, '2026-08-14', '08:00:00', 'Seguimiento'),
(300334455, 100345678, '2026-08-14', '09:30:00', 'Resultado de examenes');

