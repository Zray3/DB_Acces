create table empleado (
             id int auto_increment primary key,
    DNI varchar(8),
    nombre varchar(30),
             apellidos varchar(60),
             domicilio varchar(100),
    CP varchar(5),
    email varchar(30),
    fechaNac date,
    cargo varchar(10),
             password varchar(30),
    changedts timestamp default current_timestamp);

insert into empleado(DNI,nombre,apellidos,domicilio,CP,email,fechaNac,cargo,password) values
('2X','luna','navarro','su casa 22','46015','empleado1@empresa.es','2000/03/01','jefa','1111'),
('3X','pepa','perez','su casa 12','46016','empleado2@empresa.es','2000/03/02','empleada','1111'),
('4X','blanca','garcia','su casa 32','46017','empleado3@empresa.es','2000/03/03','empleada','1111'),
('5X','tula','martinez','su casa 42','46018','empleado4@empresa.es','2000/03/04','empleada','1111');
