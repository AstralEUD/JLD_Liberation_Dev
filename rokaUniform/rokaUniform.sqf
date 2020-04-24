//init.sqf에 아래 코드를 첨부하세요
//[] execVM "rokaUniform\rokaUniform.sqf";

waitUntil{alive player};

while {true} do {
	waitUntil{
		(getObjectTextures player)#0 == "a3\characters_f_beta\indep\data\ia_soldier_01_clothing_co.paa"
	};	
	
	//systemChat "YOU ARE ROKA!";
	player setObjectTextureGlobal [0, "rokaUniform\roka_co.paa"];

	waitUntil{	
		(getObjectTextures player)#0 != "a3\characters_f_beta\indep\data\ia_soldier_01_clothing_co.paa"
	};		
};

