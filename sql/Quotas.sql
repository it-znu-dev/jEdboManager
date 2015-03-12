drop table if exists Quotas ;
create table Quotas(
  id int primary key auto_increment,
  Id_Quota int comment 'Идентификатор типа квоты.',
  QuotaName varchar(255) comment 'Название типа квоты',
  QuotaDescription varchar(255) comment 'Описание типа квоты',
  DateLastChange dateTime comment 'Дата последнего изменения записи',
  UniversityKode varchar(255) comment 'GUID идентификатор учебного заведения',
  SpecDirectionsCode varchar(255) comment 'GUID идентификатор направления',
  SpecSpecialityCode varchar(255) comment 'GUID идентификатор специальности',
  Id_University int comment 'Числовой идентификатор учебного заведения',
  UniversityFullName varchar(255) comment 'Название учебного заведения',
  SpecDirectionName varchar(255) comment 'Название направления',
  SpecClasifierCode varchar(255) comment 'Код направления',
  SpecSpecialityName varchar(255) comment 'Название специальности',
  SpecSpecialityClasifierCode varchar(255) comment 'Код специальности',
  Id_PersonRequestSeasons int comment 'Идентификатор вступительной компании'
);
insert into Quotas (
SpecClasifierCode,
SpecDirectionName,
Id_University,
SpecSpecialityClasifierCode,
Id_Quota,
Id_PersonRequestSeasons,
SpecSpecialityName,
UniversityKode,
QuotaDescription,
SpecSpecialityCode,
UniversityFullName,
SpecDirectionsCode,
QuotaName,
DateLastChange
)
 values 
(
'',
'',
'73',
'',
'3302',
'4',
'',
'ab1bc732-51f3-475c-bcfe-368363369020',
'',
'',
'Державний вищий навчальний заклад "Запорізький національний університет" Міністерства освіти і науки України',
'',
'Переможець та лауреат щорічного Всеукраїнського конкурсу "Кращий державний службовець"  ',
'2014-07-08T16:56:04'
);
insert into Quotas (
SpecClasifierCode,
SpecDirectionName,
Id_University,
SpecSpecialityClasifierCode,
Id_Quota,
Id_PersonRequestSeasons,
SpecSpecialityName,
UniversityKode,
QuotaDescription,
SpecSpecialityCode,
UniversityFullName,
SpecDirectionsCode,
QuotaName,
DateLastChange
)
 values 
(
'',
'',
'73',
'',
'3739',
'4',
'',
'ab1bc732-51f3-475c-bcfe-368363369020',
'',
'',
'Державний вищий навчальний заклад "Запорізький національний університет" Міністерства освіти і науки України',
'',
'Цільовий прийом сільської молоді Запорізька область',
'2014-07-23T12:14:35'
);
insert into Quotas (
SpecClasifierCode,
SpecDirectionName,
Id_University,
SpecSpecialityClasifierCode,
Id_Quota,
Id_PersonRequestSeasons,
SpecSpecialityName,
UniversityKode,
QuotaDescription,
SpecSpecialityCode,
UniversityFullName,
SpecDirectionsCode,
QuotaName,
DateLastChange
)
 values 
(
'',
'',
'73',
'',
'3740',
'4',
'',
'ab1bc732-51f3-475c-bcfe-368363369020',
'',
'',
'Державний вищий навчальний заклад "Запорізький національний університет" Міністерства освіти і науки України',
'',
'Цільовий прийом сільської молоді Дніпропетровська область',
'2014-07-23T12:15:06'
);
insert into Quotas (
SpecClasifierCode,
SpecDirectionName,
Id_University,
SpecSpecialityClasifierCode,
Id_Quota,
Id_PersonRequestSeasons,
SpecSpecialityName,
UniversityKode,
QuotaDescription,
SpecSpecialityCode,
UniversityFullName,
SpecDirectionsCode,
QuotaName,
DateLastChange
)
 values 
(
'',
'',
'73',
'',
'3741',
'4',
'',
'ab1bc732-51f3-475c-bcfe-368363369020',
'',
'',
'Державний вищий навчальний заклад "Запорізький національний університет" Міністерства освіти і науки України',
'',
'Цільовий прийом сільської молоді Державне агенство лісових ресурсів України',
'2014-07-23T12:15:49'
);
