_sltime = 10;
_dstime = 600;

while {true} do 
{
    [west, "Base"] sideChat "추가설정에서 시야 및 FPS설정, U키를 눌러 분대 설정이 가능합니다.";
    sleep _sltime;

    [west, "Base"] sideChat "맵 좌측 상단 파란색 아이콘을 클릭하여 분대태그와 서버 규칙을 확인할 수 있습니다.";
    sleep _sltime;

    [west, "Base"] sideChat "각각의 분대에서는 요청되지않은 무단작전, 무단지원 즉 소통을 통하지않은 행동은 금지됩니다 (분란조성)";
    sleep _sltime;

    [west, "Base"] sideChat "!이곳은 연습서버가 아닙니다! 민폐, 분란조성 및 욕설, 반말 ( Kick & Ban )";
    sleep _sltime;

    [west, "Base"] sideChat "무기를 등뒤에 메는키 -키, 자동달리기 =키";
    sleep _sltime;
	
    [west, "Base"] sideChat "7월 5일부로 분대 유형이 통합되었습니다. 사용 가능한 분대유형은 [보병],[특수],[기갑],[전투],[기동]입니다.";	
    [west, "Base"] sideChat "[보병=보병+해상], [기갑=기계화+기갑], [전투/기동 동시수행 가능(분대태그 변경필요X)]";
    sleep _sltime;

    [west, "Base"] sideChat "서로 존중하는 게임문화를 지키시길 바랍니다. 즐거운 게임 되세요~!";
    sleep _dstime;
};
