IMPORT $;
IMPORT Visualizer;

allData := $.File_AllData;

byStateTable := JOIN(allData.PoliceDS, allData.mc_byStateDS, Left.state = Right.missingstate);

EXPORT 
OUTPUT(byStateTable, NAMED('Children_and_Police_by_State'));


Visualizer.ANY.Grid('Children_Police', 'Children_and_Police_by_State')