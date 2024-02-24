IMPORT $;
HMK := $.File_AllData;

postJSON := OUTPUT(HMK.mc_byStateDS,,'FileName.JSON', JSON, OVERWRITE);

RESPONSE := HTTPCALL('http://127.0.0.1:8000/addData/', 'POST', postJSON, '', JSON, LOG);

OUTPUT(OUTPUT(RESPONSE, NAMED('response')));

// OUTPUT(HMK.unemp_byCountyDS,NAMED('Unemployment'));
// OUTPUT(HMK.EducationDS,NAMED('Education'));
// OUTPUT(HMK.pov_estimatesDS,NAMED('Poverty'));
// OUTPUT(HMK.pop_estimatesDS,NAMED('Population'));
// OUTPUT(HMK.PoliceDS,NAMED('Police'));
// OUTPUT(HMK.FireDS,NAMED('Fire'));
// OUTPUT(HMK.HospitalDS,NAMED('Hospitals'));
// OUTPUT(HMK.ChurchDS,NAMED('Churches'));
// OUTPUT(HMK.FoodBankDS,NAMED('FoodBanks'));
// OUTPUT(HMK.mc_byStateDS,NAMED('NCMEC'));
// OUTPUT(COUNT(HMK.mc_byStateDS),NAMED('NCMEC_Cnt'));
// OUTPUT(HMK.City_DS,NAMED('Cities'));
// OUTPUT(COUNT(HMK.City_DS),NAMED('Cities_Cnt'));

