drop table if exists Olympiads ;
create table Olympiads(
  id int primary key auto_increment,
  Id_Olimpiad int comment 'Идентификатор олимпиады',
  Id_PersonRequestSeasons int comment 'Глобальный идентификатор вступительной компании',
  OlimpiadName varchar(255) comment 'Название олимпиады',
  DateLastChange DateTime comment 'Дата последнего изменения данных об олимпиаде'
);
insert into Olympiads (
OlimpiadName,
Id_PersonRequestSeasons,
Id_Olimpiad,
DateLastChange
)
 values 
(
'Всеукраїнські учнівські олімпіади із базових предметів (IV етап)',
'4',
'9',
'2012-12-18T10:15:12'
);
insert into Olympiads (
OlimpiadName,
Id_PersonRequestSeasons,
Id_Olimpiad,
DateLastChange
)
 values 
(
'Всеукраїнські конкурси — захисти науково-дослідницьких робіт учнів - членів Малої академії наук України',
'4',
'10',
'2012-12-18T10:15:12'
);
