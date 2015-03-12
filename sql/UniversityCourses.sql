drop table if exists UniversityCourses ;
create table UniversityCourses(
  id int primary key auto_increment,
  Id_UniversityCourse int comment 'Идентификатор курсов',
  UniversityKode varchar(255) comment 'GUID идентификатор ВУЗа',
  UniversityCourseCode varchar(255) comment 'GUID идентификатор курса ВУЗа.',
  UniversityCourseDateBegin dateTime comment 'Дата начала действия записи',
  UniversityCourseDateEnd dateTime comment 'Дата окончания действия записи',
  DateLastChange dateTime comment 'Дата последнего изменения записи',
  Id_UniversityCourseName int comment 'Идентификатор названия курсов',
  Id_Language int comment 'Идентификатор языка названий',
  UniversityCourseName varchar(255) comment 'Название курсов',
  Id_PersonRequestSeasons int comment 'Глобальный идентификатор вступительной компании',
  NamePersonRequestSeasons varchar(255) comment 'Название вступительной компании'
);
insert into UniversityCourses (
Id_PersonRequestSeasons,
Id_UniversityCourse,
Id_Language,
UniversityCourseCode,
NamePersonRequestSeasons,
UniversityKode,
Id_UniversityCourseName,
UniversityCourseDateBegin,
UniversityCourseName,
DateLastChange,
UniversityCourseDateEnd
)
 values 
(
'4',
'1718',
'1',
'b9d2e734-8cf4-498c-955f-4bd3a0c1e928',
'Вступна кампанія 2014 року',
'ab1bc732-51f3-475c-bcfe-368363369020',
'1718',
'2001-01-01T00:00:00',
'Підготовче відділння',
'2014-07-07T08:54:26.423',
'2099-12-31T23:59:59'
);
insert into UniversityCourses (
Id_PersonRequestSeasons,
Id_UniversityCourse,
Id_Language,
UniversityCourseCode,
NamePersonRequestSeasons,
UniversityKode,
Id_UniversityCourseName,
UniversityCourseDateBegin,
UniversityCourseName,
DateLastChange,
UniversityCourseDateEnd
)
 values 
(
'4',
'1812',
'1',
'aa26cae6-e2fe-4d4c-97cc-a937e06fbb7c',
'Вступна кампанія 2014 року',
'ab1bc732-51f3-475c-bcfe-368363369020',
'1812',
'2001-01-01T00:00:00',
'соціальна педагогіка',
'2014-07-10T16:35:43.863',
'2099-12-31T23:59:59'
);
insert into UniversityCourses (
Id_PersonRequestSeasons,
Id_UniversityCourse,
Id_Language,
UniversityCourseCode,
NamePersonRequestSeasons,
UniversityKode,
Id_UniversityCourseName,
UniversityCourseDateBegin,
UniversityCourseName,
DateLastChange,
UniversityCourseDateEnd
)
 values 
(
'4',
'1813',
'1',
'217970e3-54c4-4355-9a5b-565fc4ecf3f3',
'Вступна кампанія 2014 року',
'ab1bc732-51f3-475c-bcfe-368363369020',
'1813',
'2001-01-01T00:00:00',
'фізичне виховання',
'2014-07-10T16:36:46.897',
'2099-12-31T23:59:59'
);
insert into UniversityCourses (
Id_PersonRequestSeasons,
Id_UniversityCourse,
Id_Language,
UniversityCourseCode,
NamePersonRequestSeasons,
UniversityKode,
Id_UniversityCourseName,
UniversityCourseDateBegin,
UniversityCourseName,
DateLastChange,
UniversityCourseDateEnd
)
 values 
(
'4',
'1814',
'1',
'4566c3dc-3ce8-4c8d-87c1-73ca87b7cb46',
'Вступна кампанія 2014 року',
'ab1bc732-51f3-475c-bcfe-368363369020',
'1814',
'2001-01-01T00:00:00',
'спорт',
'2014-07-10T16:36:54.937',
'2099-12-31T23:59:59'
);
insert into UniversityCourses (
Id_PersonRequestSeasons,
Id_UniversityCourse,
Id_Language,
UniversityCourseCode,
NamePersonRequestSeasons,
UniversityKode,
Id_UniversityCourseName,
UniversityCourseDateBegin,
UniversityCourseName,
DateLastChange,
UniversityCourseDateEnd
)
 values 
(
'4',
'1815',
'1',
'8b210393-ccff-422a-ab5a-48a76ecf43bf',
'Вступна кампанія 2014 року',
'ab1bc732-51f3-475c-bcfe-368363369020',
'1815',
'2001-01-01T00:00:00',
'здоров`я людини',
'2014-07-10T16:37:11.3',
'2099-12-31T23:59:59'
);
insert into UniversityCourses (
Id_PersonRequestSeasons,
Id_UniversityCourse,
Id_Language,
UniversityCourseCode,
NamePersonRequestSeasons,
UniversityKode,
Id_UniversityCourseName,
UniversityCourseDateBegin,
UniversityCourseName,
DateLastChange,
UniversityCourseDateEnd
)
 values 
(
'4',
'1816',
'1',
'812c1cca-9d7c-433c-8540-a3eed22ea438',
'Вступна кампанія 2014 року',
'ab1bc732-51f3-475c-bcfe-368363369020',
'1816',
'2001-01-01T00:00:00',
'театральне мистецтво',
'2014-07-10T16:37:30.473',
'2099-12-31T23:59:59'
);
insert into UniversityCourses (
Id_PersonRequestSeasons,
Id_UniversityCourse,
Id_Language,
UniversityCourseCode,
NamePersonRequestSeasons,
UniversityKode,
Id_UniversityCourseName,
UniversityCourseDateBegin,
UniversityCourseName,
DateLastChange,
UniversityCourseDateEnd
)
 values 
(
'4',
'1817',
'1',
'453a977a-0158-4e6c-9837-6fde184baa9e',
'Вступна кампанія 2014 року',
'ab1bc732-51f3-475c-bcfe-368363369020',
'1817',
'2001-01-01T00:00:00',
'філософія',
'2014-07-10T16:37:40.057',
'2099-12-31T23:59:59'
);
insert into UniversityCourses (
Id_PersonRequestSeasons,
Id_UniversityCourse,
Id_Language,
UniversityCourseCode,
NamePersonRequestSeasons,
UniversityKode,
Id_UniversityCourseName,
UniversityCourseDateBegin,
UniversityCourseName,
DateLastChange,
UniversityCourseDateEnd
)
 values 
(
'4',
'1818',
'1',
'1dde9752-2d1f-44ff-a57b-b19d5933574f',
'Вступна кампанія 2014 року',
'ab1bc732-51f3-475c-bcfe-368363369020',
'1818',
'2001-01-01T00:00:00',
'історія',
'2014-07-10T16:37:50.1',
'2099-12-31T23:59:59'
);
insert into UniversityCourses (
Id_PersonRequestSeasons,
Id_UniversityCourse,
Id_Language,
UniversityCourseCode,
NamePersonRequestSeasons,
UniversityKode,
Id_UniversityCourseName,
UniversityCourseDateBegin,
UniversityCourseName,
DateLastChange,
UniversityCourseDateEnd
)
 values 
(
'4',
'1819',
'1',
'12720465-22c0-4d85-ad5a-3c2b6d3693ba',
'Вступна кампанія 2014 року',
'ab1bc732-51f3-475c-bcfe-368363369020',
'1819',
'2001-01-01T00:00:00',
'українська мова і література',
'2014-07-10T16:38:08.643',
'2099-12-31T23:59:59'
);
insert into UniversityCourses (
Id_PersonRequestSeasons,
Id_UniversityCourse,
Id_Language,
UniversityCourseCode,
NamePersonRequestSeasons,
UniversityKode,
Id_UniversityCourseName,
UniversityCourseDateBegin,
UniversityCourseName,
DateLastChange,
UniversityCourseDateEnd
)
 values 
(
'4',
'1820',
'1',
'abb00cce-90c7-4fcf-b1e3-a497bf04a78b',
'Вступна кампанія 2014 року',
'ab1bc732-51f3-475c-bcfe-368363369020',
'1820',
'2001-01-01T00:00:00',
'мова і література (російська)',
'2014-07-10T16:38:37.023',
'2099-12-31T23:59:59'
);
insert into UniversityCourses (
Id_PersonRequestSeasons,
Id_UniversityCourse,
Id_Language,
UniversityCourseCode,
NamePersonRequestSeasons,
UniversityKode,
Id_UniversityCourseName,
UniversityCourseDateBegin,
UniversityCourseName,
DateLastChange,
UniversityCourseDateEnd
)
 values 
(
'4',
'1821',
'1',
'6c9f9cb2-a173-404b-86ff-b272164e8c95',
'Вступна кампанія 2014 року',
'ab1bc732-51f3-475c-bcfe-368363369020',
'1821',
'2001-01-01T00:00:00',
'мова і література (англійська)',
'2014-07-10T16:38:58.08',
'2099-12-31T23:59:59'
);
insert into UniversityCourses (
Id_PersonRequestSeasons,
Id_UniversityCourse,
Id_Language,
UniversityCourseCode,
NamePersonRequestSeasons,
UniversityKode,
Id_UniversityCourseName,
UniversityCourseDateBegin,
UniversityCourseName,
DateLastChange,
UniversityCourseDateEnd
)
 values 
(
'4',
'1822',
'1',
'abff4c19-31c3-4769-bffa-323c14d8d6fd',
'Вступна кампанія 2014 року',
'ab1bc732-51f3-475c-bcfe-368363369020',
'1822',
'2001-01-01T00:00:00',
'мова і література (німецька)',
'2014-07-10T16:39:26.16',
'2099-12-31T23:59:59'
);
insert into UniversityCourses (
Id_PersonRequestSeasons,
Id_UniversityCourse,
Id_Language,
UniversityCourseCode,
NamePersonRequestSeasons,
UniversityKode,
Id_UniversityCourseName,
UniversityCourseDateBegin,
UniversityCourseName,
DateLastChange,
UniversityCourseDateEnd
)
 values 
(
'4',
'1823',
'1',
'51fb3965-abfd-4284-842c-e2d2261007f1',
'Вступна кампанія 2014 року',
'ab1bc732-51f3-475c-bcfe-368363369020',
'1823',
'2001-01-01T00:00:00',
'мова і література (французька)',
'2014-07-10T16:40:07.533',
'2099-12-31T23:59:59'
);
insert into UniversityCourses (
Id_PersonRequestSeasons,
Id_UniversityCourse,
Id_Language,
UniversityCourseCode,
NamePersonRequestSeasons,
UniversityKode,
Id_UniversityCourseName,
UniversityCourseDateBegin,
UniversityCourseName,
DateLastChange,
UniversityCourseDateEnd
)
 values 
(
'4',
'1824',
'1',
'b3e7b69f-0c16-4d39-97e5-4f26d394cb3b',
'Вступна кампанія 2014 року',
'ab1bc732-51f3-475c-bcfe-368363369020',
'1824',
'2001-01-01T00:00:00',
'мова і література (іспанська)',
'2014-07-10T16:40:27.857',
'2099-12-31T23:59:59'
);
insert into UniversityCourses (
Id_PersonRequestSeasons,
Id_UniversityCourse,
Id_Language,
UniversityCourseCode,
NamePersonRequestSeasons,
UniversityKode,
Id_UniversityCourseName,
UniversityCourseDateBegin,
UniversityCourseName,
DateLastChange,
UniversityCourseDateEnd
)
 values 
(
'4',
'1825',
'1',
'00d1fe58-564f-4d68-a00b-f7f6e6d10808',
'Вступна кампанія 2014 року',
'ab1bc732-51f3-475c-bcfe-368363369020',
'1825',
'2001-01-01T00:00:00',
'переклад (англійська)',
'2014-07-10T16:40:46.627',
'2099-12-31T23:59:59'
);
insert into UniversityCourses (
Id_PersonRequestSeasons,
Id_UniversityCourse,
Id_Language,
UniversityCourseCode,
NamePersonRequestSeasons,
UniversityKode,
Id_UniversityCourseName,
UniversityCourseDateBegin,
UniversityCourseName,
DateLastChange,
UniversityCourseDateEnd
)
 values 
(
'4',
'1826',
'1',
'780f630e-cf91-40a7-b299-83f9e90a16a2',
'Вступна кампанія 2014 року',
'ab1bc732-51f3-475c-bcfe-368363369020',
'1826',
'2001-01-01T00:00:00',
'переклад (німецька)',
'2014-07-10T16:41:05.523',
'2099-12-31T23:59:59'
);
insert into UniversityCourses (
Id_PersonRequestSeasons,
Id_UniversityCourse,
Id_Language,
UniversityCourseCode,
NamePersonRequestSeasons,
UniversityKode,
Id_UniversityCourseName,
UniversityCourseDateBegin,
UniversityCourseName,
DateLastChange,
UniversityCourseDateEnd
)
 values 
(
'4',
'1827',
'1',
'c8481b56-1fbe-4041-a3b5-493e29357de8',
'Вступна кампанія 2014 року',
'ab1bc732-51f3-475c-bcfe-368363369020',
'1827',
'2001-01-01T00:00:00',
'переклад (французька)',
'2014-07-10T16:41:30.913',
'2099-12-31T23:59:59'
);
insert into UniversityCourses (
Id_PersonRequestSeasons,
Id_UniversityCourse,
Id_Language,
UniversityCourseCode,
NamePersonRequestSeasons,
UniversityKode,
Id_UniversityCourseName,
UniversityCourseDateBegin,
UniversityCourseName,
DateLastChange,
UniversityCourseDateEnd
)
 values 
(
'4',
'1828',
'1',
'be11706c-8cd7-4f77-a039-2b842dd4648d',
'Вступна кампанія 2014 року',
'ab1bc732-51f3-475c-bcfe-368363369020',
'1828',
'2001-01-01T00:00:00',
'переклад (українська, російська, болгарська)',
'2014-07-10T16:42:11.053',
'2099-12-31T23:59:59'
);
insert into UniversityCourses (
Id_PersonRequestSeasons,
Id_UniversityCourse,
Id_Language,
UniversityCourseCode,
NamePersonRequestSeasons,
UniversityKode,
Id_UniversityCourseName,
UniversityCourseDateBegin,
UniversityCourseName,
DateLastChange,
UniversityCourseDateEnd
)
 values 
(
'4',
'1829',
'1',
'b8fae45a-f460-4623-a16b-90f74d4ef56d',
'Вступна кампанія 2014 року',
'ab1bc732-51f3-475c-bcfe-368363369020',
'1829',
'2001-01-01T00:00:00',
'переклад (українська, російська, польська)',
'2014-07-10T16:42:43.353',
'2099-12-31T23:59:59'
);
insert into UniversityCourses (
Id_PersonRequestSeasons,
Id_UniversityCourse,
Id_Language,
UniversityCourseCode,
NamePersonRequestSeasons,
UniversityKode,
Id_UniversityCourseName,
UniversityCourseDateBegin,
UniversityCourseName,
DateLastChange,
UniversityCourseDateEnd
)
 values 
(
'4',
'1830',
'1',
'13218b63-5c52-4013-96ed-6d227819914f',
'Вступна кампанія 2014 року',
'ab1bc732-51f3-475c-bcfe-368363369020',
'1830',
'2001-01-01T00:00:00',
'соціологія',
'2014-07-10T16:42:54.22',
'2099-12-31T23:59:59'
);
insert into UniversityCourses (
Id_PersonRequestSeasons,
Id_UniversityCourse,
Id_Language,
UniversityCourseCode,
NamePersonRequestSeasons,
UniversityKode,
Id_UniversityCourseName,
UniversityCourseDateBegin,
UniversityCourseName,
DateLastChange,
UniversityCourseDateEnd
)
 values 
(
'4',
'1831',
'1',
'de5d7d0f-5bfe-4a9e-aeb6-85d84a6c4555',
'Вступна кампанія 2014 року',
'ab1bc732-51f3-475c-bcfe-368363369020',
'1831',
'2001-01-01T00:00:00',
'психологія',
'2014-07-10T16:43:06.01',
'2099-12-31T23:59:59'
);
insert into UniversityCourses (
Id_PersonRequestSeasons,
Id_UniversityCourse,
Id_Language,
UniversityCourseCode,
NamePersonRequestSeasons,
UniversityKode,
Id_UniversityCourseName,
UniversityCourseDateBegin,
UniversityCourseName,
DateLastChange,
UniversityCourseDateEnd
)
 values 
(
'4',
'1832',
'1',
'3c94e6e0-e8f8-4d34-8730-d2ce2fd64d26',
'Вступна кампанія 2014 року',
'ab1bc732-51f3-475c-bcfe-368363369020',
'1832',
'2001-01-01T00:00:00',
'політологія',
'2014-07-10T16:43:19.703',
'2099-12-31T23:59:59'
);
insert into UniversityCourses (
Id_PersonRequestSeasons,
Id_UniversityCourse,
Id_Language,
UniversityCourseCode,
NamePersonRequestSeasons,
UniversityKode,
Id_UniversityCourseName,
UniversityCourseDateBegin,
UniversityCourseName,
DateLastChange,
UniversityCourseDateEnd
)
 values 
(
'4',
'1833',
'1',
'204cdf5d-43a9-4b48-9bf0-91bf25f41006',
'Вступна кампанія 2014 року',
'ab1bc732-51f3-475c-bcfe-368363369020',
'1833',
'2001-01-01T00:00:00',
'країнознавство',
'2014-07-10T16:43:34.46',
'2099-12-31T23:59:59'
);
insert into UniversityCourses (
Id_PersonRequestSeasons,
Id_UniversityCourse,
Id_Language,
UniversityCourseCode,
NamePersonRequestSeasons,
UniversityKode,
Id_UniversityCourseName,
UniversityCourseDateBegin,
UniversityCourseName,
DateLastChange,
UniversityCourseDateEnd
)
 values 
(
'4',
'1834',
'1',
'680026ad-fc25-4418-91a1-f96850123ccd',
'Вступна кампанія 2014 року',
'ab1bc732-51f3-475c-bcfe-368363369020',
'1834',
'2001-01-01T00:00:00',
'журналістика',
'2014-07-10T16:43:45.843',
'2099-12-31T23:59:59'
);
insert into UniversityCourses (
Id_PersonRequestSeasons,
Id_UniversityCourse,
Id_Language,
UniversityCourseCode,
NamePersonRequestSeasons,
UniversityKode,
Id_UniversityCourseName,
UniversityCourseDateBegin,
UniversityCourseName,
DateLastChange,
UniversityCourseDateEnd
)
 values 
(
'4',
'1835',
'1',
'dee55113-3908-40aa-ad14-a843e0fd425f',
'Вступна кампанія 2014 року',
'ab1bc732-51f3-475c-bcfe-368363369020',
'1835',
'2001-01-01T00:00:00',
'реклама і зв`язки з громадськістю (за видами діяльності)',
'2014-07-10T16:45:01.74',
'2099-12-31T23:59:59'
);
insert into UniversityCourses (
Id_PersonRequestSeasons,
Id_UniversityCourse,
Id_Language,
UniversityCourseCode,
NamePersonRequestSeasons,
UniversityKode,
Id_UniversityCourseName,
UniversityCourseDateBegin,
UniversityCourseName,
DateLastChange,
UniversityCourseDateEnd
)
 values 
(
'4',
'1836',
'1',
'79d21d7e-af25-4b3f-97ff-60d2fdf7ec6a',
'Вступна кампанія 2014 року',
'ab1bc732-51f3-475c-bcfe-368363369020',
'1836',
'2001-01-01T00:00:00',
'видавнича справа та редагування',
'2014-07-10T16:45:19.357',
'2099-12-31T23:59:59'
);
insert into UniversityCourses (
Id_PersonRequestSeasons,
Id_UniversityCourse,
Id_Language,
UniversityCourseCode,
NamePersonRequestSeasons,
UniversityKode,
Id_UniversityCourseName,
UniversityCourseDateBegin,
UniversityCourseName,
DateLastChange,
UniversityCourseDateEnd
)
 values 
(
'4',
'1837',
'1',
'4c105d5c-1fb1-4d88-bd35-8b576565aca8',
'Вступна кампанія 2014 року',
'ab1bc732-51f3-475c-bcfe-368363369020',
'1837',
'2001-01-01T00:00:00',
'правознавство',
'2014-07-10T16:45:29.167',
'2099-12-31T23:59:59'
);
insert into UniversityCourses (
Id_PersonRequestSeasons,
Id_UniversityCourse,
Id_Language,
UniversityCourseCode,
NamePersonRequestSeasons,
UniversityKode,
Id_UniversityCourseName,
UniversityCourseDateBegin,
UniversityCourseName,
DateLastChange,
UniversityCourseDateEnd
)
 values 
(
'4',
'1838',
'1',
'bfb24d6b-2712-4ec4-b13e-e065be4c7a4c',
'Вступна кампанія 2014 року',
'ab1bc732-51f3-475c-bcfe-368363369020',
'1838',
'2001-01-01T00:00:00',
'економічна кібернетика',
'2014-07-10T16:45:51.11',
'2099-12-31T23:59:59'
);
insert into UniversityCourses (
Id_PersonRequestSeasons,
Id_UniversityCourse,
Id_Language,
UniversityCourseCode,
NamePersonRequestSeasons,
UniversityKode,
Id_UniversityCourseName,
UniversityCourseDateBegin,
UniversityCourseName,
DateLastChange,
UniversityCourseDateEnd
)
 values 
(
'4',
'1839',
'1',
'9b8dffb1-d332-44d0-9c09-b513324efda8',
'Вступна кампанія 2014 року',
'ab1bc732-51f3-475c-bcfe-368363369020',
'1839',
'2001-01-01T00:00:00',
'міжнародна економіка',
'2014-07-10T16:46:04.203',
'2099-12-31T23:59:59'
);
insert into UniversityCourses (
Id_PersonRequestSeasons,
Id_UniversityCourse,
Id_Language,
UniversityCourseCode,
NamePersonRequestSeasons,
UniversityKode,
Id_UniversityCourseName,
UniversityCourseDateBegin,
UniversityCourseName,
DateLastChange,
UniversityCourseDateEnd
)
 values 
(
'4',
'1840',
'1',
'cc79c789-3ff4-4d11-86a0-da3b025d1204',
'Вступна кампанія 2014 року',
'ab1bc732-51f3-475c-bcfe-368363369020',
'1840',
'2001-01-01T00:00:00',
'управління персоналом та економіка праці',
'2014-07-10T16:46:31.963',
'2099-12-31T23:59:59'
);
insert into UniversityCourses (
Id_PersonRequestSeasons,
Id_UniversityCourse,
Id_Language,
UniversityCourseCode,
NamePersonRequestSeasons,
UniversityKode,
Id_UniversityCourseName,
UniversityCourseDateBegin,
UniversityCourseName,
DateLastChange,
UniversityCourseDateEnd
)
 values 
(
'4',
'1841',
'1',
'20ee9077-8f6d-4bf6-8fc3-e39394fe6ecc',
'Вступна кампанія 2014 року',
'ab1bc732-51f3-475c-bcfe-368363369020',
'1841',
'2001-01-01T00:00:00',
'маркетинг',
'2014-07-10T16:46:41.04',
'2099-12-31T23:59:59'
);
insert into UniversityCourses (
Id_PersonRequestSeasons,
Id_UniversityCourse,
Id_Language,
UniversityCourseCode,
NamePersonRequestSeasons,
UniversityKode,
Id_UniversityCourseName,
UniversityCourseDateBegin,
UniversityCourseName,
DateLastChange,
UniversityCourseDateEnd
)
 values 
(
'4',
'1842',
'1',
'd8b67f92-40ed-4da4-a3d9-b6bfa00525b1',
'Вступна кампанія 2014 року',
'ab1bc732-51f3-475c-bcfe-368363369020',
'1842',
'2001-01-01T00:00:00',
'фінанси і кредит',
'2014-07-10T16:46:54.337',
'2099-12-31T23:59:59'
);
insert into UniversityCourses (
Id_PersonRequestSeasons,
Id_UniversityCourse,
Id_Language,
UniversityCourseCode,
NamePersonRequestSeasons,
UniversityKode,
Id_UniversityCourseName,
UniversityCourseDateBegin,
UniversityCourseName,
DateLastChange,
UniversityCourseDateEnd
)
 values 
(
'4',
'1843',
'1',
'14b125a0-cb17-4282-b619-82f0e49e6344',
'Вступна кампанія 2014 року',
'ab1bc732-51f3-475c-bcfe-368363369020',
'1843',
'2001-01-01T00:00:00',
'облік і аудит',
'2014-07-10T16:47:11.6',
'2099-12-31T23:59:59'
);
insert into UniversityCourses (
Id_PersonRequestSeasons,
Id_UniversityCourse,
Id_Language,
UniversityCourseCode,
NamePersonRequestSeasons,
UniversityKode,
Id_UniversityCourseName,
UniversityCourseDateBegin,
UniversityCourseName,
DateLastChange,
UniversityCourseDateEnd
)
 values 
(
'4',
'1844',
'1',
'30a41650-fa20-4f3b-b958-1bd3d1f72478',
'Вступна кампанія 2014 року',
'ab1bc732-51f3-475c-bcfe-368363369020',
'1844',
'2001-01-01T00:00:00',
'менеджмент',
'2014-07-10T16:47:21.117',
'2099-12-31T23:59:59'
);
insert into UniversityCourses (
Id_PersonRequestSeasons,
Id_UniversityCourse,
Id_Language,
UniversityCourseCode,
NamePersonRequestSeasons,
UniversityKode,
Id_UniversityCourseName,
UniversityCourseDateBegin,
UniversityCourseName,
DateLastChange,
UniversityCourseDateEnd
)
 values 
(
'4',
'1845',
'1',
'a4c86b26-e488-46f1-bd54-cadac1d24155',
'Вступна кампанія 2014 року',
'ab1bc732-51f3-475c-bcfe-368363369020',
'1845',
'2001-01-01T00:00:00',
'хімія',
'2014-07-10T16:47:30.383',
'2099-12-31T23:59:59'
);
insert into UniversityCourses (
Id_PersonRequestSeasons,
Id_UniversityCourse,
Id_Language,
UniversityCourseCode,
NamePersonRequestSeasons,
UniversityKode,
Id_UniversityCourseName,
UniversityCourseDateBegin,
UniversityCourseName,
DateLastChange,
UniversityCourseDateEnd
)
 values 
(
'4',
'1846',
'1',
'e30a0e53-b6e3-4728-93e2-c05d57eac5a9',
'Вступна кампанія 2014 року',
'ab1bc732-51f3-475c-bcfe-368363369020',
'1846',
'2001-01-01T00:00:00',
'біологія',
'2014-07-10T16:47:40.06',
'2099-12-31T23:59:59'
);
insert into UniversityCourses (
Id_PersonRequestSeasons,
Id_UniversityCourse,
Id_Language,
UniversityCourseCode,
NamePersonRequestSeasons,
UniversityKode,
Id_UniversityCourseName,
UniversityCourseDateBegin,
UniversityCourseName,
DateLastChange,
UniversityCourseDateEnd
)
 values 
(
'4',
'1847',
'1',
'4d7a820e-d770-4b24-b026-ac3f179dfcc0',
'Вступна кампанія 2014 року',
'ab1bc732-51f3-475c-bcfe-368363369020',
'1847',
'2001-01-01T00:00:00',
'екологія, охорона навколишнього середовища',
'2014-07-10T16:48:09.68',
'2099-12-31T23:59:59'
);
insert into UniversityCourses (
Id_PersonRequestSeasons,
Id_UniversityCourse,
Id_Language,
UniversityCourseCode,
NamePersonRequestSeasons,
UniversityKode,
Id_UniversityCourseName,
UniversityCourseDateBegin,
UniversityCourseName,
DateLastChange,
UniversityCourseDateEnd
)
 values 
(
'4',
'1848',
'1',
'51e89f8c-7803-4d27-a523-a5cf21ae7fd0',
'Вступна кампанія 2014 року',
'ab1bc732-51f3-475c-bcfe-368363369020',
'1848',
'2001-01-01T00:00:00',
'математика',
'2014-07-10T16:48:18.083',
'2099-12-31T23:59:59'
);
insert into UniversityCourses (
Id_PersonRequestSeasons,
Id_UniversityCourse,
Id_Language,
UniversityCourseCode,
NamePersonRequestSeasons,
UniversityKode,
Id_UniversityCourseName,
UniversityCourseDateBegin,
UniversityCourseName,
DateLastChange,
UniversityCourseDateEnd
)
 values 
(
'4',
'1849',
'1',
'72bfbf80-be58-4472-a982-660361aae925',
'Вступна кампанія 2014 року',
'ab1bc732-51f3-475c-bcfe-368363369020',
'1849',
'2001-01-01T00:00:00',
'фізика',
'2014-07-10T16:48:25.033',
'2099-12-31T23:59:59'
);
insert into UniversityCourses (
Id_PersonRequestSeasons,
Id_UniversityCourse,
Id_Language,
UniversityCourseCode,
NamePersonRequestSeasons,
UniversityKode,
Id_UniversityCourseName,
UniversityCourseDateBegin,
UniversityCourseName,
DateLastChange,
UniversityCourseDateEnd
)
 values 
(
'4',
'1850',
'1',
'3b765a4e-1d17-45c1-9d55-82ebe6459d54',
'Вступна кампанія 2014 року',
'ab1bc732-51f3-475c-bcfe-368363369020',
'1850',
'2001-01-01T00:00:00',
'прикладна фізика',
'2014-07-10T16:48:35.46',
'2099-12-31T23:59:59'
);
insert into UniversityCourses (
Id_PersonRequestSeasons,
Id_UniversityCourse,
Id_Language,
UniversityCourseCode,
NamePersonRequestSeasons,
UniversityKode,
Id_UniversityCourseName,
UniversityCourseDateBegin,
UniversityCourseName,
DateLastChange,
UniversityCourseDateEnd
)
 values 
(
'4',
'1851',
'1',
'9d0e61e7-19ea-4e99-a593-1fbe53f3dd6f',
'Вступна кампанія 2014 року',
'ab1bc732-51f3-475c-bcfe-368363369020',
'1851',
'2001-01-01T00:00:00',
'прикладна математика',
'2014-07-10T16:48:58.32',
'2099-12-31T23:59:59'
);
insert into UniversityCourses (
Id_PersonRequestSeasons,
Id_UniversityCourse,
Id_Language,
UniversityCourseCode,
NamePersonRequestSeasons,
UniversityKode,
Id_UniversityCourseName,
UniversityCourseDateBegin,
UniversityCourseName,
DateLastChange,
UniversityCourseDateEnd
)
 values 
(
'4',
'1852',
'1',
'b1757ecb-0458-40de-9be5-f09254fb2950',
'Вступна кампанія 2014 року',
'ab1bc732-51f3-475c-bcfe-368363369020',
'1852',
'2001-01-01T00:00:00',
'інформатика',
'2014-07-10T16:49:11.91',
'2099-12-31T23:59:59'
);
insert into UniversityCourses (
Id_PersonRequestSeasons,
Id_UniversityCourse,
Id_Language,
UniversityCourseCode,
NamePersonRequestSeasons,
UniversityKode,
Id_UniversityCourseName,
UniversityCourseDateBegin,
UniversityCourseName,
DateLastChange,
UniversityCourseDateEnd
)
 values 
(
'4',
'1853',
'1',
'97374d74-a59e-403d-a1cf-2d0b0e2b03a8',
'Вступна кампанія 2014 року',
'ab1bc732-51f3-475c-bcfe-368363369020',
'1853',
'2001-01-01T00:00:00',
'програмна інженерія',
'2014-07-10T16:49:28.03',
'2099-12-31T23:59:59'
);
insert into UniversityCourses (
Id_PersonRequestSeasons,
Id_UniversityCourse,
Id_Language,
UniversityCourseCode,
NamePersonRequestSeasons,
UniversityKode,
Id_UniversityCourseName,
UniversityCourseDateBegin,
UniversityCourseName,
DateLastChange,
UniversityCourseDateEnd
)
 values 
(
'4',
'1854',
'1',
'88a2926c-888f-4442-b3d0-bb8fdf07153d',
'Вступна кампанія 2014 року',
'ab1bc732-51f3-475c-bcfe-368363369020',
'1854',
'2001-01-01T00:00:00',
'лісове і садово-паркове господарство',
'2014-07-10T16:49:53.217',
'2099-12-31T23:59:59'
);
insert into UniversityCourses (
Id_PersonRequestSeasons,
Id_UniversityCourse,
Id_Language,
UniversityCourseCode,
NamePersonRequestSeasons,
UniversityKode,
Id_UniversityCourseName,
UniversityCourseDateBegin,
UniversityCourseName,
DateLastChange,
UniversityCourseDateEnd
)
 values 
(
'4',
'1855',
'1',
'd71ab5bf-62ba-416a-8e53-02cfe5020679',
'Вступна кампанія 2014 року',
'ab1bc732-51f3-475c-bcfe-368363369020',
'1855',
'2001-01-01T00:00:00',
'соціальна робота',
'2014-07-10T16:50:03.59',
'2099-12-31T23:59:59'
);
insert into UniversityCourses (
Id_PersonRequestSeasons,
Id_UniversityCourse,
Id_Language,
UniversityCourseCode,
NamePersonRequestSeasons,
UniversityKode,
Id_UniversityCourseName,
UniversityCourseDateBegin,
UniversityCourseName,
DateLastChange,
UniversityCourseDateEnd
)
 values 
(
'4',
'1856',
'1',
'916ebb1c-8459-4ae2-8ffd-7d0ad42144f3',
'Вступна кампанія 2014 року',
'ab1bc732-51f3-475c-bcfe-368363369020',
'1856',
'2001-01-01T00:00:00',
'туризм',
'2014-07-10T16:50:12.26',
'2099-12-31T23:59:59'
);
