--- 1 Cambiar el nombre de la tabla departamentos por dept.
	ALTER TABLE departamentos RENAME TO dept;


--- 2 Añadir una nueva columna a la tabla HRJOBS que sea Skills, 
--- para saber qué habilidades tiene el empleado y será de tipo cadena.
    ALTER TABLE HRJOBS add Skills VARCHAR2(64); 


--- 3 Cambiar el tamaño del campo country_id de HRLOCATIONS
--- por un tamaño de 50.
    ALTER TABLE hrlocations 
    MODIFY country_id char(50);
    -- MODIFY COLUMN country_id char(50);


--- 4 Añadir la restricción de no permitir salario menor de 0 
--- en la tabla HREMPLOYEES en el campo salary.
    ALTER TABLE HREMPLOYEES 
    ADD CONSTRAINT CHK_Salary
        CHECK ( salary > 0 );


--- 5 Añadir la restricción de NOT NULL en campo 
--- department_name de la tabla HR_DEPARTAMENTS.
    ALTER TABLE HR_DEPARTAMENTS
    MODIFY department_name not null VARCHAR2(32);


--- 6 Crear otra vista llamada sueldos_suma que muestre 
--- los nombres de los departamentos y la suma de los 
--- sueldos de los empleados masculinos agrupados por departamentos.
    CREATE or replace VIEW sueldos_suma AS  

        -- build the view
        SELECT      department_name, sum(employees.salary) all_male_salaries
        FROM        departments INNER JOIN      employees ON  
                    departments.department_id = employees.department_id
                    
        -- filtre the view
        WHERE       employees.sexo = 'M'    -- get all male salaries
        GROUP BY    department_name;        -- group by department


--- 7 Inserta un nuevo departamento, deshaciendo 
--- la entrada del nuevo departamento después, usando transacciones.
DECLARE 
    v_department departments%ROWTYPE;

BEGIN
    commit;
        
        v_department.department_id   := 1234;
        v_department.department_name := 'Projects';
        
        insert into departments
        values v_department;
    
    rollback;
END;
/
