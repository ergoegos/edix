-- 1.Muestre el salario más alto, más bajo, salario total y salario promedio 
-- por cada tipo de puesto que se tiene en la organización.

select 
	j.job_title as "trabajo", 
	sum(e.salary) as "salario", avg(e.salary) as "promedio",
	max(e.salary) as "salario maximo", min(e.salary) as "salario minimo" 
	from employees e 
	
	inner join jobs j on e.job_id = j.job_id
		group by j.job_title;


-- 2.Escriba una consulta que muestre la cantidad de personas que tienen 
-- el mismo puesto y a cuánto asciende la suma total de sus salarios. 
-- El resultado debe mostrarse en orden descendente por el puesto 
-- que tiene la mayor cantidad de empleados.

select 
	j.job_title as "trabajo",
	count(e.job_id) as "numero de empleados", 
	sum(e.salary) as "suma de salarios"
	from employees e 
	
	inner join jobs j on e.job_id = j.job_id
		order by count(e.job_id) desc;
		group by j.job_title
		


-- 3.Escriba una consulta para mostrar la diferencia entre el salario más alto
-- y el salario más bajo. Etiquete la columna como «Diferencia Salarial».
select
	max(salary) as  "maximo", min(salary) as "minimo",
	max(salary) - min(salary) as "diferencia"
	from employees;


-- 4.Escriba una consulta para mostrar el número de empleado y apellidos
-- de todos los empleados que ganan por encima del salario promedio.
select
	employee_id as "id",
	last_name as "apellidos"
	from employees 
	
	where salary >= (select avg(salary) 
		from employees);



-- 5.Muestre los nombres y apellidos (es una sola columna), nombre del departamento y el
-- nombre del puesto de todos los empleados cuyo código de ubicación de departamento 
-- (LOCATION_ID) es 1700. El resultado debe mostrarse en orden ascendente por el apellido del empleado.

select
	d.department_name as "departamento", 
	concat( e.first_name,' ', e.last_name ) as "nombre completo",
	j.job_title as "puesto"
	from employees e

		inner join departments d 
			on e.department_id = d.department_id

		inner join jobs j 
			on e.job_id = j.job_id

	where d.location_id = 1700
		order by e.last_name asc;