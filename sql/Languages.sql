drop table if exists Languages ;
create table Languages(
  id int primary key auto_increment,
  Id_Language int comment 'Идентификатор языка.',
  Code varchar(255) comment 'Код языка.',
  LanguageName varchar(255) comment 'Название языка.'
);
insert into Languages (
LanguageName,
Id_Language,
Code
)
 values 
(
'Українська',
'1',
'UK'
);
