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
BenefitDateBegin,
BenefitsGroupsName,
Id_BenefitName,
BenefitDateEnd,
Key,
Id_Language,
Id_BenefitGroup,
BenefitName,
DateLastChange,
Id_Benefit
)
 values 
(
'2001-01-01T00:00:00',
'Особи, яким Законом України «Про статус ветеранів війни, гарантії їх соціального захисту» надано таке право',
'1',
'2099-12-31T23:59:59',
'warrior',
'1',
'1',
'Для учасника бойових дій (стаття 12)',
'2011-05-17T16:11:55',
'1'
);
insert into Benefits (
BenefitDateBegin,
BenefitsGroupsName,
Id_BenefitName,
BenefitDateEnd,
Key,
Id_Language,
Id_BenefitGroup,
BenefitName,
DateLastChange,
Id_Benefit
)
 values 
(
'2001-01-01T00:00:00',
'Особи, яким Законом України «Про статус ветеранів війни, гарантії їх соціального захисту» надано таке право',
'2',
'2099-12-31T23:59:59',
'warrior_child',
'1',
'1',
'Для неповнолітніх дітей учасників бойових дій, які загинули або такі, що померли внаслідок поранення, контузії чи каліцтва, одержаних під час воєнних дій (стаття 15)',
'2011-05-17T16:11:55',
'2'
);
insert into Benefits (
BenefitDateBegin,
BenefitsGroupsName,
Id_BenefitName,
BenefitDateEnd,
Key,
Id_Language,
Id_BenefitGroup,
BenefitName,
DateLastChange,
Id_Benefit
)
 values 
(
'2001-01-01T00:00:00',
'Діти-сироти та діти, які залишилися без піклування батьків, а також особи з числа дітей-сиріт та дітей, позбавлених батьківського піклування, віком від 18 до 23 років',
'3',
'2099-12-31T23:59:59',
'orphan',
'1',
'2',
'Дитина-сирота, в якої померли або загинули батьки',
'2011-05-17T16:11:55',
'3'
);
insert into Benefits (
BenefitDateBegin,
BenefitsGroupsName,
Id_BenefitName,
BenefitDateEnd,
Key,
Id_Language,
Id_BenefitGroup,
BenefitName,
DateLastChange,
Id_Benefit
)
 values 
(
'2001-01-01T00:00:00',
'Діти-сироти та діти, які залишилися без піклування батьків, а також особи з числа дітей-сиріт та дітей, позбавлених батьківського піклування, віком від 18 до 23 років',
'4',
'2099-12-31T23:59:59',
'parents_rightless',
'1',
'2',
'Позбавлення батьків батьківських прав',
'2011-05-17T16:11:55',
'4'
);
insert into Benefits (
BenefitDateBegin,
BenefitsGroupsName,
Id_BenefitName,
BenefitDateEnd,
Key,
Id_Language,
Id_BenefitGroup,
BenefitName,
DateLastChange,
Id_Benefit
)
 values 
(
'2001-01-01T00:00:00',
'Діти-сироти та діти, які залишилися без піклування батьків, а також особи з числа дітей-сиріт та дітей, позбавлених батьківського піклування, віком від 18 до 23 років',
'5',
'2099-12-31T23:59:59',
'parents_kidnepWOrightless',
'1',
'2',
'Відібрання у батьків без позбавлення батьківських прав',
'2011-05-17T16:11:55',
'5'
);
insert into Benefits (
BenefitDateBegin,
BenefitsGroupsName,
Id_BenefitName,
BenefitDateEnd,
Key,
Id_Language,
Id_BenefitGroup,
BenefitName,
DateLastChange,
Id_Benefit
)
 values 
(
'2001-01-01T00:00:00',
'Діти-сироти та діти, які залишилися без піклування батьків, а також особи з числа дітей-сиріт та дітей, позбавлених батьківського піклування, віком від 18 до 23 років',
'6',
'2099-12-31T23:59:59',
'parents_missings',
'1',
'2',
'Визнання батьків безвісно відсутніми або недієздатними, оголошенням батьків померлими',
'2011-05-17T16:11:55',
'6'
);
insert into Benefits (
BenefitDateBegin,
BenefitsGroupsName,
Id_BenefitName,
BenefitDateEnd,
Key,
Id_Language,
Id_BenefitGroup,
BenefitName,
DateLastChange,
Id_Benefit
)
 values 
(
'2001-01-01T00:00:00',
'Діти-сироти та діти, які залишилися без піклування батьків, а також особи з числа дітей-сиріт та дітей, позбавлених батьківського піклування, віком від 18 до 23 років',
'7',
'2099-12-31T23:59:59',
'parents_in_prison',
'1',
'2',
'Відбування батьками покарання в місцях позбавлення волі чи перебуванням їх під вартою на час слідства',
'2011-05-17T16:11:55',
'7'
);
insert into Benefits (
BenefitDateBegin,
BenefitsGroupsName,
Id_BenefitName,
BenefitDateEnd,
Key,
Id_Language,
Id_BenefitGroup,
BenefitName,
DateLastChange,
Id_Benefit
)
 values 
(
'2001-01-01T00:00:00',
'Діти-сироти та діти, які залишилися без піклування батьків, а також особи з числа дітей-сиріт та дітей, позбавлених батьківського піклування, віком від 18 до 23 років',
'8',
'2099-12-31T23:59:59',
'parents_wanteds',
'1',
'2',
'Розшук батьків органами внутрішніх справ, пов`язаним з ухиленням  від  сплати аліментів та відсутністю  відомостей про їх місцезнаходження',
'2011-05-17T16:11:55',
'8'
);
insert into Benefits (
BenefitDateBegin,
BenefitsGroupsName,
Id_BenefitName,
BenefitDateEnd,
Key,
Id_Language,
Id_BenefitGroup,
BenefitName,
DateLastChange,
Id_Benefit
)
 values 
(
'2001-01-01T00:00:00',
'Діти-сироти та діти, які залишилися без піклування батьків, а також особи з числа дітей-сиріт та дітей, позбавлених батьківського піклування, віком від 18 до 23 років',
'9',
'2099-12-31T23:59:59',
'parents_ills',
'1',
'2',
'Тривала хвороба батьків, що перешкоджає їм виконувати свої батьківські обов`язки',
'2011-05-17T16:11:55',
'9'
);
insert into Benefits (
BenefitDateBegin,
BenefitsGroupsName,
Id_BenefitName,
BenefitDateEnd,
Key,
Id_Language,
Id_BenefitGroup,
BenefitName,
DateLastChange,
Id_Benefit
)
 values 
(
'2001-01-01T00:00:00',
'Діти-сироти та діти, які залишилися без піклування батьків, а також особи з числа дітей-сиріт та дітей, позбавлених батьківського піклування, віком від 18 до 23 років',
'10',
'2099-12-31T23:59:59',
'foundlings',
'1',
'2',
'Підкинуті діти, батьки яких невідомі; діти, від яких відмовилися батьки; та безпритульні діти',
'2011-05-17T16:11:55',
'10'
);
insert into Benefits (
BenefitDateBegin,
BenefitsGroupsName,
Id_BenefitName,
BenefitDateEnd,
Key,
Id_Language,
Id_BenefitGroup,
BenefitName,
DateLastChange,
Id_Benefit
)
 values 
(
'2001-01-01T00:00:00',
'Діти-сироти та діти, які залишилися без піклування батьків, а також особи з числа дітей-сиріт та дітей, позбавлених батьківського піклування, віком від 18 до 23 років',
'11',
'2099-12-31T23:59:59',
'olds_orphans',
'1',
'2',
'Особи віком від 18 до 23 років з числа дітей-сиріт та дітей, позбавлених батьківського піклування',
'2011-05-17T16:11:55',
'11'
);
insert into Benefits (
BenefitDateBegin,
BenefitsGroupsName,
Id_BenefitName,
BenefitDateEnd,
Key,
Id_Language,
Id_BenefitGroup,
BenefitName,
DateLastChange,
Id_Benefit
)
 values 
(
'2001-01-01T00:00:00',
'Інваліди I та II групи та діти-інваліди віком до 18 років, яким не протипоказане навчання за обраним напрямом (спеціальністю)',
'12',
'2099-12-31T23:59:59',
'disableds_I_II',
'1',
'3',
'Інваліди I та II груп, яким не протипоказане навчання за обраною спеціальністю',
'2011-05-17T16:11:55',
'12'
);
insert into Benefits (
BenefitDateBegin,
BenefitsGroupsName,
Id_BenefitName,
BenefitDateEnd,
Key,
Id_Language,
Id_BenefitGroup,
BenefitName,
DateLastChange,
Id_Benefit
)
 values 
(
'2001-01-01T00:00:00',
'Інваліди I та II групи та діти-інваліди віком до 18 років, яким не протипоказане навчання за обраним напрямом (спеціальністю)',
'13',
'2099-12-31T23:59:59',
'young_disableds',
'1',
'3',
'Діти-інваліди віком до 18 років',
'2011-05-17T16:11:55',
'13'
);
insert into Benefits (
BenefitDateBegin,
BenefitsGroupsName,
Id_BenefitName,
BenefitDateEnd,
Key,
Id_Language,
Id_BenefitGroup,
BenefitName,
DateLastChange,
Id_Benefit
)
 values 
(
'2001-01-01T00:00:00',
'Особи, яким Законом України «Про статус і соціальний захист громадян, які постраждали внаслідок Чорнобильської катастрофи» надано таке право',
'14',
'2099-12-31T23:59:59',
'chornobyl_I',
'1',
'4',
'Громадяни що постраждали внаслідок Чорнобильської катастрофи. 1 категорія (пункт 26 статті 20)',
'2011-05-17T16:11:55',
'14'
);
insert into Benefits (
BenefitDateBegin,
BenefitsGroupsName,
Id_BenefitName,
BenefitDateEnd,
Key,
Id_Language,
Id_BenefitGroup,
BenefitName,
DateLastChange,
Id_Benefit
)
 values 
(
'2001-01-01T00:00:00',
'Особи, яким Законом України «Про статус і соціальний захист громадян, які постраждали внаслідок Чорнобильської катастрофи» надано таке право',
'15',
'2099-12-31T23:59:59',
'chornobyl_II',
'1',
'4',
'Громадяни що постраждали внаслідок Чорнобильської катастрофи. 2 категорія (пункт 26 статті 20 через пункт 1 статті 21)',
'2011-05-17T16:11:55',
'15'
);
insert into Benefits (
BenefitDateBegin,
BenefitsGroupsName,
Id_BenefitName,
BenefitDateEnd,
Key,
Id_Language,
Id_BenefitGroup,
BenefitName,
DateLastChange,
Id_Benefit
)
 values 
(
'2001-01-01T00:00:00',
'Особи, яким Законом України «Про статус і соціальний захист громадян, які постраждали внаслідок Чорнобильської катастрофи» надано таке право',
'16',
'2099-12-31T23:59:59',
'chornobyl_III',
'1',
'4',
'Громадяни що постраждали внаслідок Чорнобильської катастрофи. 3 категорія (пункт 6 статті 22)',
'2011-05-17T16:11:55',
'16'
);
insert into Benefits (
BenefitDateBegin,
BenefitsGroupsName,
Id_BenefitName,
BenefitDateEnd,
Key,
Id_Language,
Id_BenefitGroup,
BenefitName,
DateLastChange,
Id_Benefit
)
 values 
(
'2001-01-01T00:00:00',
'Особи, яким Законом України «Про статус і соціальний захист громадян, які постраждали внаслідок Чорнобильської катастрофи» надано таке право',
'17',
'2099-12-31T23:59:59',
'chornobyl_IV',
'1',
'4',
'Громадяни що постраждали внаслідок Чорнобильської катастрофи. 4 категорія (пункт 6 статті 22 через пункт 1 статті 23)',
'2011-05-17T16:11:55',
'17'
);
insert into Benefits (
BenefitDateBegin,
BenefitsGroupsName,
Id_BenefitName,
BenefitDateEnd,
Key,
Id_Language,
Id_BenefitGroup,
BenefitName,
DateLastChange,
Id_Benefit
)
 values 
(
'2001-01-01T00:00:00',
'Особи, яким Законом України «Про статус і соціальний захист громадян, які постраждали внаслідок Чорнобильської катастрофи» надано таке право',
'18',
'2099-12-31T23:59:59',
'chornobyl_before18',
'1',
'4',
'Діти до 18 років – інваліди у зв’язку з Чорнобильською катастрофою (пункт 4 частини 3 статті 30)',
'2011-05-17T16:11:55',
'18'
);
insert into Benefits (
BenefitDateBegin,
BenefitsGroupsName,
Id_BenefitName,
BenefitDateEnd,
Key,
Id_Language,
Id_BenefitGroup,
BenefitName,
DateLastChange,
Id_Benefit
)
 values 
(
'2001-01-01T00:00:00',
'Особи, яким Законом України «Про статус і соціальний захист громадян, які постраждали внаслідок Чорнобильської катастрофи» надано таке право',
'19',
'2099-12-31T23:59:59',
'chornobyl_b18_pd_I_II',
'1',
'4',
'Діти віком до 18 років, у яких померли батьки, віднесені до 1 або 2 категорії, смерть яких пов’язана з Чорнобильською катастрофою (пункт 26 статті 20 через частину 2 статті 20 та частини 2 статті 21)',
'2011-05-17T16:11:55',
'19'
);
insert into Benefits (
BenefitDateBegin,
BenefitsGroupsName,
Id_BenefitName,
BenefitDateEnd,
Key,
Id_Language,
Id_BenefitGroup,
BenefitName,
DateLastChange,
Id_Benefit
)
 values 
(
'2001-01-01T00:00:00',
'Особи, яким Законом України «Про статус і соціальний захист громадян, які постраждали внаслідок Чорнобильської катастрофи» надано таке право',
'20',
'2099-12-31T23:59:59',
'chornobyl_b18_pd_III',
'1',
'4',
'Діти віком до 18 років, у яких померли батьки з числа учасників ліквідації наслідків аварії на ЧАЕС, віднесених до 3 категорії, смерть яких пов’язана з Чорнобильською катастрофою (пункт 26 статті 20 через частину 2 статті 22)',
'2011-05-17T16:11:55',
'20'
);
insert into Benefits (
BenefitDateBegin,
BenefitsGroupsName,
Id_BenefitName,
BenefitDateEnd,
Key,
Id_Language,
Id_BenefitGroup,
BenefitName,
DateLastChange,
Id_Benefit
)
 values 
(
'2001-01-01T00:00:00',
'Особи, яким Законом України «Про статус і соціальний захист громадян, які постраждали внаслідок Чорнобильської катастрофи» надано таке право',
'21',
'2099-12-31T23:59:59',
'chornobyl_b18_p_I',
'1',
'4',
'Діти віком до 18 років, батьки яких віднесені до 1 категорії (частина 2 статті 20 через пункт 26 статті 20)',
'2011-05-17T16:11:55',
'21'
);
insert into Benefits (
BenefitDateBegin,
BenefitsGroupsName,
Id_BenefitName,
BenefitDateEnd,
Key,
Id_Language,
Id_BenefitGroup,
BenefitName,
DateLastChange,
Id_Benefit
)
 values 
(
'2001-01-01T00:00:00',
'Діти, чиї батьки загинули або стали інвалідами на вугледобувних підприємствах, при вступі на навчання за гірничими спеціальностями',
'22',
'2099-12-31T23:59:59',
'pdead_coalminigs',
'1',
'5',
'Діти, чиї батьки загинули на вугледобувних підприємствах, при вступі на навчання за гірничими спеціальностями',
'2011-05-17T16:11:55',
'22'
);
insert into Benefits (
BenefitDateBegin,
BenefitsGroupsName,
Id_BenefitName,
BenefitDateEnd,
Key,
Id_Language,
Id_BenefitGroup,
BenefitName,
DateLastChange,
Id_Benefit
)
 values 
(
'2001-01-01T00:00:00',
'Діти, чиї батьки загинули або стали інвалідами на вугледобувних підприємствах, при вступі на навчання за гірничими спеціальностями',
'23',
'2099-12-31T23:59:59',
'pdis_coalminigs',
'1',
'5',
'Діти, чиї батьки стали інвалідами на вугледобувних підприємствах, при вступі на навчання за гірничими спеціальностями',
'2011-05-17T16:11:55',
'23'
);
insert into Benefits (
BenefitDateBegin,
BenefitsGroupsName,
Id_BenefitName,
BenefitDateEnd,
Key,
Id_Language,
Id_BenefitGroup,
BenefitName,
DateLastChange,
Id_Benefit
)
 values 
(
'2001-01-01T00:00:00',
' Діти військовослужбовців Збройних Сил України, інших військових формувань, працівників правоохоронних органів, які загинули під час виконання службових обов’язків',
'24',
'2099-12-31T23:59:59',
'pdead_warriors',
'1',
'6',
'Діти військовослужбовців Збройних Сил України, інших військових формувань, працівників правоохоронних органів, які загинули під час виконання службових обов’язків',
'2011-05-17T16:11:55',
'24'
);
insert into Benefits (
BenefitDateBegin,
BenefitsGroupsName,
Id_BenefitName,
BenefitDateEnd,
Key,
Id_Language,
Id_BenefitGroup,
BenefitName,
DateLastChange,
Id_Benefit
)
 values 
(
'2001-01-01T00:00:00',
'Члени сімей шахтарів та гірничорятувальників, які загинули внаслідок аварії на орендному підприємстві «Шахта імені О.Ф. Засядька», згідно з додатком 6 до постанови Кабінету Міністрів України від 9 січня 2008 року № 6',
'25',
'2099-12-31T23:59:59',
'zasyadko_relatives',
'1',
'7',
'Члени сімей шахтарів та гірничорятувальників, що загинули внаслідок аварії на орендному підприємстві «Шахта імені О.Ф. Засядька»',
'2011-05-17T16:11:55',
'25'
);
insert into Benefits (
BenefitDateBegin,
BenefitsGroupsName,
Id_BenefitName,
BenefitDateEnd,
Key,
Id_Language,
Id_BenefitGroup,
BenefitName,
DateLastChange,
Id_Benefit
)
 values 
(
'2001-01-01T00:00:00',
'Особи, яким Законом України «Про підвищення престижності шахтарської праці» надано таке право',
'26',
'2099-12-31T23:59:59',
'3years_miners',
'1',
'8',
'Шахтарі, що мають стаж підземної роботи не менш як три роки',
'2011-05-17T16:11:55',
'26'
);
insert into Benefits (
BenefitDateBegin,
BenefitsGroupsName,
Id_BenefitName,
BenefitDateEnd,
Key,
Id_Language,
Id_BenefitGroup,
BenefitName,
DateLastChange,
Id_Benefit
)
 values 
(
'2001-01-01T00:00:00',
'Особи, яким Законом України «Про підвищення престижності шахтарської праці» надано таке право',
'32',
'2099-12-31T23:59:59',
'shahtar27',
'1',
'8',
'Особи, батьки яких є шахтарями та мають стаж підземної роботи не менш як 15 років (протягом трьох років після здобуття загальної середньої освіти)',
'2012-06-30T11:16:26',
'27'
);
insert into Benefits (
BenefitDateBegin,
BenefitsGroupsName,
Id_BenefitName,
BenefitDateEnd,
Key,
Id_Language,
Id_BenefitGroup,
BenefitName,
DateLastChange,
Id_Benefit
)
 values 
(
'2001-01-01T00:00:00',
'Особи, яким Законом України «Про підвищення престижності шахтарської праці» надано таке право',
'33',
'2099-12-31T23:59:59',
'shahtar28',
'1',
'8',
'Особи, батьки яких були шахтарями та загинули внаслідок нещасного випадку на виробництві (протягом трьох років після здобуття загальної середньої освіти)',
'2012-06-30T11:16:26',
'28'
);
insert into Benefits (
BenefitDateBegin,
BenefitsGroupsName,
Id_BenefitName,
BenefitDateEnd,
Key,
Id_Language,
Id_BenefitGroup,
BenefitName,
DateLastChange,
Id_Benefit
)
 values 
(
'2001-01-01T00:00:00',
'Особи, яким Законом України «Про підвищення престижності шахтарської праці» надано таке право',
'34',
'2099-12-31T23:59:59',
'shahtar29',
'1',
'8',
'Особи, батьки яких були шахтарями та стали інвалідами I або II групи (протягом трьох років після здобуття загальної середньої освіти)',
'2012-06-30T11:16:26',
'29'
);
insert into Benefits (
BenefitDateBegin,
BenefitsGroupsName,
Id_BenefitName,
BenefitDateEnd,
Key,
Id_Language,
Id_BenefitGroup,
BenefitName,
DateLastChange,
Id_Benefit
)
 values 
(
'2001-01-01T00:00:00',
'Категорії осіб, які досягли визначних успіхів у вивченні профільних дисциплін і мають право на зарахування відповідно до пункту 12.1 Умов прийому до вищих навчальних закладів України',
'35',
'2099-12-31T23:59:59',
'olimp',
'1',
'9',
'Учасники міжнародних олімпіад з конкурсних профільних предметів',
'2012-06-01T00:00:00',
'30'
);
insert into Benefits (
BenefitDateBegin,
BenefitsGroupsName,
Id_BenefitName,
BenefitDateEnd,
Key,
Id_Language,
Id_BenefitGroup,
BenefitName,
DateLastChange,
Id_Benefit
)
 values 
(
'2001-01-01T00:00:00',
'Категорії осіб, які мають право на першочергове зарахування до вищих навчальних закладів відповідно до пункту 14.1 Умов прийому до вищих навчальних закладів України',
'36',
'2099-12-31T23:59:59',
'childinv',
'1',
'10',
'Дитина-інвалід, або дитина-сирота, або дитина, позбавлена батьківського піклування',
'2012-06-01T00:00:00',
'31'
);
insert into Benefits (
BenefitDateBegin,
BenefitsGroupsName,
Id_BenefitName,
BenefitDateEnd,
Key,
Id_Language,
Id_BenefitGroup,
BenefitName,
DateLastChange,
Id_Benefit
)
 values 
(
'2001-01-01T00:00:00',
'Категорії осіб, які мають право на першочергове зарахування до вищих навчальних закладів відповідно до пункту 14.1 Умов прийому до вищих навчальних закладів України',
'37',
'2099-12-31T23:59:59',
'bagatodit',
'1',
'10',
'Діти з багатодітних сімей, які мають п’ятьох і більше дітей',
'2012-06-01T00:00:00',
'32'
);
insert into Benefits (
BenefitDateBegin,
BenefitsGroupsName,
Id_BenefitName,
BenefitDateEnd,
Key,
Id_Language,
Id_BenefitGroup,
BenefitName,
DateLastChange,
Id_Benefit
)
 values 
(
'2001-01-01T00:00:00',
'Категорії осіб, які мають право на першочергове зарахування до вищих навчальних закладів відповідно до пункту 14.1 Умов прийому до вищих навчальних закладів України',
'38',
'2099-12-31T23:59:59',
'warowerh20',
'1',
'10',
'Діти військовослужбовців або громадян, звільнених з військової служби за віком, за станом здоров`я чи у зв`язку із скороченням штатів або проведенням організаційних закодів, які мають вислугу в календарному обчисленні 20 років і більше.',
'2012-06-01T00:00:00',
'33'
);
insert into Benefits (
BenefitDateBegin,
BenefitsGroupsName,
Id_BenefitName,
BenefitDateEnd,
Key,
Id_Language,
Id_BenefitGroup,
BenefitName,
DateLastChange,
Id_Benefit
)
 values 
(
'2001-01-01T00:00:00',
'Категорії осіб, які мають право на першочергове зарахування до вищих навчальних закладів відповідно до пункту 14.1 Умов прийому до вищих навчальних закладів України',
'39',
'2099-12-31T23:59:59',
'warowerh20',
'1',
'10',
'Діти військовослужбовців, які стали інвалідами внаслідок захворювання, пов`язаного з проходженням військової служби.',
'2012-06-01T00:00:00',
'34'
);
insert into Benefits (
BenefitDateBegin,
BenefitsGroupsName,
Id_BenefitName,
BenefitDateEnd,
Key,
Id_Language,
Id_BenefitGroup,
BenefitName,
DateLastChange,
Id_Benefit
)
 values 
(
'2001-01-01T00:00:00',
'Категорії осіб, які мають право на першочергове зарахування до вищих навчальних закладів відповідно до пункту 14.1 Умов прийому до вищих навчальних закладів України',
'40',
'2099-12-31T23:59:59',
'inv3gr',
'1',
'10',
'Інваліди ІІІ групи.',
'2012-06-01T00:00:00',
'35'
);
insert into Benefits (
BenefitDateBegin,
BenefitsGroupsName,
Id_BenefitName,
BenefitDateEnd,
Key,
Id_Language,
Id_BenefitGroup,
BenefitName,
DateLastChange,
Id_Benefit
)
 values 
(
'2001-01-01T00:00:00',
'Категорії осіб, які мають право на першочергове зарахування до вищих навчальних закладів відповідно до пункту 14.1 Умов прийому до вищих навчальних закладів України',
'41',
'2099-12-31T23:59:59',
'malozab',
'1',
'10',
'Діти з малозабезпечених сімей, у яких: Обидва батьки є інвалідами; Один з батьків інвалід, а інший помер; Одинока матір з числа інвалідів; Батько з числа інвалідів, який виховує дитину без матері.',
'2012-06-01T00:00:00',
'36'
);
insert into Benefits (
BenefitDateBegin,
BenefitsGroupsName,
Id_BenefitName,
BenefitDateEnd,
Key,
Id_Language,
Id_BenefitGroup,
BenefitName,
DateLastChange,
Id_Benefit
)
 values 
(
'2001-01-01T00:00:00',
'Категорії осіб, які мають право на першочергове зарахування до вищих навчальних закладів відповідно до пункту 14.1 Умов прийому до вищих навчальних закладів України',
'42',
'2099-12-31T23:59:59',
'mountains',
'1',
'10',
'Мешканці гірських населених пунктів.',
'2012-06-01T00:00:00',
'37'
);
insert into Benefits (
BenefitDateBegin,
BenefitsGroupsName,
Id_BenefitName,
BenefitDateEnd,
Key,
Id_Language,
Id_BenefitGroup,
BenefitName,
DateLastChange,
Id_Benefit
)
 values 
(
'2001-01-01T00:00:00',
'Категорії осіб, які мають право на першочергове зарахування до вищих навчальних закладів відповідно до пункту 14.1 Умов прийому до вищих навчальних закладів України',
'43',
'2099-12-31T23:59:59',
'waraward',
'1',
'10',
'Громадянин України, який відслужив строкову військову службу або службу за контрактом і має позитивну характеристику від командування військової частини.',
'2012-06-01T00:00:00',
'38'
);
insert into Benefits (
BenefitDateBegin,
BenefitsGroupsName,
Id_BenefitName,
BenefitDateEnd,
Key,
Id_Language,
Id_BenefitGroup,
BenefitName,
DateLastChange,
Id_Benefit
)
 values 
(
'2001-01-01T00:00:00',
'Категорії осіб, які мають право на першочергове зарахування до вищих навчальних закладів відповідно до пункту 14.1 Умов прийому до вищих навчальних закладів України',
'44',
'2099-12-31T23:59:59',
'medals',
'1',
'10',
'Випускники старшої школи (повна загальна середня освіта), нагороджені золотою або срібною медаллю, при вступі на базі повної загальної середньої освіти.',
'2012-06-01T00:00:00',
'39'
);
insert into Benefits (
BenefitDateBegin,
BenefitsGroupsName,
Id_BenefitName,
BenefitDateEnd,
Key,
Id_Language,
Id_BenefitGroup,
BenefitName,
DateLastChange,
Id_Benefit
)
 values 
(
'2001-01-01T00:00:00',
'Категорії осіб, які мають право на першочергове зарахування до вищих навчальних закладів відповідно до пункту 14.1 Умов прийому до вищих навчальних закладів України',
'45',
'2099-12-31T23:59:59',
'vidznaka',
'1',
'10',
'Випускники основної школи, які мають свідоцтво про базову загальну середню освіту з відзнакою (при вступі на навчання на основі базової загальної середньої освіти).',
'2012-06-01T00:00:00',
'40'
);
insert into Benefits (
BenefitDateBegin,
BenefitsGroupsName,
Id_BenefitName,
BenefitDateEnd,
Key,
Id_Language,
Id_BenefitGroup,
BenefitName,
DateLastChange,
Id_Benefit
)
 values 
(
'2001-01-01T00:00:00',
'Категорії осіб, які мають право на першочергове зарахування до вищих навчальних закладів відповідно до пункту 14.1 Умов прийому до вищих навчальних закладів України',
'46',
'2099-12-31T23:59:59',
'pvnz',
'1',
'10',
'Вступники, яким право на першочергове зарахування визначено правилами прийому до ВНЗ',
'2012-06-01T00:00:00',
'41'
);
insert into Benefits (
BenefitDateBegin,
BenefitsGroupsName,
Id_BenefitName,
BenefitDateEnd,
Key,
Id_Language,
Id_BenefitGroup,
BenefitName,
DateLastChange,
Id_Benefit
)
 values 
(
'2001-01-01T00:00:00',
'Особи, яким Законом України «Про статус і соціальний захист громадян, які постраждали внаслідок Чорнобильської катастрофи» надано таке право',
'47',
'2099-12-31T23:59:59',
'chor4330_before18',
'1',
'4',
'Діти до 18 років, які постраждали у зв`язку з Чорнобильскою катастрофою (пункт 4 частини 3 статті 30)',
'2011-05-17T16:11:55',
'42'
);
insert into Benefits (
BenefitDateBegin,
BenefitsGroupsName,
Id_BenefitName,
BenefitDateEnd,
Key,
Id_Language,
Id_BenefitGroup,
BenefitName,
DateLastChange,
Id_Benefit
)
 values 
(
'2014-10-29T00:00:00',
'Особи, яким згідно пункту 3 статті 1 Указу Президента України від 29 жовтня 2014 року № 835 «Про невідкладні заходи щодо забезпечення додаткових соціальних гарантій окремим категоріям громадян» надано таке право',
'48',
'2099-12-31T23:59:59',
'soc',
'1',
'11',
'Діти учасників бойових дій із числа осіб, які захищали незалежність, суверенітет і територіальну цілісність України та брали участь в антитерористичній операції, забезпеченні її проведення',
'2014-11-13T07:59:42',
'43'
);
