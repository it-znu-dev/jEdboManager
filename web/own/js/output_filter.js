            function getAttrsToShow(){
              return {
                KOATUUGetL1: ['KOATUUFullName','KOATUUCodeL1'],
                KOATUUGetL2: ['KOATUUFullName','KOATUUCodeL2'],
                KOATUUGetL3: ['KOATUUFullName','KOATUUCodeL3'],
                EducationTypesGet: ['Id_EducationType','EducationOrganizationFullTypeName'],
                StreetTypesGet: ['StreetTypeShortName','StreetTypeFullName'],
                SpecRedactionsGet: ['SpecRedactionsCode'],
                SpecGet: ['SpecDirectionName','SpecSpecialityName','SpecSpecializationName','SpecIndastryName'],
                SubjectsGet: ['SubjectKey','SubjectName'],
                UniversitiesGet: ['UniversityFullName','UniversityKode'],
                UniversityFacultetsTypesGet: ['UniversityFacultetTypeName','Id_UniversityFacultetType'],
                UniversityFacultetsGet: ['UniversityFacultetFullName','UniversityFacultetTypeName','UniversityFacultetKode'],
                UniversityFacultetSpecialitiesGet: ['SpecDirectionName','SpecSpecialityName',
                  'SpecSpecializationName','PersonEducationFormName'],
                QualificationsExGet: ['QualificationName','Id_Qualification'],
                UniversityCoursesGet: ['UniversityCourseName','Id_UniversityCourse'],
                QuotasGet: ['QuotaName','Id_Quota'],
                " " : []
              };
            }
