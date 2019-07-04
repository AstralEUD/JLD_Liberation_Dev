disableSerialization;
VAM_conditioncheck1 = true;

VAM_action = player addAction 
[
//Action title
	"VAM",
//Code
	{0 = createDialog "VAM_GUI";},
	[], 0, true, true, "", //Misc values
//Action condition
	"VAM_conditioncheck1 && !(player isEqualTo vehicle player) && (_this isEqualTo driver vehicle player)"
];