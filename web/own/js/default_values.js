            function getDefaultValues(){
              var d = new Date();
              var datetime_str = 
                ((d.getDate() < 10)? "0"+d.getDate():d.getDate())+"."
                +(((d.getMonth()+1) < 10)? "0"+(d.getMonth()+1):(d.getMonth()+1))+"."
                +d.getFullYear()+" "
                +((d.getHours() < 10)? "0"+d.getHours():d.getHours())+":"
                +((d.getMinutes() < 10)? "0"+d.getMinutes():d.getMinutes())+":"
                +((d.getSeconds() < 10)? "0"+d.getSeconds():d.getSeconds());
              
              return {
                User : "shevchenko.ruslana@edbo.gov.ua",
                ApplicationKey : "Y0NzMXVGYnplb2lYZzhxVlA3ZUZ4eFJualhlNnowbkh2dmpTQ0FSNkc5U09iOW9yWExQUnVLZ1FWZVNIQmY5b2JMQ1ZaSHRvcmg5eFFka2pKWGlabUZvVnBFN3hTakZCYUROQkhEQ3FzQUFtTFQ5UzRKOE82a2NGeFJGdUs1rMC=",
                Id_Language : "1",
                ActualDate : datetime_str,
                SpecRedactionCode : "09.12.2010",
                Id_PersonRequestSeasons : "4",
                UniversityKode : "ab1bc732-51f3-475c-bcfe-368363369020",
                FacultetGetMode : "1",
                Id_UniversityFacultetTypes : "20",
                IsAvailableForReceiptOfRequest : "-1",
                IsAvailableForBindStudentPersons : "-1",
                IsAvailableForBindStaffPersons : "-1",
                " " : " "
              };
            }