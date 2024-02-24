//IMPORT $, STD;
//IMPORT Visualizer;

//allData := $.File_AllData;

//Record for the police stations for each state
//policeCountedByState := RECORD
//    STRING policeState;
//    unsigned3 policePerState;
//END;

//Record for children missing by state 
//childrenMissingByState := RECORD
//    STRING childrenState;
//    unsigned3 missingPerState;    
//END;

//policeCountTable := TABLE(policeCountedByState,allData.PoliceDS.state AS policeState, COUNT(allData.PoliceDS) AS policeState);


//byStateTable := JOIN(allData.PoliceDS, allData.mc_byStateDS, Left.state = Right.missingstate);

//OUTPUT(policeCountTable, NAMED('CountedPoliceStationsPerState'), ALL);


//Visualizer.ANY.Grid('Children_Police', 'Children_and_Police_by_State')