drop table if exists Benefits ;
create table Benefits(
  id int primary key auto_increment,
  Id_Benefit int comment 'Идентификатор льготы или поощрения.',
  Id_BenefitGroup int comment 'Идентификатор группы льготы или поощрения',
  Key varchar(255) comment 'Ключ льготы или поощрения',
  DateLastChange dateTime comment 'Дата последнего изменения записи',
  BenefitDateBegin dateTime comment 'Дата начала действия льготы или поощрения',
  BenefitDateEnd dateTime comment 'Дата окончания действия льготы или поощрения',
  Id_BenefitName int comment 'Идентификатор названий льготы или поощрения.',
  BenefitName varchar(255) comment 'Название льготы.',
  BenefitsGroupsName varchar(255) comment 'Название группы льготы.',
  Id_Language int comment 'Идентификатор языка названий'
);
insert into Benefits (
LastErrorDescription,
LastErrorCode
)
 values 
(
'Сесія заблокована',
'101'
);
