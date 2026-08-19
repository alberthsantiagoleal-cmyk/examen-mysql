use Examen;

-- 1. Numero de pacientes atendidos por medico
SELECT documento_asignado, COUNT(*) 
FROM gestion_pacientes
GROUP BY documento_asignado;

-- 2. Numero de medicos que estan actualmente en sustitucion
SELECT documento_sustituto, nombre_sustituto
FROM gestion_sustitutos
WHERE CURDATE() BETWEEN fecha_ini AND fecha_fin;

-- 3. Empleados con mas de 10 dias de vacaciones disfrutadas
SELECT nombre, apellido, DATEDIFF(fecha_fin, fecha_ini) AS dias_vacaciones
FROM control_vacaciones
WHERE estado = 'disfrutada'
AND DATEDIFF(fecha_fin, fecha_ini) > 10;
-- 4. Médicos que actualmente están realizando una sustitución
SELECT documento_sustituto, nombre_sustituto
FROM gestion_sustitutos
WHERE CURDATE() BETWEEN fecha_ini AND fecha_fin;

-- 5. Médicos con mayor cantidad de horas de consulta en la semana
SELECT nombre, apellido, horas_semana
FROM consultas
ORDER BY horas_semana DESC;

-- 6. Horas totales de consulta por médico por día de la semana
SELECT nombre, apellido, dia_semana,
       hora_fin - hora_inicio AS horas_consulta
FROM gestion_medicos;
-- 7. Número de sustituciones realizadas por cada médico sustituto
SELECT documento_sustituto, nombre_sustituto,
       COUNT(*) AS cantidad_sustituciones
FROM gestion_sustitutos
GROUP BY documento_sustituto, nombre_sustituto;

-- 8. Médicos con más de 5 pacientes y total de horas de consulta en la semana
SELECT m.nombre, m.apellido,
       COUNT(p.documento) AS cantidad_pacientes,
       c.horas_semana
FROM gestion_medicos m
JOIN gestion_pacientes p
    ON m.documento = p.documento_asignado
JOIN consultas c
    ON m.documento = c.documento
GROUP BY m.documento, m.nombre, m.apellido, c.horas_semana
HAVING COUNT(p.documento) > 5;
