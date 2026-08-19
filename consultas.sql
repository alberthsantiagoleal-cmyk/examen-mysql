use Examen;

-- 1. Numero de pacientes atendidos por medico
SELECT COUNT(documento_asignado),doctor_asignado
FROM gestion_pacientes 
group by doctor_asignado;

-- 2. Numero de medicos que estan actualmente en sustitucion
SELECT COUNT(documento_sustituto), nombre_sustituto
FROM gestion_sustitutos
group by nombre_sustituto;

-- 3. Empleados con mas de 10 dias de vacaciones disfrutadas
SELECT nombre, apellido
FROM control_vacaciones
where estado = "disfrutada" and ;

-- 4. Medicos que actualmente estan realizando una sustitucion
SELECT COUNT(documento_sustituto), nombre_sustituto 
FROM gestion_sustitutos
group by nombre_sustituto;

-- 5. Medicos con mayor cantidad de horas de consulta en la semana
SELECT nombre
FROM gestion_medicos
order by ASC nombre;

-- 6. Horas totales de consulta por medico por dia de la semana
SELECT nombre, fecha_inicio, fecha_fin
from gestion_medicos 
group by nombre;

-- 7. Numero de sustituciones realizadas por cada medico sustituto
SELECT COUNT(documento_sustituto), nombre_sustituto  
FROM gestion_sustitutos
group by nombre_sustituto;

-- 8. Medicos con mas de 5 pacientes y total de horas de consulta en la semana
SELECT 
FROM gestion_pacientes
where 
