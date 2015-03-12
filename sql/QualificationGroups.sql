drop table if exists QualificationGroups ;
create table QualificationGroups(
  id int primary key auto_increment,
  Id_QualificationGroup int comment 'Идентификатор группы квалификационных уровней.',
  QualificationGroupName varchar(255) comment 'Название группыквалификационных уровней.'
);
insert into QualificationGroups (
QualificationGroupName,
Id_QualificationGroup
)
 values 
(
'Бакалавр',
'1'
);
insert into QualificationGroups (
QualificationGroupName,
Id_QualificationGroup
)
 values 
(
'Магістр',
'2'
);
insert into QualificationGroups (
QualificationGroupName,
Id_QualificationGroup
)
 values 
(
'Спеціаліст',
'3'
);
insert into QualificationGroups (
QualificationGroupName,
Id_QualificationGroup
)
 values 
(
'Молодший спеціаліст',
'4'
);
insert into QualificationGroups (
QualificationGroupName,
Id_QualificationGroup
)
 values 
(
'Кваліфікований робітник',
'5'
);
