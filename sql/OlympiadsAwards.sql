drop table if exists OlympiadsAwards ;
create table OlympiadsAwards(
  id int primary key auto_increment,
  Id_Olimpiad int comment 'Идентификатор олимпиады',
  Id_PersonRequestSeasons int comment 'Глобальный идентификатор вступительной компании',
  OlimpiadName varchar(255) comment 'Название олимпиады',
  DateLastChangeOlimpiad DateTime comment 'Дата последнего изменения данных об олимпиаде',
  Id_OlympiadAward int comment 'Идентификатор поощрения олимпиады',
  OlympiadAwardName varchar(255) comment 'Название поощрения',
  OlympiadAwardBonus float comment 'Бонус поощрения (баллы)',
  DateLastChangeOlympiadAward DateTime comment 'Дата последнего изменения записи об поощрении'
);
insert into OlympiadsAwards (
Id_OlympiadAward,
DateLastChangeOlimpiad,
DateLastChangeOlympiadAward,
OlimpiadName,
OlympiadAwardName,
Id_PersonRequestSeasons,
Id_Olimpiad,
OlympiadAwardBonus
)
 values 
(
'349',
'2012-12-18T10:15:12',
'2014-02-06T11:18:35.45',
'Всеукраїнські учнівські олімпіади із базових предметів (IV етап)',
'Історія України. Диплом І ступеня',
'4',
'9',
'50.0'
);
insert into OlympiadsAwards (
Id_OlympiadAward,
DateLastChangeOlimpiad,
DateLastChangeOlympiadAward,
OlimpiadName,
OlympiadAwardName,
Id_PersonRequestSeasons,
Id_Olimpiad,
OlympiadAwardBonus
)
 values 
(
'350',
'2012-12-18T10:15:12',
'2014-02-06T11:18:35.45',
'Всеукраїнські учнівські олімпіади із базових предметів (IV етап)',
'Історія України. Диплом II ступеня',
'4',
'9',
'40.0'
);
insert into OlympiadsAwards (
Id_OlympiadAward,
DateLastChangeOlimpiad,
DateLastChangeOlympiadAward,
OlimpiadName,
OlympiadAwardName,
Id_PersonRequestSeasons,
Id_Olimpiad,
OlympiadAwardBonus
)
 values 
(
'351',
'2012-12-18T10:15:12',
'2014-02-06T11:18:35.45',
'Всеукраїнські учнівські олімпіади із базових предметів (IV етап)',
'Історія України. Диплом III ступеня',
'4',
'9',
'30.0'
);
insert into OlympiadsAwards (
Id_OlympiadAward,
DateLastChangeOlimpiad,
DateLastChangeOlympiadAward,
OlimpiadName,
OlympiadAwardName,
Id_PersonRequestSeasons,
Id_Olimpiad,
OlympiadAwardBonus
)
 values 
(
'352',
'2012-12-18T10:15:12',
'2014-02-06T11:18:35.45',
'Всеукраїнські учнівські олімпіади із базових предметів (IV етап)',
'Правознавство. Диплом І ступеня',
'4',
'9',
'50.0'
);
insert into OlympiadsAwards (
Id_OlympiadAward,
DateLastChangeOlimpiad,
DateLastChangeOlympiadAward,
OlimpiadName,
OlympiadAwardName,
Id_PersonRequestSeasons,
Id_Olimpiad,
OlympiadAwardBonus
)
 values 
(
'353',
'2012-12-18T10:15:12',
'2014-02-06T11:18:35.45',
'Всеукраїнські учнівські олімпіади із базових предметів (IV етап)',
'Правознавство. Диплом II ступеня',
'4',
'9',
'40.0'
);
insert into OlympiadsAwards (
Id_OlympiadAward,
DateLastChangeOlimpiad,
DateLastChangeOlympiadAward,
OlimpiadName,
OlympiadAwardName,
Id_PersonRequestSeasons,
Id_Olimpiad,
OlympiadAwardBonus
)
 values 
(
'354',
'2012-12-18T10:15:12',
'2014-02-06T11:18:35.45',
'Всеукраїнські учнівські олімпіади із базових предметів (IV етап)',
'Правознавство. Диплом III ступеня',
'4',
'9',
'30.0'
);
insert into OlympiadsAwards (
Id_OlympiadAward,
DateLastChangeOlimpiad,
DateLastChangeOlympiadAward,
OlimpiadName,
OlympiadAwardName,
Id_PersonRequestSeasons,
Id_Olimpiad,
OlympiadAwardBonus
)
 values 
(
'355',
'2012-12-18T10:15:12',
'2014-02-06T11:18:35.45',
'Всеукраїнські учнівські олімпіади із базових предметів (IV етап)',
'Економіка. Диплом І ступеня',
'4',
'9',
'50.0'
);
insert into OlympiadsAwards (
Id_OlympiadAward,
DateLastChangeOlimpiad,
DateLastChangeOlympiadAward,
OlimpiadName,
OlympiadAwardName,
Id_PersonRequestSeasons,
Id_Olimpiad,
OlympiadAwardBonus
)
 values 
(
'356',
'2012-12-18T10:15:12',
'2014-02-06T11:18:35.45',
'Всеукраїнські учнівські олімпіади із базових предметів (IV етап)',
'Економіка. Диплом II ступеня',
'4',
'9',
'40.0'
);
insert into OlympiadsAwards (
Id_OlympiadAward,
DateLastChangeOlimpiad,
DateLastChangeOlympiadAward,
OlimpiadName,
OlympiadAwardName,
Id_PersonRequestSeasons,
Id_Olimpiad,
OlympiadAwardBonus
)
 values 
(
'357',
'2012-12-18T10:15:12',
'2014-02-06T11:18:35.45',
'Всеукраїнські учнівські олімпіади із базових предметів (IV етап)',
'Економіка. Диплом III ступеня',
'4',
'9',
'30.0'
);
insert into OlympiadsAwards (
Id_OlympiadAward,
DateLastChangeOlimpiad,
DateLastChangeOlympiadAward,
OlimpiadName,
OlympiadAwardName,
Id_PersonRequestSeasons,
Id_Olimpiad,
OlympiadAwardBonus
)
 values 
(
'358',
'2012-12-18T10:15:12',
'2014-02-06T11:18:35.45',
'Всеукраїнські учнівські олімпіади із базових предметів (IV етап)',
'Математика. Диплом І ступеня',
'4',
'9',
'50.0'
);
insert into OlympiadsAwards (
Id_OlympiadAward,
DateLastChangeOlimpiad,
DateLastChangeOlympiadAward,
OlimpiadName,
OlympiadAwardName,
Id_PersonRequestSeasons,
Id_Olimpiad,
OlympiadAwardBonus
)
 values 
(
'359',
'2012-12-18T10:15:12',
'2014-02-06T11:18:35.45',
'Всеукраїнські учнівські олімпіади із базових предметів (IV етап)',
'Математика. Диплом II ступеня',
'4',
'9',
'40.0'
);
insert into OlympiadsAwards (
Id_OlympiadAward,
DateLastChangeOlimpiad,
DateLastChangeOlympiadAward,
OlimpiadName,
OlympiadAwardName,
Id_PersonRequestSeasons,
Id_Olimpiad,
OlympiadAwardBonus
)
 values 
(
'360',
'2012-12-18T10:15:12',
'2014-02-06T11:18:35.45',
'Всеукраїнські учнівські олімпіади із базових предметів (IV етап)',
'Математика. Диплом III ступеня',
'4',
'9',
'30.0'
);
insert into OlympiadsAwards (
Id_OlympiadAward,
DateLastChangeOlimpiad,
DateLastChangeOlympiadAward,
OlimpiadName,
OlympiadAwardName,
Id_PersonRequestSeasons,
Id_Olimpiad,
OlympiadAwardBonus
)
 values 
(
'361',
'2012-12-18T10:15:12',
'2014-02-06T11:18:35.45',
'Всеукраїнські учнівські олімпіади із базових предметів (IV етап)',
'Біологія. Диплом І ступеня',
'4',
'9',
'50.0'
);
insert into OlympiadsAwards (
Id_OlympiadAward,
DateLastChangeOlimpiad,
DateLastChangeOlympiadAward,
OlimpiadName,
OlympiadAwardName,
Id_PersonRequestSeasons,
Id_Olimpiad,
OlympiadAwardBonus
)
 values 
(
'362',
'2012-12-18T10:15:12',
'2014-02-06T11:18:35.45',
'Всеукраїнські учнівські олімпіади із базових предметів (IV етап)',
'Біологія. Диплом II ступеня',
'4',
'9',
'40.0'
);
insert into OlympiadsAwards (
Id_OlympiadAward,
DateLastChangeOlimpiad,
DateLastChangeOlympiadAward,
OlimpiadName,
OlympiadAwardName,
Id_PersonRequestSeasons,
Id_Olimpiad,
OlympiadAwardBonus
)
 values 
(
'363',
'2012-12-18T10:15:12',
'2014-02-06T11:18:35.45',
'Всеукраїнські учнівські олімпіади із базових предметів (IV етап)',
'Біологія. Диплом III ступеня',
'4',
'9',
'30.0'
);
insert into OlympiadsAwards (
Id_OlympiadAward,
DateLastChangeOlimpiad,
DateLastChangeOlympiadAward,
OlimpiadName,
OlympiadAwardName,
Id_PersonRequestSeasons,
Id_Olimpiad,
OlympiadAwardBonus
)
 values 
(
'364',
'2012-12-18T10:15:12',
'2014-02-06T11:18:35.45',
'Всеукраїнські учнівські олімпіади із базових предметів (IV етап)',
'Географія. Диплом І ступеня',
'4',
'9',
'50.0'
);
insert into OlympiadsAwards (
Id_OlympiadAward,
DateLastChangeOlimpiad,
DateLastChangeOlympiadAward,
OlimpiadName,
OlympiadAwardName,
Id_PersonRequestSeasons,
Id_Olimpiad,
OlympiadAwardBonus
)
 values 
(
'365',
'2012-12-18T10:15:12',
'2014-02-06T11:18:35.45',
'Всеукраїнські учнівські олімпіади із базових предметів (IV етап)',
'Географія. Диплом II ступеня',
'4',
'9',
'40.0'
);
insert into OlympiadsAwards (
Id_OlympiadAward,
DateLastChangeOlimpiad,
DateLastChangeOlympiadAward,
OlimpiadName,
OlympiadAwardName,
Id_PersonRequestSeasons,
Id_Olimpiad,
OlympiadAwardBonus
)
 values 
(
'366',
'2012-12-18T10:15:12',
'2014-02-06T11:18:35.45',
'Всеукраїнські учнівські олімпіади із базових предметів (IV етап)',
'Географія. Диплом III ступеня',
'4',
'9',
'30.0'
);
insert into OlympiadsAwards (
Id_OlympiadAward,
DateLastChangeOlimpiad,
DateLastChangeOlympiadAward,
OlimpiadName,
OlympiadAwardName,
Id_PersonRequestSeasons,
Id_Olimpiad,
OlympiadAwardBonus
)
 values 
(
'367',
'2012-12-18T10:15:12',
'2014-02-06T11:18:35.45',
'Всеукраїнські учнівські олімпіади із базових предметів (IV етап)',
'Фізика. Диплом І ступеня',
'4',
'9',
'50.0'
);
insert into OlympiadsAwards (
Id_OlympiadAward,
DateLastChangeOlimpiad,
DateLastChangeOlympiadAward,
OlimpiadName,
OlympiadAwardName,
Id_PersonRequestSeasons,
Id_Olimpiad,
OlympiadAwardBonus
)
 values 
(
'368',
'2012-12-18T10:15:12',
'2014-02-06T11:18:35.45',
'Всеукраїнські учнівські олімпіади із базових предметів (IV етап)',
'Фізика. Диплом II ступеня',
'4',
'9',
'40.0'
);
insert into OlympiadsAwards (
Id_OlympiadAward,
DateLastChangeOlimpiad,
DateLastChangeOlympiadAward,
OlimpiadName,
OlympiadAwardName,
Id_PersonRequestSeasons,
Id_Olimpiad,
OlympiadAwardBonus
)
 values 
(
'369',
'2012-12-18T10:15:12',
'2014-02-06T11:18:35.45',
'Всеукраїнські учнівські олімпіади із базових предметів (IV етап)',
'Фізика. Диплом III ступеня',
'4',
'9',
'30.0'
);
insert into OlympiadsAwards (
Id_OlympiadAward,
DateLastChangeOlimpiad,
DateLastChangeOlympiadAward,
OlimpiadName,
OlympiadAwardName,
Id_PersonRequestSeasons,
Id_Olimpiad,
OlympiadAwardBonus
)
 values 
(
'370',
'2012-12-18T10:15:12',
'2014-02-06T11:18:35.45',
'Всеукраїнські учнівські олімпіади із базових предметів (IV етап)',
'Хімія. Диплом І ступеня',
'4',
'9',
'50.0'
);
insert into OlympiadsAwards (
Id_OlympiadAward,
DateLastChangeOlimpiad,
DateLastChangeOlympiadAward,
OlimpiadName,
OlympiadAwardName,
Id_PersonRequestSeasons,
Id_Olimpiad,
OlympiadAwardBonus
)
 values 
(
'371',
'2012-12-18T10:15:12',
'2014-02-06T11:18:35.45',
'Всеукраїнські учнівські олімпіади із базових предметів (IV етап)',
'Хімія. Диплом II ступеня',
'4',
'9',
'40.0'
);
insert into OlympiadsAwards (
Id_OlympiadAward,
DateLastChangeOlimpiad,
DateLastChangeOlympiadAward,
OlimpiadName,
OlympiadAwardName,
Id_PersonRequestSeasons,
Id_Olimpiad,
OlympiadAwardBonus
)
 values 
(
'372',
'2012-12-18T10:15:12',
'2014-02-06T11:18:35.45',
'Всеукраїнські учнівські олімпіади із базових предметів (IV етап)',
'Хімія. Диплом III ступеня',
'4',
'9',
'30.0'
);
insert into OlympiadsAwards (
Id_OlympiadAward,
DateLastChangeOlimpiad,
DateLastChangeOlympiadAward,
OlimpiadName,
OlympiadAwardName,
Id_PersonRequestSeasons,
Id_Olimpiad,
OlympiadAwardBonus
)
 values 
(
'373',
'2012-12-18T10:15:12',
'2014-02-06T11:18:35.45',
'Всеукраїнські учнівські олімпіади із базових предметів (IV етап)',
'Інформаційні технології. Диплом І ступеня',
'4',
'9',
'50.0'
);
insert into OlympiadsAwards (
Id_OlympiadAward,
DateLastChangeOlimpiad,
DateLastChangeOlympiadAward,
OlimpiadName,
OlympiadAwardName,
Id_PersonRequestSeasons,
Id_Olimpiad,
OlympiadAwardBonus
)
 values 
(
'374',
'2012-12-18T10:15:12',
'2014-02-06T11:18:35.45',
'Всеукраїнські учнівські олімпіади із базових предметів (IV етап)',
'Інформаційні технології. Диплом II ступеня',
'4',
'9',
'40.0'
);
insert into OlympiadsAwards (
Id_OlympiadAward,
DateLastChangeOlimpiad,
DateLastChangeOlympiadAward,
OlimpiadName,
OlympiadAwardName,
Id_PersonRequestSeasons,
Id_Olimpiad,
OlympiadAwardBonus
)
 values 
(
'375',
'2012-12-18T10:15:12',
'2014-02-06T11:18:35.45',
'Всеукраїнські учнівські олімпіади із базових предметів (IV етап)',
'Інформаційні технології. Диплом III ступеня',
'4',
'9',
'30.0'
);
insert into OlympiadsAwards (
Id_OlympiadAward,
DateLastChangeOlimpiad,
DateLastChangeOlympiadAward,
OlimpiadName,
OlympiadAwardName,
Id_PersonRequestSeasons,
Id_Olimpiad,
OlympiadAwardBonus
)
 values 
(
'376',
'2012-12-18T10:15:12',
'2014-02-06T11:18:35.45',
'Всеукраїнські учнівські олімпіади із базових предметів (IV етап)',
'Інформатика. Диплом І ступеня',
'4',
'9',
'50.0'
);
insert into OlympiadsAwards (
Id_OlympiadAward,
DateLastChangeOlimpiad,
DateLastChangeOlympiadAward,
OlimpiadName,
OlympiadAwardName,
Id_PersonRequestSeasons,
Id_Olimpiad,
OlympiadAwardBonus
)
 values 
(
'377',
'2012-12-18T10:15:12',
'2014-02-06T11:18:35.45',
'Всеукраїнські учнівські олімпіади із базових предметів (IV етап)',
'Інформатика. Диплом II ступеня',
'4',
'9',
'40.0'
);
insert into OlympiadsAwards (
Id_OlympiadAward,
DateLastChangeOlimpiad,
DateLastChangeOlympiadAward,
OlimpiadName,
OlympiadAwardName,
Id_PersonRequestSeasons,
Id_Olimpiad,
OlympiadAwardBonus
)
 values 
(
'378',
'2012-12-18T10:15:12',
'2014-02-06T11:18:35.45',
'Всеукраїнські учнівські олімпіади із базових предметів (IV етап)',
'Інформатика. Диплом III ступеня',
'4',
'9',
'30.0'
);
insert into OlympiadsAwards (
Id_OlympiadAward,
DateLastChangeOlimpiad,
DateLastChangeOlympiadAward,
OlimpiadName,
OlympiadAwardName,
Id_PersonRequestSeasons,
Id_Olimpiad,
OlympiadAwardBonus
)
 values 
(
'379',
'2012-12-18T10:15:12',
'2014-02-06T11:18:35.45',
'Всеукраїнські учнівські олімпіади із базових предметів (IV етап)',
'Українська мова та література. Диплом І ступеня',
'4',
'9',
'50.0'
);
insert into OlympiadsAwards (
Id_OlympiadAward,
DateLastChangeOlimpiad,
DateLastChangeOlympiadAward,
OlimpiadName,
OlympiadAwardName,
Id_PersonRequestSeasons,
Id_Olimpiad,
OlympiadAwardBonus
)
 values 
(
'380',
'2012-12-18T10:15:12',
'2014-02-06T11:18:35.45',
'Всеукраїнські учнівські олімпіади із базових предметів (IV етап)',
'Українська мова та література. Диплом II ступеня',
'4',
'9',
'40.0'
);
insert into OlympiadsAwards (
Id_OlympiadAward,
DateLastChangeOlimpiad,
DateLastChangeOlympiadAward,
OlimpiadName,
OlympiadAwardName,
Id_PersonRequestSeasons,
Id_Olimpiad,
OlympiadAwardBonus
)
 values 
(
'381',
'2012-12-18T10:15:12',
'2014-02-06T11:18:35.45',
'Всеукраїнські учнівські олімпіади із базових предметів (IV етап)',
'Українська мова та література. Диплом III ступеня',
'4',
'9',
'30.0'
);
insert into OlympiadsAwards (
Id_OlympiadAward,
DateLastChangeOlimpiad,
DateLastChangeOlympiadAward,
OlimpiadName,
OlympiadAwardName,
Id_PersonRequestSeasons,
Id_Olimpiad,
OlympiadAwardBonus
)
 values 
(
'382',
'2012-12-18T10:15:12',
'2014-02-06T11:18:35.45',
'Всеукраїнські учнівські олімпіади із базових предметів (IV етап)',
'Англійська мова. Диплом І ступеня',
'4',
'9',
'50.0'
);
insert into OlympiadsAwards (
Id_OlympiadAward,
DateLastChangeOlimpiad,
DateLastChangeOlympiadAward,
OlimpiadName,
OlympiadAwardName,
Id_PersonRequestSeasons,
Id_Olimpiad,
OlympiadAwardBonus
)
 values 
(
'383',
'2012-12-18T10:15:12',
'2014-02-06T11:18:35.45',
'Всеукраїнські учнівські олімпіади із базових предметів (IV етап)',
'Англійська мова. Диплом II ступеня',
'4',
'9',
'40.0'
);
insert into OlympiadsAwards (
Id_OlympiadAward,
DateLastChangeOlimpiad,
DateLastChangeOlympiadAward,
OlimpiadName,
OlympiadAwardName,
Id_PersonRequestSeasons,
Id_Olimpiad,
OlympiadAwardBonus
)
 values 
(
'384',
'2012-12-18T10:15:12',
'2014-02-06T11:18:35.45',
'Всеукраїнські учнівські олімпіади із базових предметів (IV етап)',
'Англійська мова. Диплом III ступеня',
'4',
'9',
'30.0'
);
insert into OlympiadsAwards (
Id_OlympiadAward,
DateLastChangeOlimpiad,
DateLastChangeOlympiadAward,
OlimpiadName,
OlympiadAwardName,
Id_PersonRequestSeasons,
Id_Olimpiad,
OlympiadAwardBonus
)
 values 
(
'385',
'2012-12-18T10:15:12',
'2014-02-06T11:18:35.45',
'Всеукраїнські учнівські олімпіади із базових предметів (IV етап)',
'Французька мова. Диплом І ступеня',
'4',
'9',
'50.0'
);
insert into OlympiadsAwards (
Id_OlympiadAward,
DateLastChangeOlimpiad,
DateLastChangeOlympiadAward,
OlimpiadName,
OlympiadAwardName,
Id_PersonRequestSeasons,
Id_Olimpiad,
OlympiadAwardBonus
)
 values 
(
'386',
'2012-12-18T10:15:12',
'2014-02-06T11:18:35.45',
'Всеукраїнські учнівські олімпіади із базових предметів (IV етап)',
'Французька мова. Диплом II ступеня',
'4',
'9',
'40.0'
);
insert into OlympiadsAwards (
Id_OlympiadAward,
DateLastChangeOlimpiad,
DateLastChangeOlympiadAward,
OlimpiadName,
OlympiadAwardName,
Id_PersonRequestSeasons,
Id_Olimpiad,
OlympiadAwardBonus
)
 values 
(
'387',
'2012-12-18T10:15:12',
'2014-02-06T11:18:35.45',
'Всеукраїнські учнівські олімпіади із базових предметів (IV етап)',
'Французька мова. Диплом III ступеня',
'4',
'9',
'30.0'
);
insert into OlympiadsAwards (
Id_OlympiadAward,
DateLastChangeOlimpiad,
DateLastChangeOlympiadAward,
OlimpiadName,
OlympiadAwardName,
Id_PersonRequestSeasons,
Id_Olimpiad,
OlympiadAwardBonus
)
 values 
(
'388',
'2012-12-18T10:15:12',
'2014-02-06T11:18:35.45',
'Всеукраїнські учнівські олімпіади із базових предметів (IV етап)',
'Німецька мова. Диплом І ступеня',
'4',
'9',
'50.0'
);
insert into OlympiadsAwards (
Id_OlympiadAward,
DateLastChangeOlimpiad,
DateLastChangeOlympiadAward,
OlimpiadName,
OlympiadAwardName,
Id_PersonRequestSeasons,
Id_Olimpiad,
OlympiadAwardBonus
)
 values 
(
'389',
'2012-12-18T10:15:12',
'2014-02-06T11:18:35.45',
'Всеукраїнські учнівські олімпіади із базових предметів (IV етап)',
'Німецька мова. Диплом II ступеня',
'4',
'9',
'40.0'
);
insert into OlympiadsAwards (
Id_OlympiadAward,
DateLastChangeOlimpiad,
DateLastChangeOlympiadAward,
OlimpiadName,
OlympiadAwardName,
Id_PersonRequestSeasons,
Id_Olimpiad,
OlympiadAwardBonus
)
 values 
(
'390',
'2012-12-18T10:15:12',
'2014-02-06T11:18:35.45',
'Всеукраїнські учнівські олімпіади із базових предметів (IV етап)',
'Німецька мова. Диплом III ступеня',
'4',
'9',
'30.0'
);
insert into OlympiadsAwards (
Id_OlympiadAward,
DateLastChangeOlimpiad,
DateLastChangeOlympiadAward,
OlimpiadName,
OlympiadAwardName,
Id_PersonRequestSeasons,
Id_Olimpiad,
OlympiadAwardBonus
)
 values 
(
'391',
'2012-12-18T10:15:12',
'2014-02-06T11:18:35.45',
'Всеукраїнські учнівські олімпіади із базових предметів (IV етап)',
'Іспанська мова. Диплом І ступеня',
'4',
'9',
'50.0'
);
insert into OlympiadsAwards (
Id_OlympiadAward,
DateLastChangeOlimpiad,
DateLastChangeOlympiadAward,
OlimpiadName,
OlympiadAwardName,
Id_PersonRequestSeasons,
Id_Olimpiad,
OlympiadAwardBonus
)
 values 
(
'392',
'2012-12-18T10:15:12',
'2014-02-06T11:18:35.45',
'Всеукраїнські учнівські олімпіади із базових предметів (IV етап)',
'Іспанська мова. Диплом II ступеня',
'4',
'9',
'40.0'
);
insert into OlympiadsAwards (
Id_OlympiadAward,
DateLastChangeOlimpiad,
DateLastChangeOlympiadAward,
OlimpiadName,
OlympiadAwardName,
Id_PersonRequestSeasons,
Id_Olimpiad,
OlympiadAwardBonus
)
 values 
(
'393',
'2012-12-18T10:15:12',
'2014-02-06T11:18:35.45',
'Всеукраїнські учнівські олімпіади із базових предметів (IV етап)',
'Іспанська мова. Диплом III ступеня',
'4',
'9',
'30.0'
);
insert into OlympiadsAwards (
Id_OlympiadAward,
DateLastChangeOlimpiad,
DateLastChangeOlympiadAward,
OlimpiadName,
OlympiadAwardName,
Id_PersonRequestSeasons,
Id_Olimpiad,
OlympiadAwardBonus
)
 values 
(
'394',
'2012-12-18T10:15:12',
'2014-02-06T11:18:35.45',
'Всеукраїнські учнівські олімпіади із базових предметів (IV етап)',
'Російська мова. Диплом І ступеня',
'4',
'9',
'50.0'
);
insert into OlympiadsAwards (
Id_OlympiadAward,
DateLastChangeOlimpiad,
DateLastChangeOlympiadAward,
OlimpiadName,
OlympiadAwardName,
Id_PersonRequestSeasons,
Id_Olimpiad,
OlympiadAwardBonus
)
 values 
(
'395',
'2012-12-18T10:15:12',
'2014-02-06T11:18:35.45',
'Всеукраїнські учнівські олімпіади із базових предметів (IV етап)',
'Російська мова. Диплом II ступеня',
'4',
'9',
'40.0'
);
insert into OlympiadsAwards (
Id_OlympiadAward,
DateLastChangeOlimpiad,
DateLastChangeOlympiadAward,
OlimpiadName,
OlympiadAwardName,
Id_PersonRequestSeasons,
Id_Olimpiad,
OlympiadAwardBonus
)
 values 
(
'396',
'2012-12-18T10:15:12',
'2014-02-06T11:18:35.45',
'Всеукраїнські учнівські олімпіади із базових предметів (IV етап)',
'Російська мова. Диплом III ступеня',
'4',
'9',
'30.0'
);
insert into OlympiadsAwards (
Id_OlympiadAward,
DateLastChangeOlimpiad,
DateLastChangeOlympiadAward,
OlimpiadName,
OlympiadAwardName,
Id_PersonRequestSeasons,
Id_Olimpiad,
OlympiadAwardBonus
)
 values 
(
'397',
'2012-12-18T10:15:12',
'2014-02-06T11:18:35.45',
'Всеукраїнські учнівські олімпіади із базових предметів (IV етап)',
'Екологія. Диплом І ступеня',
'4',
'9',
'50.0'
);
insert into OlympiadsAwards (
Id_OlympiadAward,
DateLastChangeOlimpiad,
DateLastChangeOlympiadAward,
OlimpiadName,
OlympiadAwardName,
Id_PersonRequestSeasons,
Id_Olimpiad,
OlympiadAwardBonus
)
 values 
(
'398',
'2012-12-18T10:15:12',
'2014-02-06T11:18:35.45',
'Всеукраїнські учнівські олімпіади із базових предметів (IV етап)',
'Екологія. Диплом II ступеня',
'4',
'9',
'40.0'
);
insert into OlympiadsAwards (
Id_OlympiadAward,
DateLastChangeOlimpiad,
DateLastChangeOlympiadAward,
OlimpiadName,
OlympiadAwardName,
Id_PersonRequestSeasons,
Id_Olimpiad,
OlympiadAwardBonus
)
 values 
(
'399',
'2012-12-18T10:15:12',
'2014-02-06T11:18:35.45',
'Всеукраїнські учнівські олімпіади із базових предметів (IV етап)',
'Екологія. Диплом III ступеня',
'4',
'9',
'30.0'
);
insert into OlympiadsAwards (
Id_OlympiadAward,
DateLastChangeOlimpiad,
DateLastChangeOlympiadAward,
OlimpiadName,
OlympiadAwardName,
Id_PersonRequestSeasons,
Id_Olimpiad,
OlympiadAwardBonus
)
 values 
(
'400',
'2012-12-18T10:15:12',
'2014-02-06T11:18:35.45',
'Всеукраїнські учнівські олімпіади із базових предметів (IV етап)',
'Астрономія. Диплом І ступеня',
'4',
'9',
'50.0'
);
insert into OlympiadsAwards (
Id_OlympiadAward,
DateLastChangeOlimpiad,
DateLastChangeOlympiadAward,
OlimpiadName,
OlympiadAwardName,
Id_PersonRequestSeasons,
Id_Olimpiad,
OlympiadAwardBonus
)
 values 
(
'401',
'2012-12-18T10:15:12',
'2014-02-06T11:18:35.45',
'Всеукраїнські учнівські олімпіади із базових предметів (IV етап)',
'Астрономія. Диплом II ступеня',
'4',
'9',
'40.0'
);
insert into OlympiadsAwards (
Id_OlympiadAward,
DateLastChangeOlimpiad,
DateLastChangeOlympiadAward,
OlimpiadName,
OlympiadAwardName,
Id_PersonRequestSeasons,
Id_Olimpiad,
OlympiadAwardBonus
)
 values 
(
'402',
'2012-12-18T10:15:12',
'2014-02-06T11:18:35.45',
'Всеукраїнські учнівські олімпіади із базових предметів (IV етап)',
'Астрономія. Диплом III ступеня',
'4',
'9',
'30.0'
);
insert into OlympiadsAwards (
Id_OlympiadAward,
DateLastChangeOlimpiad,
DateLastChangeOlympiadAward,
OlimpiadName,
OlympiadAwardName,
Id_PersonRequestSeasons,
Id_Olimpiad,
OlympiadAwardBonus
)
 values 
(
'403',
'2012-12-18T10:15:12',
'2014-02-06T11:18:35.45',
'Всеукраїнські учнівські олімпіади із базових предметів (IV етап)',
'Трудове навчання. Диплом І ступеня',
'4',
'9',
'50.0'
);
insert into OlympiadsAwards (
Id_OlympiadAward,
DateLastChangeOlimpiad,
DateLastChangeOlympiadAward,
OlimpiadName,
OlympiadAwardName,
Id_PersonRequestSeasons,
Id_Olimpiad,
OlympiadAwardBonus
)
 values 
(
'404',
'2012-12-18T10:15:12',
'2014-02-06T11:18:35.45',
'Всеукраїнські учнівські олімпіади із базових предметів (IV етап)',
'Трудове навчання. Диплом II ступеня',
'4',
'9',
'40.0'
);
insert into OlympiadsAwards (
Id_OlympiadAward,
DateLastChangeOlimpiad,
DateLastChangeOlympiadAward,
OlimpiadName,
OlympiadAwardName,
Id_PersonRequestSeasons,
Id_Olimpiad,
OlympiadAwardBonus
)
 values 
(
'405',
'2012-12-18T10:15:12',
'2014-02-06T11:18:35.45',
'Всеукраїнські учнівські олімпіади із базових предметів (IV етап)',
'Трудове навчання. Диплом III ступеня',
'4',
'9',
'30.0'
);
insert into OlympiadsAwards (
Id_OlympiadAward,
DateLastChangeOlimpiad,
DateLastChangeOlympiadAward,
OlimpiadName,
OlympiadAwardName,
Id_PersonRequestSeasons,
Id_Olimpiad,
OlympiadAwardBonus
)
 values 
(
'406',
'2012-12-18T10:15:12',
'2014-02-06T11:18:35.45',
'Всеукраїнські учнівські олімпіади із базових предметів (IV етап)',
'Педагогіка та психологія. Диплом І ступеня',
'4',
'9',
'50.0'
);
insert into OlympiadsAwards (
Id_OlympiadAward,
DateLastChangeOlimpiad,
DateLastChangeOlympiadAward,
OlimpiadName,
OlympiadAwardName,
Id_PersonRequestSeasons,
Id_Olimpiad,
OlympiadAwardBonus
)
 values 
(
'407',
'2012-12-18T10:15:12',
'2014-02-06T11:18:35.45',
'Всеукраїнські учнівські олімпіади із базових предметів (IV етап)',
'Педагогіка та психологія. Диплом II ступеня',
'4',
'9',
'40.0'
);
insert into OlympiadsAwards (
Id_OlympiadAward,
DateLastChangeOlimpiad,
DateLastChangeOlympiadAward,
OlimpiadName,
OlympiadAwardName,
Id_PersonRequestSeasons,
Id_Olimpiad,
OlympiadAwardBonus
)
 values 
(
'408',
'2012-12-18T10:15:12',
'2014-02-06T11:18:35.45',
'Всеукраїнські учнівські олімпіади із базових предметів (IV етап)',
'Педагогіка та психологія. Диплом III ступеня',
'4',
'9',
'30.0'
);
insert into OlympiadsAwards (
Id_OlympiadAward,
DateLastChangeOlimpiad,
DateLastChangeOlympiadAward,
OlimpiadName,
OlympiadAwardName,
Id_PersonRequestSeasons,
Id_Olimpiad,
OlympiadAwardBonus
)
 values 
(
'409',
'2012-12-18T10:15:12',
'2014-02-06T11:18:35.45',
'Всеукраїнські учнівські олімпіади із базових предметів (IV етап)',
'Фізична культура і спорт. Диплом І ступеня',
'4',
'9',
'50.0'
);
insert into OlympiadsAwards (
Id_OlympiadAward,
DateLastChangeOlimpiad,
DateLastChangeOlympiadAward,
OlimpiadName,
OlympiadAwardName,
Id_PersonRequestSeasons,
Id_Olimpiad,
OlympiadAwardBonus
)
 values 
(
'410',
'2012-12-18T10:15:12',
'2014-02-06T11:18:35.45',
'Всеукраїнські учнівські олімпіади із базових предметів (IV етап)',
'Фізична культура і спорт. Диплом II ступеня',
'4',
'9',
'40.0'
);
insert into OlympiadsAwards (
Id_OlympiadAward,
DateLastChangeOlimpiad,
DateLastChangeOlympiadAward,
OlimpiadName,
OlympiadAwardName,
Id_PersonRequestSeasons,
Id_Olimpiad,
OlympiadAwardBonus
)
 values 
(
'411',
'2012-12-18T10:15:12',
'2014-02-06T11:18:35.45',
'Всеукраїнські учнівські олімпіади із базових предметів (IV етап)',
'Фізична культура і спорт. Диплом III ступеня',
'4',
'9',
'30.0'
);
insert into OlympiadsAwards (
Id_OlympiadAward,
DateLastChangeOlimpiad,
DateLastChangeOlympiadAward,
OlimpiadName,
OlympiadAwardName,
Id_PersonRequestSeasons,
Id_Olimpiad,
OlympiadAwardBonus
)
 values 
(
'412',
'2012-12-18T10:15:12',
'2014-02-06T11:18:45.87',
'Всеукраїнські конкурси — захисти науково-дослідницьких робіт учнів - членів Малої академії наук України',
'Історія України. Диплом I ступеня',
'4',
'10',
'50.0'
);
insert into OlympiadsAwards (
Id_OlympiadAward,
DateLastChangeOlimpiad,
DateLastChangeOlympiadAward,
OlimpiadName,
OlympiadAwardName,
Id_PersonRequestSeasons,
Id_Olimpiad,
OlympiadAwardBonus
)
 values 
(
'413',
'2012-12-18T10:15:12',
'2014-02-06T11:18:45.87',
'Всеукраїнські конкурси — захисти науково-дослідницьких робіт учнів - членів Малої академії наук України',
'Історія України. Диплом II ступеня',
'4',
'10',
'40.0'
);
insert into OlympiadsAwards (
Id_OlympiadAward,
DateLastChangeOlimpiad,
DateLastChangeOlympiadAward,
OlimpiadName,
OlympiadAwardName,
Id_PersonRequestSeasons,
Id_Olimpiad,
OlympiadAwardBonus
)
 values 
(
'414',
'2012-12-18T10:15:12',
'2014-02-06T11:18:45.87',
'Всеукраїнські конкурси — захисти науково-дослідницьких робіт учнів - членів Малої академії наук України',
'Історія України. Диплом III ступеня',
'4',
'10',
'30.0'
);
insert into OlympiadsAwards (
Id_OlympiadAward,
DateLastChangeOlimpiad,
DateLastChangeOlympiadAward,
OlimpiadName,
OlympiadAwardName,
Id_PersonRequestSeasons,
Id_Olimpiad,
OlympiadAwardBonus
)
 values 
(
'415',
'2012-12-18T10:15:12',
'2014-02-06T11:18:45.87',
'Всеукраїнські конкурси — захисти науково-дослідницьких робіт учнів - членів Малої академії наук України',
'Правознавство. Диплом I ступеня',
'4',
'10',
'50.0'
);
insert into OlympiadsAwards (
Id_OlympiadAward,
DateLastChangeOlimpiad,
DateLastChangeOlympiadAward,
OlimpiadName,
OlympiadAwardName,
Id_PersonRequestSeasons,
Id_Olimpiad,
OlympiadAwardBonus
)
 values 
(
'416',
'2012-12-18T10:15:12',
'2014-02-06T11:18:45.87',
'Всеукраїнські конкурси — захисти науково-дослідницьких робіт учнів - членів Малої академії наук України',
'Правознавство. Диплом II ступеня',
'4',
'10',
'40.0'
);
insert into OlympiadsAwards (
Id_OlympiadAward,
DateLastChangeOlimpiad,
DateLastChangeOlympiadAward,
OlimpiadName,
OlympiadAwardName,
Id_PersonRequestSeasons,
Id_Olimpiad,
OlympiadAwardBonus
)
 values 
(
'417',
'2012-12-18T10:15:12',
'2014-02-06T11:18:45.87',
'Всеукраїнські конкурси — захисти науково-дослідницьких робіт учнів - членів Малої академії наук України',
'Правознавство. Диплом III ступеня',
'4',
'10',
'30.0'
);
insert into OlympiadsAwards (
Id_OlympiadAward,
DateLastChangeOlimpiad,
DateLastChangeOlympiadAward,
OlimpiadName,
OlympiadAwardName,
Id_PersonRequestSeasons,
Id_Olimpiad,
OlympiadAwardBonus
)
 values 
(
'418',
'2012-12-18T10:15:12',
'2014-02-06T11:18:45.87',
'Всеукраїнські конкурси — захисти науково-дослідницьких робіт учнів - членів Малої академії наук України',
'Економіка. Диплом I ступеня',
'4',
'10',
'50.0'
);
insert into OlympiadsAwards (
Id_OlympiadAward,
DateLastChangeOlimpiad,
DateLastChangeOlympiadAward,
OlimpiadName,
OlympiadAwardName,
Id_PersonRequestSeasons,
Id_Olimpiad,
OlympiadAwardBonus
)
 values 
(
'419',
'2012-12-18T10:15:12',
'2014-02-06T11:18:45.87',
'Всеукраїнські конкурси — захисти науково-дослідницьких робіт учнів - членів Малої академії наук України',
'Економіка. Диплом II ступеня',
'4',
'10',
'40.0'
);
insert into OlympiadsAwards (
Id_OlympiadAward,
DateLastChangeOlimpiad,
DateLastChangeOlympiadAward,
OlimpiadName,
OlympiadAwardName,
Id_PersonRequestSeasons,
Id_Olimpiad,
OlympiadAwardBonus
)
 values 
(
'420',
'2012-12-18T10:15:12',
'2014-02-06T11:18:45.87',
'Всеукраїнські конкурси — захисти науково-дослідницьких робіт учнів - членів Малої академії наук України',
'Економіка. Диплом III ступеня',
'4',
'10',
'30.0'
);
insert into OlympiadsAwards (
Id_OlympiadAward,
DateLastChangeOlimpiad,
DateLastChangeOlympiadAward,
OlimpiadName,
OlympiadAwardName,
Id_PersonRequestSeasons,
Id_Olimpiad,
OlympiadAwardBonus
)
 values 
(
'421',
'2012-12-18T10:15:12',
'2014-02-06T11:18:45.87',
'Всеукраїнські конкурси — захисти науково-дослідницьких робіт учнів - членів Малої академії наук України',
'Математика. Диплом I ступеня',
'4',
'10',
'50.0'
);
insert into OlympiadsAwards (
Id_OlympiadAward,
DateLastChangeOlimpiad,
DateLastChangeOlympiadAward,
OlimpiadName,
OlympiadAwardName,
Id_PersonRequestSeasons,
Id_Olimpiad,
OlympiadAwardBonus
)
 values 
(
'422',
'2012-12-18T10:15:12',
'2014-02-06T11:18:45.87',
'Всеукраїнські конкурси — захисти науково-дослідницьких робіт учнів - членів Малої академії наук України',
'Математика. Диплом II ступеня',
'4',
'10',
'40.0'
);
insert into OlympiadsAwards (
Id_OlympiadAward,
DateLastChangeOlimpiad,
DateLastChangeOlympiadAward,
OlimpiadName,
OlympiadAwardName,
Id_PersonRequestSeasons,
Id_Olimpiad,
OlympiadAwardBonus
)
 values 
(
'423',
'2012-12-18T10:15:12',
'2014-02-06T11:18:45.87',
'Всеукраїнські конкурси — захисти науково-дослідницьких робіт учнів - членів Малої академії наук України',
'Математика. Диплом III ступеня',
'4',
'10',
'30.0'
);
insert into OlympiadsAwards (
Id_OlympiadAward,
DateLastChangeOlimpiad,
DateLastChangeOlympiadAward,
OlimpiadName,
OlympiadAwardName,
Id_PersonRequestSeasons,
Id_Olimpiad,
OlympiadAwardBonus
)
 values 
(
'424',
'2012-12-18T10:15:12',
'2014-02-06T11:18:45.87',
'Всеукраїнські конкурси — захисти науково-дослідницьких робіт учнів - членів Малої академії наук України',
'Біологія. Диплом I ступеня',
'4',
'10',
'50.0'
);
insert into OlympiadsAwards (
Id_OlympiadAward,
DateLastChangeOlimpiad,
DateLastChangeOlympiadAward,
OlimpiadName,
OlympiadAwardName,
Id_PersonRequestSeasons,
Id_Olimpiad,
OlympiadAwardBonus
)
 values 
(
'425',
'2012-12-18T10:15:12',
'2014-02-06T11:18:45.87',
'Всеукраїнські конкурси — захисти науково-дослідницьких робіт учнів - членів Малої академії наук України',
'Біологія. Диплом II ступеня',
'4',
'10',
'40.0'
);
insert into OlympiadsAwards (
Id_OlympiadAward,
DateLastChangeOlimpiad,
DateLastChangeOlympiadAward,
OlimpiadName,
OlympiadAwardName,
Id_PersonRequestSeasons,
Id_Olimpiad,
OlympiadAwardBonus
)
 values 
(
'426',
'2012-12-18T10:15:12',
'2014-02-06T11:18:45.87',
'Всеукраїнські конкурси — захисти науково-дослідницьких робіт учнів - членів Малої академії наук України',
'Біологія. Диплом III ступеня',
'4',
'10',
'30.0'
);
insert into OlympiadsAwards (
Id_OlympiadAward,
DateLastChangeOlimpiad,
DateLastChangeOlympiadAward,
OlimpiadName,
OlympiadAwardName,
Id_PersonRequestSeasons,
Id_Olimpiad,
OlympiadAwardBonus
)
 values 
(
'427',
'2012-12-18T10:15:12',
'2014-02-06T11:18:45.87',
'Всеукраїнські конкурси — захисти науково-дослідницьких робіт учнів - членів Малої академії наук України',
'Географія. Диплом I ступеня',
'4',
'10',
'50.0'
);
insert into OlympiadsAwards (
Id_OlympiadAward,
DateLastChangeOlimpiad,
DateLastChangeOlympiadAward,
OlimpiadName,
OlympiadAwardName,
Id_PersonRequestSeasons,
Id_Olimpiad,
OlympiadAwardBonus
)
 values 
(
'428',
'2012-12-18T10:15:12',
'2014-02-06T11:18:45.87',
'Всеукраїнські конкурси — захисти науково-дослідницьких робіт учнів - членів Малої академії наук України',
'Географія. Диплом II ступеня',
'4',
'10',
'40.0'
);
insert into OlympiadsAwards (
Id_OlympiadAward,
DateLastChangeOlimpiad,
DateLastChangeOlympiadAward,
OlimpiadName,
OlympiadAwardName,
Id_PersonRequestSeasons,
Id_Olimpiad,
OlympiadAwardBonus
)
 values 
(
'429',
'2012-12-18T10:15:12',
'2014-02-06T11:18:45.87',
'Всеукраїнські конкурси — захисти науково-дослідницьких робіт учнів - членів Малої академії наук України',
'Географія. Диплом III ступеня',
'4',
'10',
'30.0'
);
insert into OlympiadsAwards (
Id_OlympiadAward,
DateLastChangeOlimpiad,
DateLastChangeOlympiadAward,
OlimpiadName,
OlympiadAwardName,
Id_PersonRequestSeasons,
Id_Olimpiad,
OlympiadAwardBonus
)
 values 
(
'430',
'2012-12-18T10:15:12',
'2014-02-06T11:18:45.87',
'Всеукраїнські конкурси — захисти науково-дослідницьких робіт учнів - членів Малої академії наук України',
'Фізика. Диплом I ступеня',
'4',
'10',
'50.0'
);
insert into OlympiadsAwards (
Id_OlympiadAward,
DateLastChangeOlimpiad,
DateLastChangeOlympiadAward,
OlimpiadName,
OlympiadAwardName,
Id_PersonRequestSeasons,
Id_Olimpiad,
OlympiadAwardBonus
)
 values 
(
'431',
'2012-12-18T10:15:12',
'2014-02-06T11:18:45.87',
'Всеукраїнські конкурси — захисти науково-дослідницьких робіт учнів - членів Малої академії наук України',
'Фізика. Диплом II ступеня',
'4',
'10',
'40.0'
);
insert into OlympiadsAwards (
Id_OlympiadAward,
DateLastChangeOlimpiad,
DateLastChangeOlympiadAward,
OlimpiadName,
OlympiadAwardName,
Id_PersonRequestSeasons,
Id_Olimpiad,
OlympiadAwardBonus
)
 values 
(
'432',
'2012-12-18T10:15:12',
'2014-02-06T11:18:45.87',
'Всеукраїнські конкурси — захисти науково-дослідницьких робіт учнів - членів Малої академії наук України',
'Фізика. Диплом III ступеня',
'4',
'10',
'30.0'
);
insert into OlympiadsAwards (
Id_OlympiadAward,
DateLastChangeOlimpiad,
DateLastChangeOlympiadAward,
OlimpiadName,
OlympiadAwardName,
Id_PersonRequestSeasons,
Id_Olimpiad,
OlympiadAwardBonus
)
 values 
(
'433',
'2012-12-18T10:15:12',
'2014-02-06T11:18:45.87',
'Всеукраїнські конкурси — захисти науково-дослідницьких робіт учнів - членів Малої академії наук України',
'Хімія. Диплом I ступеня',
'4',
'10',
'50.0'
);
insert into OlympiadsAwards (
Id_OlympiadAward,
DateLastChangeOlimpiad,
DateLastChangeOlympiadAward,
OlimpiadName,
OlympiadAwardName,
Id_PersonRequestSeasons,
Id_Olimpiad,
OlympiadAwardBonus
)
 values 
(
'434',
'2012-12-18T10:15:12',
'2014-02-06T11:18:45.87',
'Всеукраїнські конкурси — захисти науково-дослідницьких робіт учнів - членів Малої академії наук України',
'Хімія. Диплом II ступеня',
'4',
'10',
'40.0'
);
insert into OlympiadsAwards (
Id_OlympiadAward,
DateLastChangeOlimpiad,
DateLastChangeOlympiadAward,
OlimpiadName,
OlympiadAwardName,
Id_PersonRequestSeasons,
Id_Olimpiad,
OlympiadAwardBonus
)
 values 
(
'435',
'2012-12-18T10:15:12',
'2014-02-06T11:18:45.87',
'Всеукраїнські конкурси — захисти науково-дослідницьких робіт учнів - членів Малої академії наук України',
'Хімія. Диплом III ступеня',
'4',
'10',
'30.0'
);
insert into OlympiadsAwards (
Id_OlympiadAward,
DateLastChangeOlimpiad,
DateLastChangeOlympiadAward,
OlimpiadName,
OlympiadAwardName,
Id_PersonRequestSeasons,
Id_Olimpiad,
OlympiadAwardBonus
)
 values 
(
'436',
'2012-12-18T10:15:12',
'2014-02-06T11:18:45.87',
'Всеукраїнські конкурси — захисти науково-дослідницьких робіт учнів - членів Малої академії наук України',
'Технології. Диплом I ступеня',
'4',
'10',
'50.0'
);
insert into OlympiadsAwards (
Id_OlympiadAward,
DateLastChangeOlimpiad,
DateLastChangeOlympiadAward,
OlimpiadName,
OlympiadAwardName,
Id_PersonRequestSeasons,
Id_Olimpiad,
OlympiadAwardBonus
)
 values 
(
'437',
'2012-12-18T10:15:12',
'2014-02-06T11:18:45.87',
'Всеукраїнські конкурси — захисти науково-дослідницьких робіт учнів - членів Малої академії наук України',
'Інформаційні технології. Диплом II ступеня',
'4',
'10',
'40.0'
);
insert into OlympiadsAwards (
Id_OlympiadAward,
DateLastChangeOlimpiad,
DateLastChangeOlympiadAward,
OlimpiadName,
OlympiadAwardName,
Id_PersonRequestSeasons,
Id_Olimpiad,
OlympiadAwardBonus
)
 values 
(
'438',
'2012-12-18T10:15:12',
'2014-02-06T11:18:45.87',
'Всеукраїнські конкурси — захисти науково-дослідницьких робіт учнів - членів Малої академії наук України',
'Інформаційні технології. Диплом III ступеня',
'4',
'10',
'30.0'
);
insert into OlympiadsAwards (
Id_OlympiadAward,
DateLastChangeOlimpiad,
DateLastChangeOlympiadAward,
OlimpiadName,
OlympiadAwardName,
Id_PersonRequestSeasons,
Id_Olimpiad,
OlympiadAwardBonus
)
 values 
(
'439',
'2012-12-18T10:15:12',
'2014-02-06T11:18:45.87',
'Всеукраїнські конкурси — захисти науково-дослідницьких робіт учнів - членів Малої академії наук України',
'Інформатика. Диплом I ступеня',
'4',
'10',
'50.0'
);
insert into OlympiadsAwards (
Id_OlympiadAward,
DateLastChangeOlimpiad,
DateLastChangeOlympiadAward,
OlimpiadName,
OlympiadAwardName,
Id_PersonRequestSeasons,
Id_Olimpiad,
OlympiadAwardBonus
)
 values 
(
'440',
'2012-12-18T10:15:12',
'2014-02-06T11:18:45.87',
'Всеукраїнські конкурси — захисти науково-дослідницьких робіт учнів - членів Малої академії наук України',
'Інформатика. Диплом II ступеня',
'4',
'10',
'40.0'
);
insert into OlympiadsAwards (
Id_OlympiadAward,
DateLastChangeOlimpiad,
DateLastChangeOlympiadAward,
OlimpiadName,
OlympiadAwardName,
Id_PersonRequestSeasons,
Id_Olimpiad,
OlympiadAwardBonus
)
 values 
(
'441',
'2012-12-18T10:15:12',
'2014-02-06T11:18:45.87',
'Всеукраїнські конкурси — захисти науково-дослідницьких робіт учнів - членів Малої академії наук України',
'Інформатика. Диплом III ступеня',
'4',
'10',
'30.0'
);
insert into OlympiadsAwards (
Id_OlympiadAward,
DateLastChangeOlimpiad,
DateLastChangeOlympiadAward,
OlimpiadName,
OlympiadAwardName,
Id_PersonRequestSeasons,
Id_Olimpiad,
OlympiadAwardBonus
)
 values 
(
'442',
'2012-12-18T10:15:12',
'2014-02-06T11:18:45.87',
'Всеукраїнські конкурси — захисти науково-дослідницьких робіт учнів - членів Малої академії наук України',
'Українська мова та література. Диплом I ступеня',
'4',
'10',
'50.0'
);
insert into OlympiadsAwards (
Id_OlympiadAward,
DateLastChangeOlimpiad,
DateLastChangeOlympiadAward,
OlimpiadName,
OlympiadAwardName,
Id_PersonRequestSeasons,
Id_Olimpiad,
OlympiadAwardBonus
)
 values 
(
'443',
'2012-12-18T10:15:12',
'2014-02-06T11:18:45.87',
'Всеукраїнські конкурси — захисти науково-дослідницьких робіт учнів - членів Малої академії наук України',
'Українська мова та література. Диплом II ступеня',
'4',
'10',
'40.0'
);
insert into OlympiadsAwards (
Id_OlympiadAward,
DateLastChangeOlimpiad,
DateLastChangeOlympiadAward,
OlimpiadName,
OlympiadAwardName,
Id_PersonRequestSeasons,
Id_Olimpiad,
OlympiadAwardBonus
)
 values 
(
'444',
'2012-12-18T10:15:12',
'2014-02-06T11:18:45.87',
'Всеукраїнські конкурси — захисти науково-дослідницьких робіт учнів - членів Малої академії наук України',
'Українська мова та література. Диплом III ступеня',
'4',
'10',
'30.0'
);
insert into OlympiadsAwards (
Id_OlympiadAward,
DateLastChangeOlimpiad,
DateLastChangeOlympiadAward,
OlimpiadName,
OlympiadAwardName,
Id_PersonRequestSeasons,
Id_Olimpiad,
OlympiadAwardBonus
)
 values 
(
'445',
'2012-12-18T10:15:12',
'2014-02-06T11:18:45.87',
'Всеукраїнські конкурси — захисти науково-дослідницьких робіт учнів - членів Малої академії наук України',
'Англійська мова. Диплом I ступеня',
'4',
'10',
'50.0'
);
insert into OlympiadsAwards (
Id_OlympiadAward,
DateLastChangeOlimpiad,
DateLastChangeOlympiadAward,
OlimpiadName,
OlympiadAwardName,
Id_PersonRequestSeasons,
Id_Olimpiad,
OlympiadAwardBonus
)
 values 
(
'446',
'2012-12-18T10:15:12',
'2014-02-06T11:18:45.87',
'Всеукраїнські конкурси — захисти науково-дослідницьких робіт учнів - членів Малої академії наук України',
'Англійська мова. Диплом II ступеня',
'4',
'10',
'40.0'
);
insert into OlympiadsAwards (
Id_OlympiadAward,
DateLastChangeOlimpiad,
DateLastChangeOlympiadAward,
OlimpiadName,
OlympiadAwardName,
Id_PersonRequestSeasons,
Id_Olimpiad,
OlympiadAwardBonus
)
 values 
(
'447',
'2012-12-18T10:15:12',
'2014-02-06T11:18:45.87',
'Всеукраїнські конкурси — захисти науково-дослідницьких робіт учнів - членів Малої академії наук України',
'Англійська мова. Диплом III ступеня',
'4',
'10',
'30.0'
);
insert into OlympiadsAwards (
Id_OlympiadAward,
DateLastChangeOlimpiad,
DateLastChangeOlympiadAward,
OlimpiadName,
OlympiadAwardName,
Id_PersonRequestSeasons,
Id_Olimpiad,
OlympiadAwardBonus
)
 values 
(
'448',
'2012-12-18T10:15:12',
'2014-02-06T11:18:45.87',
'Всеукраїнські конкурси — захисти науково-дослідницьких робіт учнів - членів Малої академії наук України',
'Французька мова. Диплом I ступеня',
'4',
'10',
'50.0'
);
insert into OlympiadsAwards (
Id_OlympiadAward,
DateLastChangeOlimpiad,
DateLastChangeOlympiadAward,
OlimpiadName,
OlympiadAwardName,
Id_PersonRequestSeasons,
Id_Olimpiad,
OlympiadAwardBonus
)
 values 
(
'449',
'2012-12-18T10:15:12',
'2014-02-06T11:18:45.87',
'Всеукраїнські конкурси — захисти науково-дослідницьких робіт учнів - членів Малої академії наук України',
'Французька мова. Диплом II ступеня',
'4',
'10',
'40.0'
);
insert into OlympiadsAwards (
Id_OlympiadAward,
DateLastChangeOlimpiad,
DateLastChangeOlympiadAward,
OlimpiadName,
OlympiadAwardName,
Id_PersonRequestSeasons,
Id_Olimpiad,
OlympiadAwardBonus
)
 values 
(
'450',
'2012-12-18T10:15:12',
'2014-02-06T11:18:45.87',
'Всеукраїнські конкурси — захисти науково-дослідницьких робіт учнів - членів Малої академії наук України',
'Французька мова. Диплом III ступеня',
'4',
'10',
'30.0'
);
insert into OlympiadsAwards (
Id_OlympiadAward,
DateLastChangeOlimpiad,
DateLastChangeOlympiadAward,
OlimpiadName,
OlympiadAwardName,
Id_PersonRequestSeasons,
Id_Olimpiad,
OlympiadAwardBonus
)
 values 
(
'451',
'2012-12-18T10:15:12',
'2014-02-06T11:18:45.87',
'Всеукраїнські конкурси — захисти науково-дослідницьких робіт учнів - членів Малої академії наук України',
'Німецька мова. Диплом I ступеня',
'4',
'10',
'50.0'
);
insert into OlympiadsAwards (
Id_OlympiadAward,
DateLastChangeOlimpiad,
DateLastChangeOlympiadAward,
OlimpiadName,
OlympiadAwardName,
Id_PersonRequestSeasons,
Id_Olimpiad,
OlympiadAwardBonus
)
 values 
(
'452',
'2012-12-18T10:15:12',
'2014-02-06T11:18:45.87',
'Всеукраїнські конкурси — захисти науково-дослідницьких робіт учнів - членів Малої академії наук України',
'Німецька мова. Диплом II ступеня',
'4',
'10',
'40.0'
);
insert into OlympiadsAwards (
Id_OlympiadAward,
DateLastChangeOlimpiad,
DateLastChangeOlympiadAward,
OlimpiadName,
OlympiadAwardName,
Id_PersonRequestSeasons,
Id_Olimpiad,
OlympiadAwardBonus
)
 values 
(
'453',
'2012-12-18T10:15:12',
'2014-02-06T11:18:45.87',
'Всеукраїнські конкурси — захисти науково-дослідницьких робіт учнів - членів Малої академії наук України',
'Німецька мова. Диплом III ступеня',
'4',
'10',
'30.0'
);
insert into OlympiadsAwards (
Id_OlympiadAward,
DateLastChangeOlimpiad,
DateLastChangeOlympiadAward,
OlimpiadName,
OlympiadAwardName,
Id_PersonRequestSeasons,
Id_Olimpiad,
OlympiadAwardBonus
)
 values 
(
'454',
'2012-12-18T10:15:12',
'2014-02-06T11:18:45.87',
'Всеукраїнські конкурси — захисти науково-дослідницьких робіт учнів - членів Малої академії наук України',
'Іспанська мова. Диплом I ступеня',
'4',
'10',
'50.0'
);
insert into OlympiadsAwards (
Id_OlympiadAward,
DateLastChangeOlimpiad,
DateLastChangeOlympiadAward,
OlimpiadName,
OlympiadAwardName,
Id_PersonRequestSeasons,
Id_Olimpiad,
OlympiadAwardBonus
)
 values 
(
'455',
'2012-12-18T10:15:12',
'2014-02-06T11:18:45.87',
'Всеукраїнські конкурси — захисти науково-дослідницьких робіт учнів - членів Малої академії наук України',
'Іспанська мова. Диплом II ступеня',
'4',
'10',
'40.0'
);
insert into OlympiadsAwards (
Id_OlympiadAward,
DateLastChangeOlimpiad,
DateLastChangeOlympiadAward,
OlimpiadName,
OlympiadAwardName,
Id_PersonRequestSeasons,
Id_Olimpiad,
OlympiadAwardBonus
)
 values 
(
'456',
'2012-12-18T10:15:12',
'2014-02-06T11:18:45.87',
'Всеукраїнські конкурси — захисти науково-дослідницьких робіт учнів - членів Малої академії наук України',
'Іспанська мова. Диплом III ступеня',
'4',
'10',
'30.0'
);
insert into OlympiadsAwards (
Id_OlympiadAward,
DateLastChangeOlimpiad,
DateLastChangeOlympiadAward,
OlimpiadName,
OlympiadAwardName,
Id_PersonRequestSeasons,
Id_Olimpiad,
OlympiadAwardBonus
)
 values 
(
'457',
'2012-12-18T10:15:12',
'2014-02-06T11:18:45.87',
'Всеукраїнські конкурси — захисти науково-дослідницьких робіт учнів - членів Малої академії наук України',
'Російська мова. Диплом I ступеня',
'4',
'10',
'50.0'
);
insert into OlympiadsAwards (
Id_OlympiadAward,
DateLastChangeOlimpiad,
DateLastChangeOlympiadAward,
OlimpiadName,
OlympiadAwardName,
Id_PersonRequestSeasons,
Id_Olimpiad,
OlympiadAwardBonus
)
 values 
(
'458',
'2012-12-18T10:15:12',
'2014-02-06T11:18:45.87',
'Всеукраїнські конкурси — захисти науково-дослідницьких робіт учнів - членів Малої академії наук України',
'Російська мова. Диплом II ступеня',
'4',
'10',
'40.0'
);
insert into OlympiadsAwards (
Id_OlympiadAward,
DateLastChangeOlimpiad,
DateLastChangeOlympiadAward,
OlimpiadName,
OlympiadAwardName,
Id_PersonRequestSeasons,
Id_Olimpiad,
OlympiadAwardBonus
)
 values 
(
'459',
'2012-12-18T10:15:12',
'2014-02-06T11:18:45.87',
'Всеукраїнські конкурси — захисти науково-дослідницьких робіт учнів - членів Малої академії наук України',
'Російська мова. Диплом III ступеня',
'4',
'10',
'30.0'
);
insert into OlympiadsAwards (
Id_OlympiadAward,
DateLastChangeOlimpiad,
DateLastChangeOlympiadAward,
OlimpiadName,
OlympiadAwardName,
Id_PersonRequestSeasons,
Id_Olimpiad,
OlympiadAwardBonus
)
 values 
(
'460',
'2012-12-18T10:15:12',
'2014-02-06T11:18:45.87',
'Всеукраїнські конкурси — захисти науково-дослідницьких робіт учнів - членів Малої академії наук України',
'Екологія. Диплом I ступеня',
'4',
'10',
'50.0'
);
insert into OlympiadsAwards (
Id_OlympiadAward,
DateLastChangeOlimpiad,
DateLastChangeOlympiadAward,
OlimpiadName,
OlympiadAwardName,
Id_PersonRequestSeasons,
Id_Olimpiad,
OlympiadAwardBonus
)
 values 
(
'461',
'2012-12-18T10:15:12',
'2014-02-06T11:18:45.87',
'Всеукраїнські конкурси — захисти науково-дослідницьких робіт учнів - членів Малої академії наук України',
'Екологія. Диплом II ступеня',
'4',
'10',
'40.0'
);
insert into OlympiadsAwards (
Id_OlympiadAward,
DateLastChangeOlimpiad,
DateLastChangeOlympiadAward,
OlimpiadName,
OlympiadAwardName,
Id_PersonRequestSeasons,
Id_Olimpiad,
OlympiadAwardBonus
)
 values 
(
'462',
'2012-12-18T10:15:12',
'2014-02-06T11:18:45.87',
'Всеукраїнські конкурси — захисти науково-дослідницьких робіт учнів - членів Малої академії наук України',
'Екологія. Диплом III ступеня',
'4',
'10',
'30.0'
);
insert into OlympiadsAwards (
Id_OlympiadAward,
DateLastChangeOlimpiad,
DateLastChangeOlympiadAward,
OlimpiadName,
OlympiadAwardName,
Id_PersonRequestSeasons,
Id_Olimpiad,
OlympiadAwardBonus
)
 values 
(
'463',
'2012-12-18T10:15:12',
'2014-02-06T11:18:45.87',
'Всеукраїнські конкурси — захисти науково-дослідницьких робіт учнів - членів Малої академії наук України',
'Астрономія. Диплом I ступеня',
'4',
'10',
'50.0'
);
insert into OlympiadsAwards (
Id_OlympiadAward,
DateLastChangeOlimpiad,
DateLastChangeOlympiadAward,
OlimpiadName,
OlympiadAwardName,
Id_PersonRequestSeasons,
Id_Olimpiad,
OlympiadAwardBonus
)
 values 
(
'464',
'2012-12-18T10:15:12',
'2014-02-06T11:18:45.87',
'Всеукраїнські конкурси — захисти науково-дослідницьких робіт учнів - членів Малої академії наук України',
'Астрономія. Диплом II ступеня',
'4',
'10',
'40.0'
);
insert into OlympiadsAwards (
Id_OlympiadAward,
DateLastChangeOlimpiad,
DateLastChangeOlympiadAward,
OlimpiadName,
OlympiadAwardName,
Id_PersonRequestSeasons,
Id_Olimpiad,
OlympiadAwardBonus
)
 values 
(
'465',
'2012-12-18T10:15:12',
'2014-02-06T11:18:45.87',
'Всеукраїнські конкурси — захисти науково-дослідницьких робіт учнів - членів Малої академії наук України',
'Астрономія. Диплом III ступеня',
'4',
'10',
'30.0'
);
insert into OlympiadsAwards (
Id_OlympiadAward,
DateLastChangeOlimpiad,
DateLastChangeOlympiadAward,
OlimpiadName,
OlympiadAwardName,
Id_PersonRequestSeasons,
Id_Olimpiad,
OlympiadAwardBonus
)
 values 
(
'466',
'2012-12-18T10:15:12',
'2014-02-06T11:18:45.87',
'Всеукраїнські конкурси — захисти науково-дослідницьких робіт учнів - членів Малої академії наук України',
'Трудове навчання. Диплом I ступеня',
'4',
'10',
'50.0'
);
insert into OlympiadsAwards (
Id_OlympiadAward,
DateLastChangeOlimpiad,
DateLastChangeOlympiadAward,
OlimpiadName,
OlympiadAwardName,
Id_PersonRequestSeasons,
Id_Olimpiad,
OlympiadAwardBonus
)
 values 
(
'467',
'2012-12-18T10:15:12',
'2014-02-06T11:18:45.87',
'Всеукраїнські конкурси — захисти науково-дослідницьких робіт учнів - членів Малої академії наук України',
'Трудове навчання. Диплом II ступеня',
'4',
'10',
'40.0'
);
insert into OlympiadsAwards (
Id_OlympiadAward,
DateLastChangeOlimpiad,
DateLastChangeOlympiadAward,
OlimpiadName,
OlympiadAwardName,
Id_PersonRequestSeasons,
Id_Olimpiad,
OlympiadAwardBonus
)
 values 
(
'468',
'2012-12-18T10:15:12',
'2014-02-06T11:18:45.87',
'Всеукраїнські конкурси — захисти науково-дослідницьких робіт учнів - членів Малої академії наук України',
'Трудове навчання. Диплом III ступеня',
'4',
'10',
'30.0'
);
insert into OlympiadsAwards (
Id_OlympiadAward,
DateLastChangeOlimpiad,
DateLastChangeOlympiadAward,
OlimpiadName,
OlympiadAwardName,
Id_PersonRequestSeasons,
Id_Olimpiad,
OlympiadAwardBonus
)
 values 
(
'469',
'2012-12-18T10:15:12',
'2014-02-06T11:18:45.87',
'Всеукраїнські конкурси — захисти науково-дослідницьких робіт учнів - членів Малої академії наук України',
'Педагогіка та психологія. Диплом I ступеня',
'4',
'10',
'50.0'
);
insert into OlympiadsAwards (
Id_OlympiadAward,
DateLastChangeOlimpiad,
DateLastChangeOlympiadAward,
OlimpiadName,
OlympiadAwardName,
Id_PersonRequestSeasons,
Id_Olimpiad,
OlympiadAwardBonus
)
 values 
(
'470',
'2012-12-18T10:15:12',
'2014-02-06T11:18:45.87',
'Всеукраїнські конкурси — захисти науково-дослідницьких робіт учнів - членів Малої академії наук України',
'Педагогіка та психологія. Диплом II ступеня',
'4',
'10',
'40.0'
);
insert into OlympiadsAwards (
Id_OlympiadAward,
DateLastChangeOlimpiad,
DateLastChangeOlympiadAward,
OlimpiadName,
OlympiadAwardName,
Id_PersonRequestSeasons,
Id_Olimpiad,
OlympiadAwardBonus
)
 values 
(
'471',
'2012-12-18T10:15:12',
'2014-02-06T11:18:45.87',
'Всеукраїнські конкурси — захисти науково-дослідницьких робіт учнів - членів Малої академії наук України',
'Педагогіка та психологія. Диплом III ступеня',
'4',
'10',
'30.0'
);
insert into OlympiadsAwards (
Id_OlympiadAward,
DateLastChangeOlimpiad,
DateLastChangeOlympiadAward,
OlimpiadName,
OlympiadAwardName,
Id_PersonRequestSeasons,
Id_Olimpiad,
OlympiadAwardBonus
)
 values 
(
'472',
'2012-12-18T10:15:12',
'2014-02-06T11:18:45.87',
'Всеукраїнські конкурси — захисти науково-дослідницьких робіт учнів - членів Малої академії наук України',
'Світова література. Диплом I ступеня',
'4',
'10',
'50.0'
);
insert into OlympiadsAwards (
Id_OlympiadAward,
DateLastChangeOlimpiad,
DateLastChangeOlympiadAward,
OlimpiadName,
OlympiadAwardName,
Id_PersonRequestSeasons,
Id_Olimpiad,
OlympiadAwardBonus
)
 values 
(
'473',
'2012-12-18T10:15:12',
'2014-02-06T11:18:45.87',
'Всеукраїнські конкурси — захисти науково-дослідницьких робіт учнів - членів Малої академії наук України',
'Світова література. Диплом II ступеня',
'4',
'10',
'40.0'
);
insert into OlympiadsAwards (
Id_OlympiadAward,
DateLastChangeOlimpiad,
DateLastChangeOlympiadAward,
OlimpiadName,
OlympiadAwardName,
Id_PersonRequestSeasons,
Id_Olimpiad,
OlympiadAwardBonus
)
 values 
(
'474',
'2012-12-18T10:15:12',
'2014-02-06T11:18:45.87',
'Всеукраїнські конкурси — захисти науково-дослідницьких робіт учнів - членів Малої академії наук України',
'Світова література. Диплом III ступеня',
'4',
'10',
'30.0'
);
insert into OlympiadsAwards (
Id_OlympiadAward,
DateLastChangeOlimpiad,
DateLastChangeOlympiadAward,
OlimpiadName,
OlympiadAwardName,
Id_PersonRequestSeasons,
Id_Olimpiad,
OlympiadAwardBonus
)
 values 
(
'475',
'2012-12-18T10:15:12',
'2014-02-06T11:18:45.87',
'Всеукраїнські конкурси — захисти науково-дослідницьких робіт учнів - членів Малої академії наук України',
'Китайська мова. Диплом I ступеня',
'4',
'10',
'50.0'
);
insert into OlympiadsAwards (
Id_OlympiadAward,
DateLastChangeOlimpiad,
DateLastChangeOlympiadAward,
OlimpiadName,
OlympiadAwardName,
Id_PersonRequestSeasons,
Id_Olimpiad,
OlympiadAwardBonus
)
 values 
(
'476',
'2012-12-18T10:15:12',
'2014-02-06T11:18:45.87',
'Всеукраїнські конкурси — захисти науково-дослідницьких робіт учнів - членів Малої академії наук України',
'Китайська мова. Диплом II ступеня',
'4',
'10',
'40.0'
);
insert into OlympiadsAwards (
Id_OlympiadAward,
DateLastChangeOlimpiad,
DateLastChangeOlympiadAward,
OlimpiadName,
OlympiadAwardName,
Id_PersonRequestSeasons,
Id_Olimpiad,
OlympiadAwardBonus
)
 values 
(
'477',
'2012-12-18T10:15:12',
'2014-02-06T11:18:45.87',
'Всеукраїнські конкурси — захисти науково-дослідницьких робіт учнів - членів Малої академії наук України',
'Китайська мова. Диплом III ступеня',
'4',
'10',
'30.0'
);
insert into OlympiadsAwards (
Id_OlympiadAward,
DateLastChangeOlimpiad,
DateLastChangeOlympiadAward,
OlimpiadName,
OlympiadAwardName,
Id_PersonRequestSeasons,
Id_Olimpiad,
OlympiadAwardBonus
)
 values 
(
'478',
'2012-12-18T10:15:12',
'2014-07-05T07:51:52',
'Всеукраїнські конкурси — захисти науково-дослідницьких робіт учнів - членів Малої академії наук України',
'Фізична культура і спорт Чемпіон України',
'4',
'10',
'50.0'
);
insert into OlympiadsAwards (
Id_OlympiadAward,
DateLastChangeOlimpiad,
DateLastChangeOlympiadAward,
OlimpiadName,
OlympiadAwardName,
Id_PersonRequestSeasons,
Id_Olimpiad,
OlympiadAwardBonus
)
 values 
(
'479',
'2012-12-18T10:15:12',
'2014-07-05T07:51:52',
'Всеукраїнські конкурси — захисти науково-дослідницьких робіт учнів - членів Малої академії наук України',
'Фізична культура і спорт ІІ місце на чемпіонаті України',
'4',
'10',
'40.0'
);
insert into OlympiadsAwards (
Id_OlympiadAward,
DateLastChangeOlimpiad,
DateLastChangeOlympiadAward,
OlimpiadName,
OlympiadAwardName,
Id_PersonRequestSeasons,
Id_Olimpiad,
OlympiadAwardBonus
)
 values 
(
'480',
'2012-12-18T10:15:12',
'2014-07-05T07:51:52',
'Всеукраїнські конкурси — захисти науково-дослідницьких робіт учнів - членів Малої академії наук України',
'Фізична культура і спорт ІІІ місце на чемпіонаті України',
'4',
'10',
'30.0'
);
