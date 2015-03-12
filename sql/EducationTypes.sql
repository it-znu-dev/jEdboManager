drop table if exists EducationTypes ;
create table EducationTypes(
  id int primary key auto_increment,
  Id_EducationType int comment 'Идентификатор типа учебного заведения.',
  Id_EducationClass int comment 'Идентификатор класса учебного заведения.',
  Id_EducationTypeName int comment 'Идентификатор имени типа учебного заведения.',
  EducationOrganizationFullTypeName varchar(255) comment 'Полное имя типа учебного заведения.',
  EducationOrganizationShortTypeName varchar(255) comment 'Короткое имя типа учебного заведения.',
  Id_EducationClassName int comment 'Идентификатор имени класса учебного заведения.',
  EducationOrganizationClassName varchar(255) comment 'Имя класса учебного заведения.',
  Id_Language int comment 'Идентификатор языка для названия типов и классов'
);
insert into EducationTypes (
Id_EducationClass,
EducationOrganizationClassName,
Id_EducationTypeName,
Id_Language,
Id_EducationType,
Id_EducationClassName,
EducationOrganizationFullTypeName,
EducationOrganizationShortTypeName
)
 values 
(
'0',
'Відділи та управління освіти',
'46',
'1',
'0',
'3',
'Не вказано',
'Не вказано'
);
insert into EducationTypes (
Id_EducationClass,
EducationOrganizationClassName,
Id_EducationTypeName,
Id_Language,
Id_EducationType,
Id_EducationClassName,
EducationOrganizationFullTypeName,
EducationOrganizationShortTypeName
)
 values 
(
'0',
'Відділи та управління освіти',
'47',
'1',
'1',
'3',
'Університет',
''
);
insert into EducationTypes (
Id_EducationClass,
EducationOrganizationClassName,
Id_EducationTypeName,
Id_Language,
Id_EducationType,
Id_EducationClassName,
EducationOrganizationFullTypeName,
EducationOrganizationShortTypeName
)
 values 
(
'0',
'Відділи та управління освіти',
'48',
'1',
'2',
'3',
'Академія',
''
);
insert into EducationTypes (
Id_EducationClass,
EducationOrganizationClassName,
Id_EducationTypeName,
Id_Language,
Id_EducationType,
Id_EducationClassName,
EducationOrganizationFullTypeName,
EducationOrganizationShortTypeName
)
 values 
(
'0',
'Відділи та управління освіти',
'49',
'1',
'3',
'3',
'Інститут',
''
);
insert into EducationTypes (
Id_EducationClass,
EducationOrganizationClassName,
Id_EducationTypeName,
Id_Language,
Id_EducationType,
Id_EducationClassName,
EducationOrganizationFullTypeName,
EducationOrganizationShortTypeName
)
 values 
(
'0',
'Відділи та управління освіти',
'50',
'1',
'4',
'3',
'Консерваторія (музична академія)',
''
);
insert into EducationTypes (
Id_EducationClass,
EducationOrganizationClassName,
Id_EducationTypeName,
Id_Language,
Id_EducationType,
Id_EducationClassName,
EducationOrganizationFullTypeName,
EducationOrganizationShortTypeName
)
 values 
(
'0',
'Відділи та управління освіти',
'51',
'1',
'5',
'3',
'Коледж',
''
);
insert into EducationTypes (
Id_EducationClass,
EducationOrganizationClassName,
Id_EducationTypeName,
Id_Language,
Id_EducationType,
Id_EducationClassName,
EducationOrganizationFullTypeName,
EducationOrganizationShortTypeName
)
 values 
(
'0',
'Відділи та управління освіти',
'52',
'1',
'6',
'3',
'Технікум (училище)',
''
);
insert into EducationTypes (
Id_EducationClass,
EducationOrganizationClassName,
Id_EducationTypeName,
Id_Language,
Id_EducationType,
Id_EducationClassName,
EducationOrganizationFullTypeName,
EducationOrganizationShortTypeName
)
 values 
(
'0',
'Відділи та управління освіти',
'53',
'1',
'7',
'3',
'Відокремлений підрозділ',
''
);
insert into EducationTypes (
Id_EducationClass,
EducationOrganizationClassName,
Id_EducationTypeName,
Id_Language,
Id_EducationType,
Id_EducationClassName,
EducationOrganizationFullTypeName,
EducationOrganizationShortTypeName
)
 values 
(
'2',
'Професійно-технічні навчальні заклади',
'54',
'1',
'200',
'5',
'професійно-технічне училище',
''
);
insert into EducationTypes (
Id_EducationClass,
EducationOrganizationClassName,
Id_EducationTypeName,
Id_Language,
Id_EducationType,
Id_EducationClassName,
EducationOrganizationFullTypeName,
EducationOrganizationShortTypeName
)
 values 
(
'2',
'Професійно-технічні навчальні заклади',
'55',
'1',
'201',
'5',
'професійне училище соціальної реабілітації',
''
);
insert into EducationTypes (
Id_EducationClass,
EducationOrganizationClassName,
Id_EducationTypeName,
Id_Language,
Id_EducationType,
Id_EducationClassName,
EducationOrganizationFullTypeName,
EducationOrganizationShortTypeName
)
 values 
(
'2',
'Професійно-технічні навчальні заклади',
'56',
'1',
'202',
'5',
'вище професійне училище',
''
);
insert into EducationTypes (
Id_EducationClass,
EducationOrganizationClassName,
Id_EducationTypeName,
Id_Language,
Id_EducationType,
Id_EducationClassName,
EducationOrganizationFullTypeName,
EducationOrganizationShortTypeName
)
 values 
(
'2',
'Професійно-технічні навчальні заклади',
'57',
'1',
'203',
'5',
'професійний ліцей',
''
);
insert into EducationTypes (
Id_EducationClass,
EducationOrganizationClassName,
Id_EducationTypeName,
Id_Language,
Id_EducationType,
Id_EducationClassName,
EducationOrganizationFullTypeName,
EducationOrganizationShortTypeName
)
 values 
(
'2',
'Професійно-технічні навчальні заклади',
'58',
'1',
'204',
'5',
'професійний ліцей відповідного профілю',
''
);
insert into EducationTypes (
Id_EducationClass,
EducationOrganizationClassName,
Id_EducationTypeName,
Id_Language,
Id_EducationType,
Id_EducationClassName,
EducationOrganizationFullTypeName,
EducationOrganizationShortTypeName
)
 values 
(
'2',
'Професійно-технічні навчальні заклади',
'59',
'1',
'205',
'5',
'професійно-художнє училище',
''
);
insert into EducationTypes (
Id_EducationClass,
EducationOrganizationClassName,
Id_EducationTypeName,
Id_Language,
Id_EducationType,
Id_EducationClassName,
EducationOrganizationFullTypeName,
EducationOrganizationShortTypeName
)
 values 
(
'2',
'Професійно-технічні навчальні заклади',
'60',
'1',
'206',
'5',
'художнє професійно-технічне училище',
''
);
insert into EducationTypes (
Id_EducationClass,
EducationOrganizationClassName,
Id_EducationTypeName,
Id_Language,
Id_EducationType,
Id_EducationClassName,
EducationOrganizationFullTypeName,
EducationOrganizationShortTypeName
)
 values 
(
'2',
'Професійно-технічні навчальні заклади',
'61',
'1',
'207',
'5',
'вище художнє професійно-технічне училище',
''
);
insert into EducationTypes (
Id_EducationClass,
EducationOrganizationClassName,
Id_EducationTypeName,
Id_Language,
Id_EducationType,
Id_EducationClassName,
EducationOrganizationFullTypeName,
EducationOrganizationShortTypeName
)
 values 
(
'2',
'Професійно-технічні навчальні заклади',
'62',
'1',
'208',
'5',
'училище-агрофірма',
''
);
insert into EducationTypes (
Id_EducationClass,
EducationOrganizationClassName,
Id_EducationTypeName,
Id_Language,
Id_EducationType,
Id_EducationClassName,
EducationOrganizationFullTypeName,
EducationOrganizationShortTypeName
)
 values 
(
'2',
'Професійно-технічні навчальні заклади',
'63',
'1',
'209',
'5',
'вище училище-агрофірма',
''
);
insert into EducationTypes (
Id_EducationClass,
EducationOrganizationClassName,
Id_EducationTypeName,
Id_Language,
Id_EducationType,
Id_EducationClassName,
EducationOrganizationFullTypeName,
EducationOrganizationShortTypeName
)
 values 
(
'2',
'Професійно-технічні навчальні заклади',
'64',
'1',
'210',
'5',
'училище-завод',
''
);
insert into EducationTypes (
Id_EducationClass,
EducationOrganizationClassName,
Id_EducationTypeName,
Id_Language,
Id_EducationType,
Id_EducationClassName,
EducationOrganizationFullTypeName,
EducationOrganizationShortTypeName
)
 values 
(
'2',
'Професійно-технічні навчальні заклади',
'65',
'1',
'211',
'5',
'центр професійно-технічної освіти',
''
);
insert into EducationTypes (
Id_EducationClass,
EducationOrganizationClassName,
Id_EducationTypeName,
Id_Language,
Id_EducationType,
Id_EducationClassName,
EducationOrganizationFullTypeName,
EducationOrganizationShortTypeName
)
 values 
(
'2',
'Професійно-технічні навчальні заклади',
'66',
'1',
'212',
'5',
'центр професійної освіти',
''
);
insert into EducationTypes (
Id_EducationClass,
EducationOrganizationClassName,
Id_EducationTypeName,
Id_Language,
Id_EducationType,
Id_EducationClassName,
EducationOrganizationFullTypeName,
EducationOrganizationShortTypeName
)
 values 
(
'2',
'Професійно-технічні навчальні заклади',
'67',
'1',
'213',
'5',
'навчально-виробничий центр',
''
);
insert into EducationTypes (
Id_EducationClass,
EducationOrganizationClassName,
Id_EducationTypeName,
Id_Language,
Id_EducationType,
Id_EducationClassName,
EducationOrganizationFullTypeName,
EducationOrganizationShortTypeName
)
 values 
(
'2',
'Професійно-технічні навчальні заклади',
'68',
'1',
'214',
'5',
'центр підготовки і перепідготовки робітничих кадрів',
''
);
insert into EducationTypes (
Id_EducationClass,
EducationOrganizationClassName,
Id_EducationTypeName,
Id_Language,
Id_EducationType,
Id_EducationClassName,
EducationOrganizationFullTypeName,
EducationOrganizationShortTypeName
)
 values 
(
'2',
'Професійно-технічні навчальні заклади',
'69',
'1',
'215',
'5',
'навчально-курсовий комбінат',
''
);
insert into EducationTypes (
Id_EducationClass,
EducationOrganizationClassName,
Id_EducationTypeName,
Id_Language,
Id_EducationType,
Id_EducationClassName,
EducationOrganizationFullTypeName,
EducationOrganizationShortTypeName
)
 values 
(
'2',
'Професійно-технічні навчальні заклади',
'70',
'1',
'216',
'5',
'навчальний центр',
''
);
insert into EducationTypes (
Id_EducationClass,
EducationOrganizationClassName,
Id_EducationTypeName,
Id_Language,
Id_EducationType,
Id_EducationClassName,
EducationOrganizationFullTypeName,
EducationOrganizationShortTypeName
)
 values 
(
'2',
'Професійно-технічні навчальні заклади',
'71',
'1',
'217',
'5',
'інші типи навчальних закладів, що надають професійно-технічну освіту або здійснюють професійно-технічне навчання',
''
);
insert into EducationTypes (
Id_EducationClass,
EducationOrganizationClassName,
Id_EducationTypeName,
Id_Language,
Id_EducationType,
Id_EducationClassName,
EducationOrganizationFullTypeName,
EducationOrganizationShortTypeName
)
 values 
(
'0',
'Відділи та управління освіти',
'72',
'1',
'300',
'3',
'школа',
''
);
insert into EducationTypes (
Id_EducationClass,
EducationOrganizationClassName,
Id_EducationTypeName,
Id_Language,
Id_EducationType,
Id_EducationClassName,
EducationOrganizationFullTypeName,
EducationOrganizationShortTypeName
)
 values 
(
'0',
'Відділи та управління освіти',
'73',
'1',
'301',
'3',
'спеціалізована школа (школа-інтернат)',
''
);
insert into EducationTypes (
Id_EducationClass,
EducationOrganizationClassName,
Id_EducationTypeName,
Id_Language,
Id_EducationType,
Id_EducationClassName,
EducationOrganizationFullTypeName,
EducationOrganizationShortTypeName
)
 values 
(
'0',
'Відділи та управління освіти',
'74',
'1',
'302',
'3',
'гімназія (гімназія-інтернат)',
''
);
insert into EducationTypes (
Id_EducationClass,
EducationOrganizationClassName,
Id_EducationTypeName,
Id_Language,
Id_EducationType,
Id_EducationClassName,
EducationOrganizationFullTypeName,
EducationOrganizationShortTypeName
)
 values 
(
'0',
'Відділи та управління освіти',
'75',
'1',
'303',
'3',
'колегіум (колегіум-інтернат)',
''
);
insert into EducationTypes (
Id_EducationClass,
EducationOrganizationClassName,
Id_EducationTypeName,
Id_Language,
Id_EducationType,
Id_EducationClassName,
EducationOrganizationFullTypeName,
EducationOrganizationShortTypeName
)
 values 
(
'0',
'Відділи та управління освіти',
'76',
'1',
'304',
'3',
'ліцей (ліцей-інтернат)',
''
);
insert into EducationTypes (
Id_EducationClass,
EducationOrganizationClassName,
Id_EducationTypeName,
Id_Language,
Id_EducationType,
Id_EducationClassName,
EducationOrganizationFullTypeName,
EducationOrganizationShortTypeName
)
 values 
(
'0',
'Відділи та управління освіти',
'77',
'1',
'305',
'3',
'школа-інтернат',
''
);
insert into EducationTypes (
Id_EducationClass,
EducationOrganizationClassName,
Id_EducationTypeName,
Id_Language,
Id_EducationType,
Id_EducationClassName,
EducationOrganizationFullTypeName,
EducationOrganizationShortTypeName
)
 values 
(
'0',
'Відділи та управління освіти',
'78',
'1',
'306',
'3',
'спеціальна школа (школа-інтернат)',
''
);
insert into EducationTypes (
Id_EducationClass,
EducationOrganizationClassName,
Id_EducationTypeName,
Id_Language,
Id_EducationType,
Id_EducationClassName,
EducationOrganizationFullTypeName,
EducationOrganizationShortTypeName
)
 values 
(
'0',
'Відділи та управління освіти',
'79',
'1',
'307',
'3',
'санаторна школа (школа-інтернат)',
''
);
insert into EducationTypes (
Id_EducationClass,
EducationOrganizationClassName,
Id_EducationTypeName,
Id_Language,
Id_EducationType,
Id_EducationClassName,
EducationOrganizationFullTypeName,
EducationOrganizationShortTypeName
)
 values 
(
'0',
'Відділи та управління освіти',
'80',
'1',
'308',
'3',
'школа соціальної реабілітації (можливо без ступеню)',
''
);
insert into EducationTypes (
Id_EducationClass,
EducationOrganizationClassName,
Id_EducationTypeName,
Id_Language,
Id_EducationType,
Id_EducationClassName,
EducationOrganizationFullTypeName,
EducationOrganizationShortTypeName
)
 values 
(
'0',
'Відділи та управління освіти',
'81',
'1',
'309',
'3',
'вечірня (змінна) школа',
''
);
insert into EducationTypes (
Id_EducationClass,
EducationOrganizationClassName,
Id_EducationTypeName,
Id_Language,
Id_EducationType,
Id_EducationClassName,
EducationOrganizationFullTypeName,
EducationOrganizationShortTypeName
)
 values 
(
'0',
'Відділи та управління освіти',
'82',
'1',
'310',
'3',
'навчально-реабілітаційний центр (можливо без ступеню)',
''
);
insert into EducationTypes (
Id_EducationClass,
EducationOrganizationClassName,
Id_EducationTypeName,
Id_Language,
Id_EducationType,
Id_EducationClassName,
EducationOrganizationFullTypeName,
EducationOrganizationShortTypeName
)
 values 
(
'0',
'Відділи та управління освіти',
'83',
'1',
'400',
'3',
'громадська організація',
''
);
insert into EducationTypes (
Id_EducationClass,
EducationOrganizationClassName,
Id_EducationTypeName,
Id_Language,
Id_EducationType,
Id_EducationClassName,
EducationOrganizationFullTypeName,
EducationOrganizationShortTypeName
)
 values 
(
'0',
'Відділи та управління освіти',
'84',
'1',
'401',
'3',
'державна організація (установа, заклад)',
''
);
insert into EducationTypes (
Id_EducationClass,
EducationOrganizationClassName,
Id_EducationTypeName,
Id_Language,
Id_EducationType,
Id_EducationClassName,
EducationOrganizationFullTypeName,
EducationOrganizationShortTypeName
)
 values 
(
'0',
'Відділи та управління освіти',
'85',
'1',
'402',
'3',
'державне підприємство',
''
);
insert into EducationTypes (
Id_EducationClass,
EducationOrganizationClassName,
Id_EducationTypeName,
Id_Language,
Id_EducationType,
Id_EducationClassName,
EducationOrganizationFullTypeName,
EducationOrganizationShortTypeName
)
 values 
(
'0',
'Відділи та управління освіти',
'86',
'1',
'403',
'3',
'комунальна організація (установа, заклад)',
''
);
insert into EducationTypes (
Id_EducationClass,
EducationOrganizationClassName,
Id_EducationTypeName,
Id_Language,
Id_EducationType,
Id_EducationClassName,
EducationOrganizationFullTypeName,
EducationOrganizationShortTypeName
)
 values 
(
'0',
'Відділи та управління освіти',
'87',
'1',
'404',
'3',
'комунальне підприємство',
''
);
insert into EducationTypes (
Id_EducationClass,
EducationOrganizationClassName,
Id_EducationTypeName,
Id_Language,
Id_EducationType,
Id_EducationClassName,
EducationOrganizationFullTypeName,
EducationOrganizationShortTypeName
)
 values 
(
'0',
'Відділи та управління освіти',
'88',
'1',
'405',
'3',
'приватна організація (установа, заклад)',
''
);
insert into EducationTypes (
Id_EducationClass,
EducationOrganizationClassName,
Id_EducationTypeName,
Id_Language,
Id_EducationType,
Id_EducationClassName,
EducationOrganizationFullTypeName,
EducationOrganizationShortTypeName
)
 values 
(
'0',
'Відділи та управління освіти',
'89',
'1',
'406',
'3',
'приватне підприємство',
''
);
insert into EducationTypes (
Id_EducationClass,
EducationOrganizationClassName,
Id_EducationTypeName,
Id_Language,
Id_EducationType,
Id_EducationClassName,
EducationOrganizationFullTypeName,
EducationOrganizationShortTypeName
)
 values 
(
'0',
'Відділи та управління освіти',
'90',
'1',
'407',
'3',
'релігійна організація',
''
);
insert into EducationTypes (
Id_EducationClass,
EducationOrganizationClassName,
Id_EducationTypeName,
Id_Language,
Id_EducationType,
Id_EducationClassName,
EducationOrganizationFullTypeName,
EducationOrganizationShortTypeName
)
 values 
(
'0',
'Відділи та управління освіти',
'91',
'1',
'500',
'3',
'обласний орган управління освітою',
''
);
insert into EducationTypes (
Id_EducationClass,
EducationOrganizationClassName,
Id_EducationTypeName,
Id_Language,
Id_EducationType,
Id_EducationClassName,
EducationOrganizationFullTypeName,
EducationOrganizationShortTypeName
)
 values 
(
'0',
'Відділи та управління освіти',
'92',
'1',
'501',
'3',
'районний орган управління освітою',
''
);
insert into EducationTypes (
Id_EducationClass,
EducationOrganizationClassName,
Id_EducationTypeName,
Id_Language,
Id_EducationType,
Id_EducationClassName,
EducationOrganizationFullTypeName,
EducationOrganizationShortTypeName
)
 values 
(
'0',
'Відділи та управління освіти',
'93',
'1',
'502',
'3',
'місцевий орган управління освітою',
''
);
insert into EducationTypes (
Id_EducationClass,
EducationOrganizationClassName,
Id_EducationTypeName,
Id_Language,
Id_EducationType,
Id_EducationClassName,
EducationOrganizationFullTypeName,
EducationOrganizationShortTypeName
)
 values 
(
'0',
'Відділи та управління освіти',
'94',
'1',
'600',
'3',
'центральний орган виконавчої влади, що реалізує державну політику у сфері освіти ',
''
);
insert into EducationTypes (
Id_EducationClass,
EducationOrganizationClassName,
Id_EducationTypeName,
Id_Language,
Id_EducationType,
Id_EducationClassName,
EducationOrganizationFullTypeName,
EducationOrganizationShortTypeName
)
 values 
(
'0',
'Відділи та управління освіти',
'95',
'1',
'601',
'3',
'центральний орган виконавчої влади, якому підпорядковані навчальні заклади ',
''
);
insert into EducationTypes (
Id_EducationClass,
EducationOrganizationClassName,
Id_EducationTypeName,
Id_Language,
Id_EducationType,
Id_EducationClassName,
EducationOrganizationFullTypeName,
EducationOrganizationShortTypeName
)
 values 
(
'0',
'Відділи та управління освіти',
'96',
'1',
'602',
'3',
'орган виконавчої влади Автономної Республіки Крим у сфері освіти',
''
);
