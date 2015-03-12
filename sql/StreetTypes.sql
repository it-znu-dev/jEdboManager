drop table if exists StreetTypes ;
create table StreetTypes(
  id int primary key auto_increment,
  Id_StreetType int comment 'Идентификатор типа улицы.',
  Id_StreetTypeName int comment 'Идентификатор названия типа улицы.',
  StreetTypeFullName varchar(255) comment 'Полное название типа улицы.',
  StreetTypeShortName varchar(255) comment 'Краткое название типа улицы.',
  Id_Language int comment 'Идентификатор языка для названия типов '
);
insert into StreetTypes (
StreetTypeFullName,
Id_Language,
StreetTypeShortName,
Id_StreetTypeName,
Id_StreetType
)
 values 
(
'',
'1',
'',
'2',
'0'
);
insert into StreetTypes (
StreetTypeFullName,
Id_Language,
StreetTypeShortName,
Id_StreetTypeName,
Id_StreetType
)
 values 
(
'вулиця',
'1',
'вул.',
'1',
'1'
);
insert into StreetTypes (
StreetTypeFullName,
Id_Language,
StreetTypeShortName,
Id_StreetTypeName,
Id_StreetType
)
 values 
(
'бульвар',
'1',
'бульв.',
'3',
'2'
);
insert into StreetTypes (
StreetTypeFullName,
Id_Language,
StreetTypeShortName,
Id_StreetTypeName,
Id_StreetType
)
 values 
(
'площа',
'1',
'пл.',
'4',
'3'
);
insert into StreetTypes (
StreetTypeFullName,
Id_Language,
StreetTypeShortName,
Id_StreetTypeName,
Id_StreetType
)
 values 
(
'провулок',
'1',
'пров.',
'5',
'4'
);
insert into StreetTypes (
StreetTypeFullName,
Id_Language,
StreetTypeShortName,
Id_StreetTypeName,
Id_StreetType
)
 values 
(
'проспект',
'1',
'просп.',
'6',
'5'
);
insert into StreetTypes (
StreetTypeFullName,
Id_Language,
StreetTypeShortName,
Id_StreetTypeName,
Id_StreetType
)
 values 
(
'квартал',
'1',
'квартал',
'7',
'6'
);
insert into StreetTypes (
StreetTypeFullName,
Id_Language,
StreetTypeShortName,
Id_StreetTypeName,
Id_StreetType
)
 values 
(
'майдан',
'1',
'майдан',
'8',
'7'
);
insert into StreetTypes (
StreetTypeFullName,
Id_Language,
StreetTypeShortName,
Id_StreetTypeName,
Id_StreetType
)
 values 
(
'мікрорайон',
'1',
'мікрорайон',
'9',
'8'
);
insert into StreetTypes (
StreetTypeFullName,
Id_Language,
StreetTypeShortName,
Id_StreetTypeName,
Id_StreetType
)
 values 
(
'тупик',
'1',
'туп.',
'10',
'9'
);
insert into StreetTypes (
StreetTypeFullName,
Id_Language,
StreetTypeShortName,
Id_StreetTypeName,
Id_StreetType
)
 values 
(
'дільниця',
'1',
'дільниця',
'11',
'10'
);
insert into StreetTypes (
StreetTypeFullName,
Id_Language,
StreetTypeShortName,
Id_StreetTypeName,
Id_StreetType
)
 values 
(
'проїзд',
'1',
'проїзд ',
'12',
'11'
);
insert into StreetTypes (
StreetTypeFullName,
Id_Language,
StreetTypeShortName,
Id_StreetTypeName,
Id_StreetType
)
 values 
(
'узвіз',
'1',
'узвіз ',
'13',
'12'
);
insert into StreetTypes (
StreetTypeFullName,
Id_Language,
StreetTypeShortName,
Id_StreetTypeName,
Id_StreetType
)
 values 
(
'шосе',
'1',
'шосе ',
'14',
'13'
);
insert into StreetTypes (
StreetTypeFullName,
Id_Language,
StreetTypeShortName,
Id_StreetTypeName,
Id_StreetType
)
 values 
(
'набережна',
'1',
'наб.',
'16',
'100'
);
