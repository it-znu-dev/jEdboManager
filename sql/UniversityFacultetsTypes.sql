drop table if exists UniversityFacultetsTypes ;
create table UniversityFacultetsTypes(
  id int primary key auto_increment,
  Id_UniversityFacultetType int comment 'Идентификатор типа структурного подразделения',
  UniversityFacultetTypeName varchar(255) comment 'Название типа структурного подразделения',
  DateLastChange dateTime comment 'Дата последнего изменения записи'
);
insert into UniversityFacultetsTypes (
Id_UniversityFacultetType,
UniversityFacultetTypeName,
DateLastChange
)
 values 
(
'10',
'Підпорядкований інститут\коледж\тощо',
'2012-02-26T19:35:00.38'
);
insert into UniversityFacultetsTypes (
Id_UniversityFacultetType,
UniversityFacultetTypeName,
DateLastChange
)
 values 
(
'11',
'Навчально-консультаційний центр',
'2012-06-26T12:32:23'
);
insert into UniversityFacultetsTypes (
Id_UniversityFacultetType,
UniversityFacultetTypeName,
DateLastChange
)
 values 
(
'12',
'Управління НЗ',
'2014-09-04T14:37:35'
);
insert into UniversityFacultetsTypes (
Id_UniversityFacultetType,
UniversityFacultetTypeName,
DateLastChange
)
 values 
(
'19',
'Інститут',
'2012-06-11T11:50:47'
);
insert into UniversityFacultetsTypes (
Id_UniversityFacultetType,
UniversityFacultetTypeName,
DateLastChange
)
 values 
(
'20',
'Факультет',
'2012-02-26T19:35:00.38'
);
insert into UniversityFacultetsTypes (
Id_UniversityFacultetType,
UniversityFacultetTypeName,
DateLastChange
)
 values 
(
'30',
'Кафедра',
'2012-02-26T19:35:00.38'
);
insert into UniversityFacultetsTypes (
Id_UniversityFacultetType,
UniversityFacultetTypeName,
DateLastChange
)
 values 
(
'40',
'Відділення',
'2012-06-11T11:50:47'
);
insert into UniversityFacultetsTypes (
Id_UniversityFacultetType,
UniversityFacultetTypeName,
DateLastChange
)
 values 
(
'50',
'Циклові методичні комісії',
'2012-06-26T12:32:23'
);
