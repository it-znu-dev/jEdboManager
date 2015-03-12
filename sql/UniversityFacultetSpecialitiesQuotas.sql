drop table if exists UniversityFacultetSpecialitiesQuotas ;
create table UniversityFacultetSpecialitiesQuotas(
  id int primary key auto_increment,
  Id_UniversitySpecialitiesQuota int comment 'Идентификатор квоты специальности.',
  UniversitySpecialitiesQuotaPriority int comment 'Приоритет квоты специальности',
  UniversitySpecialitiesQuotaValue float comment 'Значение квоты специальности',
  Id_Quota int comment 'Идентификатор квоты для учебного заведения',
  QuotaName varchar(255) comment 'Название квоты',
  QuotaDescription varchar(255) comment 'Описание квоты',
  DateLastChange dateTime comment 'Дата последнего изменения квоты',
  UniversityKode varchar(255) comment 'GUID идентификатор учебного заведения',
  SpecDirectionsCode varchar(255) comment 'GUID идентификатор направления для квоты ',
  SpecClasifierCode varchar(255) comment 'Код направления для квоты ',
  SpecDirectionName varchar(255) comment 'Название направления для квоты',
  SpecSpecialityCode varchar(255) comment 'GUID идентификатор специальности для квоты',
  SpecSpecialityClasifierCode varchar(255) comment 'Код специальности для квоты ',
  SpecSpecialityName varchar(255) comment 'Название специальности для квоты',
  Id_PersonRequestSeasons int comment 'Идентификатор вступительной компании для квоты ',
  Id_UniversitySpecialities int comment 'Числовой идентификатор специальности',
  UniversitySpecialitiesKode varchar(255) comment 'GUIDA идентификатор специальности',
  UniversitySpecialitiesDateBegin dateTime comment 'Дата начала действия специальности',
  UniversitySpecialitiesDateEnd dateTime comment 'Дата окончания действия специальности',
  UniversityFullName varchar(255) comment 'Название учебного заведения',
  Id_University int comment 'Числовой идентификатор учебного заведения'
);
insert into UniversityFacultetSpecialitiesQuotas (
LastErrorDescription,
LastErrorCode
)
 values 
(
'Доступ к указанному ВУЗУ запрещен',
'1001'
);
