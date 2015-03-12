drop table if exists Universities ;
create table Universities(
  id int primary key auto_increment,
  Id_University int comment 'Идентификатор ВУЗа',
  UniversityKode varchar(255) comment 'GUID идентификатор вуза',
  UniversityDateBegin dateTime comment 'Дата начала действия записи',
  UniversityDateEnd dateTime comment 'Дата окончания действия записи',
  EDRPO varchar(255) comment 'Код ЕДРПО',
  DateRegistration dateTime comment 'Дата регистрации ВУЗА',
  UniversityPhone varchar(255) comment 'Контактный номер телефона ВУЗА',
  UniversityEMail varchar(255) comment 'Контактный адрес e-mail ВУЗА',
  Website varchar(255) comment 'Web сайт ВУЗа',
  UniversityBossPhone varchar(255) comment 'Номер телефона директора',
  UniversityBossEMail varchar(255) comment 'Электронная почта директора',
  Id_UniversityName int comment 'Идентификатор имен ВУЗа',
  UniversityFullName varchar(255) comment 'Полное название ВУЗа',
  UniversityShortName varchar(255) comment 'Краткое название ВУЗа',
  KOATUUCode varchar(255) comment 'Десятизначный КОАТУУ код населенного пункта',
  PostIndex varchar(255) comment 'Почтовый индекс',
  KOATUUFullName varchar(255) comment 'Полное название населенного пункта ВУЗа',
  Id_StreetType int comment 'Идентификатор типа улицы',
  StreetTypeFullName varchar(255) comment 'Полное название типа улицы',
  StreetTypeShortName varchar(255) comment 'Краткое название типа улицы',
  UniversityAdress varchar(255) comment 'Адрес университета',
  HouceNum varchar(255) comment 'Номер дома',
  UniversityBossLastName varchar(255) comment 'Фамилия директора',
  UniversityBossFirstName varchar(255) comment 'Имя директора',
  UniversityBossMidleName varchar(255) comment 'Отчество директора',
  Id_EducationType int comment 'Идентификатор типа учебного заведения',
  Id_EducationClass int comment 'Идентификатор класса учебного заведения',
  EducationOrganizationFullTypeName varchar(255) comment 'Полное название типа учебного заведения',
  EducationOrganizationShortTypeName varchar(255) comment 'Краткое название типа учебного заведения',
  EducationOrganizationClassName varchar(255) comment 'Название класса учебного заведения',
  Id_Language int comment 'Идентификатор языка названий',
  Id_UniversityAcreditatin int comment 'Идентификатор записи об аккредитации ВУЗа',
  Id_UniversityAcreditatinType int comment 'Идентификатор уровня аккредитации ВУЗа',
  UniversitiyAcreditatinTypeCode varchar(255) comment 'Код уровня аккредитации ВУЗа',
  IsUniversityVerifed int comment 'Флаг, указывающий что данные учебного заведения верифицировано',
  ExistNeedVerification int comment 'Количество нормативных документов учебного заведения которые требуют верификации оператором ЕДЭБО.',
  Id_UniversityGovernanceType int comment 'Идентификатор подчиненности',
  UniversityGovernanceTypeName varchar(255) comment 'Название органа кому подчинено учебное заведение',
  Id_UniversityRegistration int comment 'Идентификатор текущей регистрационной информации для учебного заведения',
  Id_UniversityRegistrationType int comment 'Идентификатор типа текущей регистрационной информации',
  UniversityRegistrationTypeName varchar(255) comment 'Название типа текущей регистрационной информации',
  Id_RegulationDocument int comment 'Идентификатор нормативного документа подтверждающего текущую регистрацию',
  UniversityRegistrationDateBegin dateTime comment 'Дата начала действия текущей регистрации',
  UniversityRegistrationDateEnd dateTime comment 'Дата окончания действия текущей регистрации',
  UniversityRegistrationDateLastChange dateTime comment 'Дата последнего изменения данных текущей регистрации',
  UniversityRegistrationIsActive int comment 'Флаг, указывающий, что текущая регистрация активна',
  UniversityRegistrationusersCount int comment 'Количество пользователей учебного заведения, зарегистрированное в текущей регистрации',
  Id_UniversityTypeOfFinansing int comment 'Идентификатор типа финансирования',
  UniversityTypeOfFinansingName varchar(255) comment 'Название типа финансирования',
  UniversityKodeParent varchar(255) comment 'GUID идентификатор родительского учебного заведения',
  Id_UniversityPanent int comment 'идентификатор родительского учебного заведения',
  UniversityFullNameParent varchar(255) comment 'Название родительского учебного заведения',
  KOATUUCodeU varchar(255) comment 'Десятизначный КОАТУУ код населенного пункта юридического адреса',
  PostIndexU varchar(255) comment 'Почтовый индекс юридического адреса',
  UniversityAdressU varchar(255) comment 'юридический адрес',
  Id_StreetTypeU int comment 'Идентификатор типа улицы юридического адреса',
  HouceNumU varchar(255) comment 'Номер дома юридического адреса',
  Id_KOATUUU int comment 'Идентификатор кода коатуу юридического адреса',
  KOATUUFullNameU varchar(255) comment 'Полное название населенного пункта ВУЗа юридического адреса',
  StreetTypeFullNameU varchar(255) comment 'Полное название типа улицы юридического адреса',
  Closed int comment 'Флаг, указывающий на то что учебное заведение заблокировано',
  AllowAccessFromParetn int comment 'Флаг, указывающий на то что дан доступ для родительского вуза',
  UniverityFacultetNumberKode varchar(255) comment 'GUID идентификатор структурного подразделения переведенного в учебное заведение',
  UniversityFacultetFullName varchar(255) comment 'Название структурного подразделения переведенного в учебное заведение',
  Id_UniversityJuristicalType int comment 'Идентификатор правового статуса учебного заведения',
  UniversityJuristicalTypeName varchar(255) comment 'Название правового статуса учебного заведения',
  Id_UniversityBossOperatedType int comment 'Идентификатор типа документа, на основе которого действует руководитель',
  UniversityBossOperatedTypeName varchar(255) comment 'Название типа документа, на основе которого действует руководитель',
  BossPost varchar(255) comment 'Должность руководителя.',
  WarrantNumber varchar(255) comment 'Номер доверенности.',
  WarrantDate dateTime comment 'Дата доверенности.',
  Id_UniversityCloseStatusTypes int comment 'Идентификатор причины блокирования учебного заведения',
  UniversityCloseStatusTypesName varchar(255) comment 'Название причины блокирования учебного заведения',
  Give23Nk int comment 'Флаг, указывающий на то что учебное заведение формирует форму 23нк',
  GiveRaiting int comment 'Флаг, указывающий на то что учебное заведение формирует рейтинги',
  Id_UniversityType int comment 'Идентификатор типа учебного заведения',
  UniversityTypeName varchar(255) comment 'Название типа учебного заведения.'
);
insert into Universities (
Give23Nk,
UniversityEMail,
Id_UniversityRegistration,
WarrantDate,
EDRPO,
Id_UniversityAcreditatinType,
Id_EducationClass,
ExistNeedVerification,
UniversityAdressU,
Id_UniversityTypeOfFinansing,
GiveRaiting,
DateRegistration,
UniversityBossEMail,
UniversityTypeOfFinansingName,
UniversityJuristicalTypeName,
Id_UniversityCloseStatusTypes,
UniversityBossOperatedTypeName,
Id_KOATUUU,
BossPost,
Id_UniversityJuristicalType,
UniversityPhone,
WarrantNumber,
Id_UniversityType,
UniversityBossFirstName,
HouceNumU,
UniversityRegistrationDateEnd,
KOATUUCode,
AllowAccessFromParetn,
KOATUUFullNameU,
KOATUUFullName,
UniversityRegistrationTypeName,
KOATUUCodeU,
UniversityBossPhone,
Id_UniversityGovernanceType,
UniversityFacultetFullName,
Id_UniversityPanent,
UniversityRegistrationDateLastChange,
UniversityRegistrationusersCount,
Id_UniversityName,
Id_Language,
UniversityBossLastName,
PostIndex,
Id_RegulationDocument,
StreetTypeFullName,
UniversityDateBegin,
HouceNum,
Id_University,
Id_UniversityBossOperatedType,
StreetTypeFullNameU,
StreetTypeShortName,
UniversityGovernanceTypeName,
UniversityFullNameParent,
UniversityFullName,
Id_StreetType,
Id_UniversityAcreditatin,
IsUniversityVerifed,
EducationOrganizationClassName,
Website,
Closed,
UniversityKode,
Id_EducationType,
UniversityShortName,
EducationOrganizationFullTypeName,
UniversityBossMidleName,
UniversityKodeParent,
EducationOrganizationShortTypeName,
UniversityTypeName,
PostIndexU,
UniversityAdress,
UniversitiyAcreditatinTypeCode,
Id_UniversityRegistrationType,
UniversityRegistrationIsActive,
UniversityRegistrationDateBegin,
Id_StreetTypeU,
UniversityCloseStatusTypesName,
UniverityFacultetNumberKode,
UniversityDateEnd
)
 values 
(
'1',
'kancelry@zsu.zp.ua',
'0',
'2009-08-27T00:00:00',
'02125243    ',
'34',
'0',
'3',
'Жуковського',
'1',
'1',
'1930-08-11T00:00:00',
'kancelry@zsu.zp.ua',
'Державний',
'Юридична особа',
'0',
'Статуту',
'105576',
'ректор',
'1',
'(061) 228 75 00, 764 45 46',
'',
'1',
'Микола',
'66',
'0001-01-01T00:00:00',
'2310136300',
'0',
'ЗАПОРІЗЬКА ОБЛАСТЬ, ЗАПОРІЖЖЯ, ЖОВТНЕВИЙ',
'ЗАПОРІЗЬКА ОБЛАСТЬ, ЗАПОРІЖЖЯ, ЖОВТНЕВИЙ',
'Ліцензія на програмне підключення (SOAP)',
'2310136300',
'(061) 228 75 00,  764 45 46',
'1',
'',
'0',
'0001-01-01T00:00:00',
'0',
'73',
'1',
'Фролов',
'69600   ',
'0',
'вулиця',
'2000-01-01T00:00:00',
'66',
'73',
'1',
'вулиця',
'вул.',
'Міністерство освіти і науки України',
'',
'Державний вищий навчальний заклад "Запорізький національний університет" Міністерства освіти і науки України',
'1',
'704',
'0',
'Відділи та управління освіти',
'www.zsu.edu.ua',
'0',
'ab1bc732-51f3-475c-bcfe-368363369020',
'1',
'ЗНУ',
'Університет',
'Олександрович',
'',
'',
'Вищий навчальний заклад',
'69600   ',
'Жуковського',
'III-IV',
'0',
'0',
'0001-01-01T00:00:00',
'1',
'',
'0',
'2099-12-31T23:59:59'
);
insert into Universities (
Give23Nk,
UniversityEMail,
Id_UniversityRegistration,
WarrantDate,
EDRPO,
Id_UniversityAcreditatinType,
Id_EducationClass,
ExistNeedVerification,
UniversityAdressU,
Id_UniversityTypeOfFinansing,
GiveRaiting,
DateRegistration,
UniversityBossEMail,
UniversityTypeOfFinansingName,
UniversityJuristicalTypeName,
Id_UniversityCloseStatusTypes,
UniversityBossOperatedTypeName,
Id_KOATUUU,
BossPost,
Id_UniversityJuristicalType,
UniversityPhone,
WarrantNumber,
Id_UniversityType,
UniversityBossFirstName,
HouceNumU,
UniversityRegistrationDateEnd,
KOATUUCode,
AllowAccessFromParetn,
KOATUUFullNameU,
KOATUUFullName,
UniversityRegistrationTypeName,
KOATUUCodeU,
UniversityBossPhone,
Id_UniversityGovernanceType,
UniversityFacultetFullName,
Id_UniversityPanent,
UniversityRegistrationDateLastChange,
UniversityRegistrationusersCount,
Id_UniversityName,
Id_Language,
UniversityBossLastName,
PostIndex,
Id_RegulationDocument,
StreetTypeFullName,
UniversityDateBegin,
HouceNum,
Id_University,
Id_UniversityBossOperatedType,
StreetTypeFullNameU,
StreetTypeShortName,
UniversityGovernanceTypeName,
UniversityFullNameParent,
UniversityFullName,
Id_StreetType,
Id_UniversityAcreditatin,
IsUniversityVerifed,
EducationOrganizationClassName,
Website,
Closed,
UniversityKode,
Id_EducationType,
UniversityShortName,
EducationOrganizationFullTypeName,
UniversityBossMidleName,
UniversityKodeParent,
EducationOrganizationShortTypeName,
UniversityTypeName,
PostIndexU,
UniversityAdress,
UniversitiyAcreditatinTypeCode,
Id_UniversityRegistrationType,
UniversityRegistrationIsActive,
UniversityRegistrationDateBegin,
Id_StreetTypeU,
UniversityCloseStatusTypesName,
UniverityFacultetNumberKode,
UniversityDateEnd
)
 values 
(
'1',
'egfznu@mail.ru',
'0',
'2012-09-30T00:00:00',
'36448505    ',
'23',
'0',
'3',
'Кірова',
'1',
'1',
'2009-03-30T00:00:00',
'egfznu@mail.ru',
'Державний',
'Без права юридичної особи',
'0',
'Довіреності',
'105590',
'декан',
'2',
'(0619)426462',
'01-25/112',
'1',
'Євген',
'160-А',
'0001-01-01T00:00:00',
'2310700000',
'1',
'ЗАПОРІЗЬКА ОБЛАСТЬ, МЕЛІТОПОЛЬ',
'ЗАПОРІЗЬКА ОБЛАСТЬ, МЕЛІТОПОЛЬ',
'Ліцензія на робочі станції',
'2310700000',
'(0619)426461',
'1',
'Економіко-гуманітарний факультет Державного вищого навчального закладу  «Запорізький національний університет» у м. Мелітополі Запорізької області',
'73',
'0001-01-01T00:00:00',
'0',
'787',
'1',
'Адоньєв',
'72319   ',
'0',
'вулиця',
'1990-01-01T00:00:00',
'160-А',
'787',
'2',
'вулиця',
'вул.',
'Міністерство освіти і науки України',
'Державний вищий навчальний заклад "Запорізький національний університет" Міністерства освіти і науки України',
'Економіко-гуманітарний факультет Державного вищого навчального закладу "Запорізький національний університет" Міністерства освіти і науки України у м. Мелітополі Запорізької області',
'1',
'2712',
'1',
'Відділи та управління освіти',
'www.egfznu.com.ua',
'0',
'3b6652d3-5313-4a67-b80e-cc04c15b1dc1',
'7',
'ЕГФ ЗНУ',
'Відокремлений підрозділ',
'Олександрович',
'ab1bc732-51f3-475c-bcfe-368363369020',
'',
'Вищий навчальний заклад',
'72319   ',
'Кірова',
'II-III',
'0',
'0',
'0001-01-01T00:00:00',
'1',
'',
'1872',
'2099-12-31T23:59:59'
);
insert into Universities (
Give23Nk,
UniversityEMail,
Id_UniversityRegistration,
WarrantDate,
EDRPO,
Id_UniversityAcreditatinType,
Id_EducationClass,
ExistNeedVerification,
UniversityAdressU,
Id_UniversityTypeOfFinansing,
GiveRaiting,
DateRegistration,
UniversityBossEMail,
UniversityTypeOfFinansingName,
UniversityJuristicalTypeName,
Id_UniversityCloseStatusTypes,
UniversityBossOperatedTypeName,
Id_KOATUUU,
BossPost,
Id_UniversityJuristicalType,
UniversityPhone,
WarrantNumber,
Id_UniversityType,
UniversityBossFirstName,
HouceNumU,
UniversityRegistrationDateEnd,
KOATUUCode,
AllowAccessFromParetn,
KOATUUFullNameU,
KOATUUFullName,
UniversityRegistrationTypeName,
KOATUUCodeU,
UniversityBossPhone,
Id_UniversityGovernanceType,
UniversityFacultetFullName,
Id_UniversityPanent,
UniversityRegistrationDateLastChange,
UniversityRegistrationusersCount,
Id_UniversityName,
Id_Language,
UniversityBossLastName,
PostIndex,
Id_RegulationDocument,
StreetTypeFullName,
UniversityDateBegin,
HouceNum,
Id_University,
Id_UniversityBossOperatedType,
StreetTypeFullNameU,
StreetTypeShortName,
UniversityGovernanceTypeName,
UniversityFullNameParent,
UniversityFullName,
Id_StreetType,
Id_UniversityAcreditatin,
IsUniversityVerifed,
EducationOrganizationClassName,
Website,
Closed,
UniversityKode,
Id_EducationType,
UniversityShortName,
EducationOrganizationFullTypeName,
UniversityBossMidleName,
UniversityKodeParent,
EducationOrganizationShortTypeName,
UniversityTypeName,
PostIndexU,
UniversityAdress,
UniversitiyAcreditatinTypeCode,
Id_UniversityRegistrationType,
UniversityRegistrationIsActive,
UniversityRegistrationDateBegin,
Id_StreetTypeU,
UniversityCloseStatusTypesName,
UniverityFacultetNumberKode,
UniversityDateEnd
)
 values 
(
'1',
'kolledg@znu.edu.ua',
'0',
'1900-01-01T00:00:00',
'02125243    ',
'12',
'0',
'1',
'Жуковського',
'1',
'0',
'2008-03-17T00:00:00',
'epk@znu.edu.ua',
'Державний',
'Без права юридичної особи',
'0',
'Довіреності',
'105576',
'ректор',
'2',
'(061)2287539',
'',
'1',
'Микола',
'66-Б',
'0001-01-01T00:00:00',
'2310136300',
'1',
'ЗАПОРІЗЬКА ОБЛАСТЬ, ЗАПОРІЖЖЯ, ЖОВТНЕВИЙ',
'ЗАПОРІЗЬКА ОБЛАСТЬ, ЗАПОРІЖЖЯ, ЖОВТНЕВИЙ',
'Ліцензія на робочі станції',
'2310136300',
'(061)2287539',
'1',
'Економіко-правничий колледж Державного вищого навчального закладу  «Запорізький національний університет» ',
'73',
'0001-01-01T00:00:00',
'0',
'875',
'1',
'Фролов',
'69600   ',
'0',
'вулиця',
'1990-01-01T00:00:00',
'66-Б',
'875',
'2',
'вулиця',
'вул.',
'Міністерство освіти і науки України',
'Державний вищий навчальний заклад "Запорізький національний університет" Міністерства освіти і науки України',
'Економіко-правничий коледж Державного вищого навчального закладу "Запорізький національний університет" Міністерства освіти і науки України',
'1',
'596',
'1',
'Відділи та управління освіти',
'http://www.znu.edu.ua/ukr/university/koledzhi/econ',
'0',
'3946ad28-fc52-47f1-814c-f52823088bc4',
'7',
'ЕПК ДВНЗ ЗНУ',
'Відокремлений підрозділ',
'Олександрович',
'ab1bc732-51f3-475c-bcfe-368363369020',
'',
'Вищий навчальний заклад',
'69600   ',
'Жуковського',
'I-II',
'0',
'0',
'0001-01-01T00:00:00',
'1',
'',
'9028',
'2099-12-31T23:59:59'
);
insert into Universities (
Give23Nk,
UniversityEMail,
Id_UniversityRegistration,
WarrantDate,
EDRPO,
Id_UniversityAcreditatinType,
Id_EducationClass,
ExistNeedVerification,
UniversityAdressU,
Id_UniversityTypeOfFinansing,
GiveRaiting,
DateRegistration,
UniversityBossEMail,
UniversityTypeOfFinansingName,
UniversityJuristicalTypeName,
Id_UniversityCloseStatusTypes,
UniversityBossOperatedTypeName,
Id_KOATUUU,
BossPost,
Id_UniversityJuristicalType,
UniversityPhone,
WarrantNumber,
Id_UniversityType,
UniversityBossFirstName,
HouceNumU,
UniversityRegistrationDateEnd,
KOATUUCode,
AllowAccessFromParetn,
KOATUUFullNameU,
KOATUUFullName,
UniversityRegistrationTypeName,
KOATUUCodeU,
UniversityBossPhone,
Id_UniversityGovernanceType,
UniversityFacultetFullName,
Id_UniversityPanent,
UniversityRegistrationDateLastChange,
UniversityRegistrationusersCount,
Id_UniversityName,
Id_Language,
UniversityBossLastName,
PostIndex,
Id_RegulationDocument,
StreetTypeFullName,
UniversityDateBegin,
HouceNum,
Id_University,
Id_UniversityBossOperatedType,
StreetTypeFullNameU,
StreetTypeShortName,
UniversityGovernanceTypeName,
UniversityFullNameParent,
UniversityFullName,
Id_StreetType,
Id_UniversityAcreditatin,
IsUniversityVerifed,
EducationOrganizationClassName,
Website,
Closed,
UniversityKode,
Id_EducationType,
UniversityShortName,
EducationOrganizationFullTypeName,
UniversityBossMidleName,
UniversityKodeParent,
EducationOrganizationShortTypeName,
UniversityTypeName,
PostIndexU,
UniversityAdress,
UniversitiyAcreditatinTypeCode,
Id_UniversityRegistrationType,
UniversityRegistrationIsActive,
UniversityRegistrationDateBegin,
Id_StreetTypeU,
UniversityCloseStatusTypesName,
UniverityFacultetNumberKode,
UniversityDateEnd
)
 values 
(
'1',
'kfznu@mail.ru',
'0',
'2012-09-03T00:00:00',
'25756696    ',
'4',
'0',
'5',
'Тихвінська',
'1',
'1',
'2006-12-25T00:00:00',
'kfznu@mail.ru',
'Державний',
'Без права юридичної особи',
'0',
'Довіреності',
'98741',
'декан',
'2',
'(0564) 50-27-33, 50-27-32',
'01-25/109',
'1',
'Катерина',
'15',
'0001-01-01T00:00:00',
'1211036600',
'1',
'ДНІПРОПЕТРОВСЬКА ОБЛАСТЬ, КРИВИЙ РІГ, ЖОВТНЕВИЙ',
'ДНІПРОПЕТРОВСЬКА ОБЛАСТЬ, КРИВИЙ РІГ, ЖОВТНЕВИЙ',
'Ліцензія на робочі станції',
'1211036600',
'0564502732',
'1',
'Криворізький факультет Державного вищого навчального закладу  «Запорізький національний університет» ',
'73',
'0001-01-01T00:00:00',
'0',
'352',
'1',
'Потопа',
'50000   ',
'0',
'вулиця',
'2000-01-01T00:00:00',
'15',
'352',
'2',
'вулиця',
'вул.',
'Міністерство освіти і науки України',
'Державний вищий навчальний заклад "Запорізький національний університет" Міністерства освіти і науки України',
'Криворізький факультет  Державного вищого навчального закладу "Запорізький національний університет" Міністерства освіти і науки України',
'1',
'1768',
'0',
'Відділи та управління освіти',
'http://www.znu.edu.ua/ukr/university/filialy/kryvyjrig',
'0',
'db191b2d-e305-4d82-8f57-2a9f2207b855',
'7',
'Криворізький факультет ЗНУ',
'Відокремлений підрозділ',
'Леонідівна',
'ab1bc732-51f3-475c-bcfe-368363369020',
'',
'Вищий навчальний заклад',
'50000   ',
'Тихвінська',
'IV',
'0',
'0',
'0001-01-01T00:00:00',
'1',
'',
'1661',
'2099-12-31T23:59:59'
);
insert into Universities (
Give23Nk,
UniversityEMail,
Id_UniversityRegistration,
WarrantDate,
EDRPO,
Id_UniversityAcreditatinType,
Id_EducationClass,
ExistNeedVerification,
UniversityAdressU,
Id_UniversityTypeOfFinansing,
GiveRaiting,
DateRegistration,
UniversityBossEMail,
UniversityTypeOfFinansingName,
UniversityJuristicalTypeName,
Id_UniversityCloseStatusTypes,
UniversityBossOperatedTypeName,
Id_KOATUUU,
BossPost,
Id_UniversityJuristicalType,
UniversityPhone,
WarrantNumber,
Id_UniversityType,
UniversityBossFirstName,
HouceNumU,
UniversityRegistrationDateEnd,
KOATUUCode,
AllowAccessFromParetn,
KOATUUFullNameU,
KOATUUFullName,
UniversityRegistrationTypeName,
KOATUUCodeU,
UniversityBossPhone,
Id_UniversityGovernanceType,
UniversityFacultetFullName,
Id_UniversityPanent,
UniversityRegistrationDateLastChange,
UniversityRegistrationusersCount,
Id_UniversityName,
Id_Language,
UniversityBossLastName,
PostIndex,
Id_RegulationDocument,
StreetTypeFullName,
UniversityDateBegin,
HouceNum,
Id_University,
Id_UniversityBossOperatedType,
StreetTypeFullNameU,
StreetTypeShortName,
UniversityGovernanceTypeName,
UniversityFullNameParent,
UniversityFullName,
Id_StreetType,
Id_UniversityAcreditatin,
IsUniversityVerifed,
EducationOrganizationClassName,
Website,
Closed,
UniversityKode,
Id_EducationType,
UniversityShortName,
EducationOrganizationFullTypeName,
UniversityBossMidleName,
UniversityKodeParent,
EducationOrganizationShortTypeName,
UniversityTypeName,
PostIndexU,
UniversityAdress,
UniversitiyAcreditatinTypeCode,
Id_UniversityRegistrationType,
UniversityRegistrationIsActive,
UniversityRegistrationDateBegin,
Id_StreetTypeU,
UniversityCloseStatusTypesName,
UniverityFacultetNumberKode,
UniversityDateEnd
)
 values 
(
'1',
'crimea@znu.edu.ua',
'0',
'2012-09-03T00:00:00',
'24408912    ',
'4',
'0',
'0',
'Севастопольська ',
'1',
'1',
'2000-01-01T00:00:00',
'crimea@znu.edu.ua',
'Державний',
'Без права юридичної особи',
'7',
'Довіреності',
'93592',
'декан',
'2',
'(0652) 60-19-43',
'01-25/110',
'1',
'Олена',
'8',
'0001-01-01T00:00:00',
'0110100000',
'1',
'АВТОНОМНА РЕСПУБЛІКА КРИМ, СІМФЕРОПОЛЬ',
'АВТОНОМНА РЕСПУБЛІКА КРИМ, СІМФЕРОПОЛЬ',
'Ліцензія на робочі станції',
'0110100000',
'(0652) 60-19-43',
'1',
'',
'73',
'0001-01-01T00:00:00',
'0',
'326',
'1',
'Луцик',
'95005   ',
'0',
'вулиця',
'2000-01-01T00:00:00',
'8',
'326',
'2',
'вулиця',
'вул.',
'Міністерство освіти і науки України',
'Державний вищий навчальний заклад "Запорізький національний університет" Міністерства освіти і науки України',
'Кримський факультет Державного вищого навчального закладу "Запорізький національний університет" Міністерства освіти і науки України',
'1',
'1769',
'0',
'Відділи та управління освіти',
'kfznu.org',
'1',
'704620d4-3fc1-4766-9d93-b2d14ed7dbc8',
'7',
'Кримський факультет ЗНУ',
'Відокремлений підрозділ',
'Григорівна',
'ab1bc732-51f3-475c-bcfe-368363369020',
'',
'Вищий навчальний заклад',
'95005',
'Севастопольська ',
'IV',
'0',
'0',
'0001-01-01T00:00:00',
'1',
'Ліквідація',
'0',
'2015-01-06T00:00:00'
);
insert into Universities (
Give23Nk,
UniversityEMail,
Id_UniversityRegistration,
WarrantDate,
EDRPO,
Id_UniversityAcreditatinType,
Id_EducationClass,
ExistNeedVerification,
UniversityAdressU,
Id_UniversityTypeOfFinansing,
GiveRaiting,
DateRegistration,
UniversityBossEMail,
UniversityTypeOfFinansingName,
UniversityJuristicalTypeName,
Id_UniversityCloseStatusTypes,
UniversityBossOperatedTypeName,
Id_KOATUUU,
BossPost,
Id_UniversityJuristicalType,
UniversityPhone,
WarrantNumber,
Id_UniversityType,
UniversityBossFirstName,
HouceNumU,
UniversityRegistrationDateEnd,
KOATUUCode,
AllowAccessFromParetn,
KOATUUFullNameU,
KOATUUFullName,
UniversityRegistrationTypeName,
KOATUUCodeU,
UniversityBossPhone,
Id_UniversityGovernanceType,
UniversityFacultetFullName,
Id_UniversityPanent,
UniversityRegistrationDateLastChange,
UniversityRegistrationusersCount,
Id_UniversityName,
Id_Language,
UniversityBossLastName,
PostIndex,
Id_RegulationDocument,
StreetTypeFullName,
UniversityDateBegin,
HouceNum,
Id_University,
Id_UniversityBossOperatedType,
StreetTypeFullNameU,
StreetTypeShortName,
UniversityGovernanceTypeName,
UniversityFullNameParent,
UniversityFullName,
Id_StreetType,
Id_UniversityAcreditatin,
IsUniversityVerifed,
EducationOrganizationClassName,
Website,
Closed,
UniversityKode,
Id_EducationType,
UniversityShortName,
EducationOrganizationFullTypeName,
UniversityBossMidleName,
UniversityKodeParent,
EducationOrganizationShortTypeName,
UniversityTypeName,
PostIndexU,
UniversityAdress,
UniversitiyAcreditatinTypeCode,
Id_UniversityRegistrationType,
UniversityRegistrationIsActive,
UniversityRegistrationDateBegin,
Id_StreetTypeU,
UniversityCloseStatusTypesName,
UniverityFacultetNumberKode,
UniversityDateEnd
)
 values 
(
'1',
'nizgu@ukr.net',
'0',
'2014-08-29T00:00:00',
'24606492    ',
'34',
'0',
'4',
'Трубників',
'1',
'1',
'2008-07-08T00:00:00',
'nizgu@ukr.net',
'Державний',
'Без права юридичної особи',
'0',
'Довіреності',
'98757',
'декан',
'2',
'0566222128',
'01-15/233',
'1',
'Тетяна',
'18 корпус 3',
'0001-01-01T00:00:00',
'1211600000',
'1',
'ДНІПРОПЕТРОВСЬКА ОБЛАСТЬ, НІКОПОЛЬ',
'ДНІПРОПЕТРОВСЬКА ОБЛАСТЬ, НІКОПОЛЬ',
'Ліцензія на робочі станції',
'1211600000',
'0566222128',
'1',
'Нікопольський факультет Державного вищого навчального закладу  «Запорізький національний університет» ',
'73',
'0001-01-01T00:00:00',
'0',
'303',
'1',
'Берднікова',
'53210   ',
'0',
'проспект',
'2000-01-01T00:00:00',
'18 корпус 3',
'303',
'2',
'проспект',
'просп.',
'Міністерство освіти і науки України',
'Державний вищий навчальний заклад "Запорізький національний університет" Міністерства освіти і науки України',
'Нікопольський факультет Державного вищого навчального закладу "Запорізький національний університет" Міністерства освіти і науки України',
'5',
'700',
'0',
'Відділи та управління освіти',
'www.znu.edu.ua/ukr/university/filialy/nikopol',
'0',
'5ee88445-ca0c-4ef4-882e-34ce238da8a9',
'7',
'НФ ЗНУ',
'Відокремлений підрозділ',
'Миколаївна',
'ab1bc732-51f3-475c-bcfe-368363369020',
'',
'Вищий навчальний заклад',
'53210   ',
'Трубників',
'III-IV',
'0',
'0',
'0001-01-01T00:00:00',
'5',
'',
'1873',
'2099-12-31T23:59:59'
);
insert into Universities (
Give23Nk,
UniversityEMail,
Id_UniversityRegistration,
WarrantDate,
EDRPO,
Id_UniversityAcreditatinType,
Id_EducationClass,
ExistNeedVerification,
UniversityAdressU,
Id_UniversityTypeOfFinansing,
GiveRaiting,
DateRegistration,
UniversityBossEMail,
UniversityTypeOfFinansingName,
UniversityJuristicalTypeName,
Id_UniversityCloseStatusTypes,
UniversityBossOperatedTypeName,
Id_KOATUUU,
BossPost,
Id_UniversityJuristicalType,
UniversityPhone,
WarrantNumber,
Id_UniversityType,
UniversityBossFirstName,
HouceNumU,
UniversityRegistrationDateEnd,
KOATUUCode,
AllowAccessFromParetn,
KOATUUFullNameU,
KOATUUFullName,
UniversityRegistrationTypeName,
KOATUUCodeU,
UniversityBossPhone,
Id_UniversityGovernanceType,
UniversityFacultetFullName,
Id_UniversityPanent,
UniversityRegistrationDateLastChange,
UniversityRegistrationusersCount,
Id_UniversityName,
Id_Language,
UniversityBossLastName,
PostIndex,
Id_RegulationDocument,
StreetTypeFullName,
UniversityDateBegin,
HouceNum,
Id_University,
Id_UniversityBossOperatedType,
StreetTypeFullNameU,
StreetTypeShortName,
UniversityGovernanceTypeName,
UniversityFullNameParent,
UniversityFullName,
Id_StreetType,
Id_UniversityAcreditatin,
IsUniversityVerifed,
EducationOrganizationClassName,
Website,
Closed,
UniversityKode,
Id_EducationType,
UniversityShortName,
EducationOrganizationFullTypeName,
UniversityBossMidleName,
UniversityKodeParent,
EducationOrganizationShortTypeName,
UniversityTypeName,
PostIndexU,
UniversityAdress,
UniversitiyAcreditatinTypeCode,
Id_UniversityRegistrationType,
UniversityRegistrationIsActive,
UniversityRegistrationDateBegin,
Id_StreetTypeU,
UniversityCloseStatusTypesName,
UniverityFacultetNumberKode,
UniversityDateEnd
)
 values 
(
'1',
'tcznu@zp.ukrtel.net',
'0',
'2014-09-11T00:00:00',
'36359049    ',
'1',
'0',
'1',
'Героїв Сталінграду',
'1',
'0',
'2009-02-01T00:00:00',
'zap.oliynyk@gmail.com',
'Державний',
'Без права юридичної особи',
'0',
'Довіреності',
'105576',
'в.о. директора',
'2',
'(0612)-62-71-13, (0612)-62-44-42',
'01-15/241',
'1',
'Олександр',
'1',
'0001-01-01T00:00:00',
'2310136300',
'1',
'ЗАПОРІЗЬКА ОБЛАСТЬ, ЗАПОРІЖЖЯ, ЖОВТНЕВИЙ',
'ЗАПОРІЗЬКА ОБЛАСТЬ, ЗАПОРІЖЖЯ, ЖОВТНЕВИЙ',
'Ліцензія на робочі станції',
'2310136300',
'+38(0612)62-44-42',
'1',
'Торговий коледж',
'73',
'0001-01-01T00:00:00',
'0',
'894',
'1',
'Олійник',
'69095   ',
'0',
'вулиця',
'1990-01-01T00:00:00',
'1',
'894',
'2',
'вулиця',
'вул.',
'Міністерство освіти і науки України',
'Державний вищий навчальний заклад "Запорізький національний університет" Міністерства освіти і науки України',
'Торговий коледж Державного вищого навчального закладу "Запорізький національний університет" Міністерства освіти і науки України',
'1',
'2021',
'1',
'Відділи та управління освіти',
'',
'0',
'89cbf614-4583-4c68-a766-353feb262fc1',
'7',
'ТК ЗНУ',
'Відокремлений підрозділ',
'Леонтійович',
'ab1bc732-51f3-475c-bcfe-368363369020',
'',
'Вищий навчальний заклад',
'69095   ',
'Героїв Сталінграду',
'I',
'0',
'0',
'0001-01-01T00:00:00',
'1',
'',
'10112',
'2099-12-31T23:59:59'
);
