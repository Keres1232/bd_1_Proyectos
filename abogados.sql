insert into cliente(idCliente,Nombre,Direccion)value(111,'l','carrera1');
insert into cliente(idCliente,Nombre,Direccion)value(112,'k','carrera2');
insert into cliente(idCliente,Nombre,Direccion)value(113,'h','carrera3');

insert into abogado(idAbogado,Nombre,Dirrecion)value(121,'i','carrera1');
insert into abogado(idAbogado,Nombre,Dirrecion)value(122,'a','carrera2');
insert into abogado(idAbogado,Nombre,Dirrecion)value(123,'b','carrera3');

insert into estado(idEstado,Estaddo)value(1,'Sin iniciar');
insert into estado(idEstado,Estaddo)value(2,'En trámite');
insert into estado(idEstado,Estaddo)value(3,'Archivado');

insert into caso(idcliente,Fecha_Inicio,Fecha_Final,Cliente_idCliente,Estado_idEstado)value("101","2014-10-10","2016-11-10",'111','1');
insert into caso(idcliente,Fecha_Inicio,Fecha_Final,Cliente_idCliente,Estado_idEstado)value("121","2019-01-15","2023-07-29",'112','2');
insert into caso(idcliente,Fecha_Inicio,Fecha_Final,Cliente_idCliente,Estado_idEstado)value("131","2022-04-09","2023-01-1",'113','3');

select * from abogado where idAbogado = "121";
select * from caso where Estado_idEstado = "3";
select * from caso where Estado_idEstado = "2";
select * from caso where Estado_idEstado = "1";

update caso set Estado_idEstado = "3" where idcliente = 121;

delete from caso where idcliente ="101";