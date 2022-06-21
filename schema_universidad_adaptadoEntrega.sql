
SELECT persona.apellido1, persona.apellido2, persona.nombre FROM persona WHERE persona.tipo LIKE 'alumno' ORDER BY persona.apellido1, persona.apellido2, persona.nombre ASC;
SELECT persona.nombre, persona.apellido1, persona.apellido2 FROM persona WHERE persona.tipo = 'alumno' AND persona.telefono IS NULL;
SELECT * FROM persona WHERE tipo = 'alumno' and year(fecha_nacimiento) LIKE 1999;
SELECT * FROM persona WHERE persona.tipo = 'profesor' AND persona.telefono IS NULL AND persona.nif LIKE '%K';
SELECT * FROM asignatura WHERE asignatura.cuatrimestre = 1 AND asignatura.curso = 3 AND asignatura.id_grado = 7;
SELECT persona.apellido1, persona.apellido2, persona.nombre, departamento.nombre FROM persona INNER JOIN profesor ON persona.id = profesor.id_profesor INNER JOIN departamento ON profesor.id_departamento = departamento.id ORDER BY persona.apellido1, persona.apellido2, persona.nombre ASC;
SELECT persona.nif, asignatura.nombre AS 'Nombre Asignatura', curso_escolar.anyo_inicio, curso_escolar.anyo_fin FROM persona INNER JOIN alumno_se_matricula_asignatura ON alumno_se_matricula_asignatura.id_alumno = persona.id INNER JOIN asignatura ON alumno_se_matricula_asignatura.id_asignatura = asignatura.id INNER JOIN curso_escolar ON alumno_se_matricula_asignatura.id_curso_escolar = curso_escolar.id WHERE persona.nif LIKE '26902806M';
SELECT DISTINCT departamento.nombre AS 'Nombre Departamento' FROM departamento INNER JOIN profesor ON departamento.id = profesor.id_departamento INNER JOIN asignatura ON asignatura.id_profesor = profesor.id_profesor INNER JOIN grado ON asignatura.id_grado = grado.id WHERE grado.nombre LIKE 'Grado en Ingeniería Informática (Plan 2015)';
SELECT DISTINCT persona.nombre, persona.apellido1, persona.apellido2 FROM persona INNER JOIN alumno_se_matricula_asignatura ON persona.id = alumno_se_matricula_asignatura.id_alumno INNER JOIN curso_escolar ON alumno_se_matricula_asignatura.id_curso_escolar = curso_escolar.id WHERE curso_escolar.anyo_inicio = 2018;
SELECT persona.apellido1, persona.apellido2, persona.nombre, departamento.nombre AS 'Departamento' FROM persona LEFT JOIN profesor ON persona.id = profesor.id_profesor LEFT JOIN departamento ON profesor.id_departamento = departamento.id ORDER BY departamento.nombre ASC, persona.apellido1 ASC, persona.apellido2 ASC, persona.nombre ASC;
SELECT persona.apellido1, persona.apellido2, persona.nombre FROM persona LEFT JOIN profesor ON persona.id = profesor.id_profesor LEFT JOIN departamento ON profesor.id_departamento = departamento.id WHERE departamento.id IS NULL;
SELECT * FROM departamento LEFT JOIN profesor ON departamento.id = profesor.id_departamento WHERE profesor.id_departamento IS NULL;
SELECT asignatura.nombre, persona.apellido1, persona.apellido2, persona.nombre FROM asignatura RIGHT JOIN profesor ON profesor.id_profesor = asignatura.id_profesor RIGHT JOIN persona ON persona.id = profesor.id_profesor WHERE persona.tipo LIKE 'profesor' AND asignatura.id_profesor IS NULL;
SELECT asignatura.nombre, persona.apellido1, persona.apellido2, persona.nombre FROM asignatura LEFT JOIN profesor ON profesor.id_profesor = asignatura.id_profesor LEFT JOIN persona ON persona.id = profesor.id_profesor WHERE asignatura.id_profesor IS NULL;
SELECT DISTINCT departamento.nombre FROM departamento LEFT JOIN profesor ON departamento.id = profesor.id_departamento LEFT JOIN asignatura ON profesor.id_profesor = asignatura.id_profesor LEFT JOIN alumno_se_matricula_asignatura ON alumno_se_matricula_asignatura.id_asignatura = asignatura.id LEFT JOIN curso_escolar ON curso_escolar.id = alumno_se_matricula_asignatura.id_curso_escolar WHERE asignatura.id_profesor IS NULL AND curso_escolar.anyo_inicio IS NULL;
SELECT count(persona.id) AS 'Total alumnos' FROM persona WHERE persona.tipo LIKE 'alumno';
SELECT count(persona.id) AS 'Nacidos en 1999' FROM persona WHERE persona.tipo LIKE 'alumno' AND year(fecha_nacimiento) LIKE 1999;
SELECT departamento.nombre AS 'Departamento', count(profesor.id_profesor) AS 'Total profesores' FROM profesor INNER JOIN departamento ON departamento.id = profesor.id_departamento GROUP BY departamento.nombre ORDER BY COUNT(profesor.id_profesor) DESC;
SELECT departamento.nombre AS 'Departamento', count(profesor.id_profesor) AS 'Total profesores' FROM profesor RIGHT JOIN departamento ON profesor.id_departamento = departamento.id GROUP BY departamento.nombre ORDER BY COUNT(profesor.id_profesor) DESC;
SELECT grado.nombre, count(asignatura.id) AS total_asignaturas FROM grado LEFT JOIN asignatura ON grado.id = asignatura.id_grado GROUP BY grado.nombre ORDER BY COUNT(asignatura.id) DESC;
SELECT grado.nombre, count(asignatura.id) AS total_asignaturas FROM grado LEFT JOIN asignatura ON grado.id = asignatura.id_grado GROUP BY grado.nombre HAVING total_asignaturas > 40;
SELECT grado.nombre, asignatura.tipo, sum(asignatura.creditos) AS numero_creditos FROM grado LEFT JOIN asignatura ON grado.id = asignatura.id_grado GROUP BY grado.nombre, asignatura.tipo;
SELECT curso_escolar.anyo_inicio, count(alumno_se_matricula_asignatura.id_alumno) AS 'Alumnos matriculados' FROM curso_escolar LEFT JOIN alumno_se_matricula_asignatura ON curso_escolar.id = alumno_se_matricula_asignatura.id_curso_escolar GROUP BY curso_escolar.anyo_inicio;
SELECT persona.id, persona.nombre, persona.apellido1, persona.apellido2, count(asignatura.id) AS 'Asignaturas' FROM persona LEFT JOIN asignatura ON asignatura.id_profesor = persona.id WHERE persona.tipo = 'profesor' GROUP BY persona.id ORDER BY COUNT(asignatura.id_profesor) DESC;
SELECT * FROM persona WHERE persona.tipo = 'Alumno' AND persona.fecha_nacimiento = (SELECT max(fecha_nacimiento) FROM persona WHERE persona.tipo = 'alumno');
SELECT persona.apellido1, persona.apellido2, persona.nombre, departamento.nombre AS 'Departamento', asignatura.nombre AS 'Nombre Asignatura' FROM persona INNER JOIN profesor ON persona.id = profesor.id_profesor INNER JOIN departamento ON departamento.id = profesor.id_departamento LEFT JOIN asignatura ON asignatura.id_profesor = profesor.id_profesor WHERE asignatura.nombre IS NULL;