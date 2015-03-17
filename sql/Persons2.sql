drop table if exists Persons2 ;
create table Persons2(
  id int primary key auto_increment,
  Id_Person int comment 'Идентификатор персоны.',
  Resident int comment 'Признак резидентности. 1- резидент, 0 –не резидент.',
  PersonCodeU varchar(255) comment 'GUID код персоны.',
  Birthday dateTime comment 'Дата рождения',
  Id_PersonSex int comment 'Идентификатор пола персоны',
  Id_PersonName int comment 'Идентификатор имен персоны',
  LastName varchar(255) comment 'Фамилия персоны',
  FirstName varchar(255) comment 'Имя персоны',
  MiddleName varchar(255) comment 'Отчество персоны',
  Father varchar(255) comment 'Отец',
  Mother varchar(255) comment 'Мать',
  FatherPhones varchar(255) comment 'Телефоны отца',
  MotherPhones varchar(255) comment 'Телефоны матери',
  Birthplace varchar(255) comment 'Место рождения',
  LanguagesAreStudied varchar(255) comment 'Какие иностранные языки узачались',
  LastNameEn varchar(255) comment 'Фамилия на английском (добавлено в версии 2)',
  FirstNameEn varchar(255) comment 'Имя на английском (добавлено в версии 2)',
  MiddleNameEn varchar(255) comment 'Отчество на английском (добавлено в версии 2)',
  FIOEn varchar(255) comment 'ФИО на английском (добавлено в версии 2)'
);
insert into Persons2 (
LastErrorDescription,
LastErrorCode
)
 values 
(
'Incorrect syntax near `)`.',
'199'
);
