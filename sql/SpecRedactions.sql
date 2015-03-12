drop table if exists SpecRedactions ;
create table SpecRedactions(
  id int primary key auto_increment,
  Id_SpecRedactions int comment 'Идентификатор редакции.',
  SpecRedactionName varchar(255) comment 'Название редакции.',
  SpecRedactionCode varchar(255) comment 'Код редакции.',
  DateLastChange dateTime comment 'Дата последнего изменения записи'
);
insert into SpecRedactions (
SpecRedactionName,
SpecRedactionCode,
Id_SpecRedactions,
DateLastChange
)
 values 
(
'Старі коди',
'Старі коди',
'0',
'2012-11-05T17:02:05'
);
insert into SpecRedactions (
SpecRedactionName,
SpecRedactionCode,
Id_SpecRedactions,
DateLastChange
)
 values 
(
' 09.12.2010',
'09.12.2010',
'1',
'2011-05-17T17:46:36'
);
