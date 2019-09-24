player createDiarySubject ["rules","서버 규정"];

player createDiaryRecord ["rules", ["무전망 사용지침", format ["<font size='15'>
<font color='#FFFFFF' size='20'>직접교신	</font>:근거리에 있는 유저간에 직접교신에 사용합니다.<br/>
<font color='#00CCCC' size='20'>진영전용망	</font>:서버에 있는 모든 유저에게 텍스트로 통신하는데 사용합니다.<br/>
<font color='#66FF66' size='20'>그룹무전망	</font>:분대원간에 통신하는데 사용됩니다.<br/>
<font color='#CCCC00' size='20'>차량망		</font>:같은 차량 내 승객간의 통신에 사용됩니다.<br/>
<font color='#FF0000' size='20'>전술통신망	</font>:조종사나 기타 분대간 음성교신이 필요한 경우에 사용합니다. 윈도우키를 눌러 토글할 수 있으며 조종사는 항상 강제 가입되어 있습니다.<br/></font>
"]]];

player createDiaryRecord ["rules", ["항공장비 사용분대", format ["<font size='15'>
<font color='#00CCCC' size='20'>항공분대</font><br/>
분대 태그 : [기동], [전투]<br/>
분대 설명 : 항공장비를 이용해 CAS지원을 해주거나 수송을 도와주는 분대입니다. <br/>
사용 장비 : 무인기를 제외한 모든 종류의 항공장비를 사용가능합니다. <br/><br/>

<font color='#00CCCC' size='20'>장비사용시 주의사항</font><br/>
1.지상분대 없이 점령임무를 수행할 수 없습니다. 방어임무나 초계비행은 단독으로 수행할 수 있습니다.<br/>
2.<font color='#00CCCC'>아군 지상군이 작전중인 지역 인근을 공격하기 전에 반드시 허가를 받아야 합니다.</font><br/>
3.활주로위에 장비를 방치하는것은 절대 금지됩니다. <br/>
4.항공기를 조작하는 인원은 반드시 <font color='#00CCCC'>전술통신망을 개통</font>하고 항상 통신상태를 점검해야 합니다.</font>
"]]];

player createDiaryRecord ["rules", ["지상장비 사용분대", format ["<font size='15'>
<font color='#00CCCC' size='20'>기갑분대</font><br/>
분대 태그 : [기갑]<br/>
분대 설명 : 기갑장비를 사용하여 지역을 점령하는 분대입니다.<br/>
사용 장비 : 모든 종류의 궤도장비와 자주포, MLRS를 사용가능합니다.<br/><br/>

<font color='#00CCCC' size='20'>장비사용시 주의사항</font><br/>
1.각 분대장은 자신의 분대유형에 맞는 적절한 장비를 건설할 권한이 있습니다.<br/>
2.장비를 이용하는 경우에 버그로 인해 장비가 파괴될 가능성이 있는 행동을 하지 않습니다. (예:좁은 틈에 비비기 등)</font>
"]]];

player createDiaryRecord ["rules", ["보병기반 분대목록", format ["<font size='15'>
<font color='#00CCCC' size='20'>보병분대</font><br/>
분대 태그 : [보병]<br/>
분대 설명 : 일반적인 보병 분대입니다.<br/>
사용 장비 : '차량'과 '트럭' 및 '해상장비'를 이용할 수 있습니다.<br/><br/>

<font color='#00CCCC' size='20'>특수분대</font><br/>
분대 태그 : [특수]<br/>
분대 설명 : 무인기를 사용할 수 있으며, FOB파괴, 조종사 구출 등  <font color='#00CCCC'>특수임무를 수행</font>하는 분대입니다.<br/>
사용 장비 : 차량과 모든 종류의 무인장비를 사용할 수 있습니다.<br/>
기타 제약 : 특수임무 발동시 서버 전체의 공수강하 사용이 제한됩니다.<br/></font>
"]]];

player createDiaryRecord ["rules", ["분대태그와 장비사용", format ["<font size='15'>
분대 태그는 분대별로 상이한 규정을 지켜나가며 조화롭게 게임을 플레이하실 수 있도록 강제하고 있는 사항입니다. <br/>
분대태그는 분대명 앞에 [보병], [기갑]같은 식으로 반드시 표기해서 자신의 분대가 어느 분대의 규정을 준수하고 있는지 명확히 나타내기 위한 장치입니다. <br/>
분대태그가 미작성되어 있는 분대는 공수강하나 건설과 같은 기능이 제한되므로 반드시 올바른 분대태그를 표기하도록 홍보해주시면 감사드리겠습니다.<br/>
<font size='20'>(예:'<font color='#00CCCC'>[보병]</font>델타포스', '<font color='#00CCCC'>[특수]</font>FOB털러가자' 등등...)</font><br/><br/>

분대태그를 사용하기 위해서는 U키를 눌러 분대설정창을 띄우고, 적절한 분대태그를 사용중인 분대에 가입하거나, 생성을 눌러 분대를 생성한 후, 우측 상단 검은색 영역을 클릭하면 분대명을 수정할 수 있습니다.<br/>
분대태그는 반드시 [##]와 같은 형식으로 분대명 앞에 작성해주어야 하고, 대괄호 내부에 띄어쓰기나 오타가 있는 경우 시스템이 인식할 수 없습니다.<br/><br/>

차량이나 항공기등 각종 장비를 사용하기 위해서는 적절한 분대태그를 사용해야 해당 차량의 운전석이나 사수석에 탑승하여 장비를 조작할 수 있습니다.<br/>
분대태그별로 사용할 수 있는 장비와 규정이 상이하니, 장비를 사용하기 전에 반드시 규정을 확인하시기 바랍니다.</font>
"]]];

player createDiaryRecord ["rules", ["분대장의 권한과 책임", format ["<font size='15'>
전라도 서버에서 분대장으로 플레이해주시는 모든 분들께 우선 감사의 인사를 전합니다. 저희 전라도 서버는 많은 유저분들을 이끌고 항상 수고해주시는 분대장 여러분의 노고를 치하하며 지원해드릴 것을 약속드립니다. <br/><br/>

아래는 분대장의 몇가지 <font color='#00CCCC'>권한과 책임</font>입니다. <br/><br/>

1.분대장은 자유롭게 자신의 분대를 운용할 권한을 가집니다.<br/>
2.분대장은 자신의 지시를 따르지 않거나, 잘못된 보직으로 가입한 분대원을 추방할 권한과 책임이 있습니다. <br/>
3.분대장은 분대원의 각종 장비 사용이나 건설을 관리할 권한과 책임을 가집니다.<br/><br/>

분대간의 자원배분권한은 보병분대가 가장 높으며, 그 다음으로 지상장비 사용분대와 항공장비 사용분대 순으로 우선순위를 가집니다.<br/>
자원사용과 관련하여 불만사항이 생기는 경우 위의 권한에 따라 토론을 통해 조율하시기 바랍니다. 단, 단순히 자원분배권한을 조율하기 위해 보병분대로 전환한 유저등의 발언권은 인정되지 않습니다.</font>
"]]];

player createDiaryRecord ["rules", ["단독플레이 준수사항", format ["<font size='15'>
단독플레이란 분대에 한명인 상태로 플레이하는것을 지칭합니다.<br/><br/>

1.다른 분대에게 피해를 주지 마세요. <br/>
-다른 지상분대의 작전지에 허가없이 접근하거나 지원하는 것은 금지됩니다.<br/>
-지속적으로 다른 분대에 피해를 주는 경우 킥, 밴조치 될 수 있습니다.<br/><br/>

2.서버 프레임이 게임 플레이에 지장을 줄 정도로 낮을 시 제한될 수 있습니다. <br/>
-단, 위 2번은 관리자 판단하에 제한됩니다.<br/><br/>

3.활성화된 AI가 많아 새로운 작전지가 활성화되지 않는 경우엔 인원이 적은 분대가 신속하게 해당 지역을 이탈하여 비활성화 후, 다수인원 분대에 합류하거나, 그 주변지역을 공략해야 합니다.</font>
"]]];

player createDiaryRecord ["rules", ["처벌 규정", format ["<font size='15'>
<font color='#00CCCC' size='20'>1. 게임 내 공격적인 행동  [ 1 > 3 > 5 > 7 > 10 > 0* ]</font><br/>
-게임 내 총기나 차량 및 기타 모든 수단으로 타 유저에게 허용되지 않은 공격을 하는 행위  <br/>
-타 유저 공격이후 사과가 없거나 공격이 반복 되는 경우 <br/>
-타 유저의 게임플레이에 지장을 주는 경우  <br/>
-타 유저 및 관리자에 공격적인 언행<br/>
<br/>
<font color='#00CCCC' size='20'>2. 서버 룰 및 관리자 지시 불이행 [ 3 > 7 > 0 ]</font><br/>
-자원낭비/장비손실 등 서버 성능과 정상적인 플레이에 지장을 초래할 우려가 있는 경우  <br/>
-서버 관리를 위한 관리자의 지시를 이행하지 않는 경우  <br/>
-분쟁의 소지가 있는 발언 혹은 닉네임을 사용하는 경우<br/>
<br/>
<font color='#00CCCC' size='20'>3. 서버에 적대적인 언동 [ 5 > 10 > 0 ]</font><br/>
-게임 내, 혹은 관련된 커뮤니티에서 서버에 적대적인 행위 일체가 적발된 경우처벌 수위는 누적식으로 운영되며, 관리자 재량에 따라 처벌 수위가 상향될 수 있습니다.<br/>
<br/>
처벌일수 0(빵)은 영구밴을 의미합니다. 다만, 1항의 경우엔 관리자 회의를 통해서만 영구밴 처리할 수 있습니다.<br/>
관리자의 판단에 따라 아래 1인분대 규정 및 장비사용 규정과 관련된 지시가 있는 경우 따라주시기 바랍니다.<br/></font>
"]]];







player createDiarySubject ["updates","서버 업데이트 내역"];

player createDiaryRecord ["updates", ["Jeonlado_Liberation_0.966", format ["<font size='15'>
서버가 업데이트 되었습니다. 업데이트 내용은 아래와 같습니다.<br/><br/>

1.베이스 주변에 버려진 아이템이 자동으로 회수되지 않는 오류를 수정하였습니다.<br/><br/>

2.공수강하시 낙하산 자동전개 고도가 150m로 축소되었습니다.<br/><br/>

3.항공모함의 치료 컨테이너에서 치료가 안되는 문제를 수정하였습니다.<br/><br/>

4.기존엔 서버에 30개 이상의 지뢰를 설치하지 못하던 것을 100개로 늘렸습니다.<br/><br/>

5.자주포와 MLRS의 건설비용을 대폭 늘렸습니다.<br/><br/>

6.최소 프레임을 35에서 20으로 낮추어 프레임을 타협하여 더 먼 곳까지 볼 수 있도록 수정하였습니다. 
</font>
"]]];

player createDiaryRecord ["updates", ["Jeonlado_Liberation_0.965", format ["<font size='15'>
서버가 업데이트 되었습니다. 업데이트 내용은 아래와 같습니다.<br/><br/>

1.PPAP 스크립트가 업데이트 되었습니다.<br/>
-밥캣에서도 무장변경 기능을 사용할 수 있습니다.<br/><br/>

2.공수강하 비용이 10으로 감소하였고 최소 자원량도 100으로 감소하였습니다.<br/><br/>

3.보병분대에서도 조종가능한 헬기로 M-900을 추가하였습니다.<br/>
-항공모함의 허밍버드가 M-900으로 변경되었습니다.</font>
"]]];

player createDiaryRecord ["updates", ["Jeonlado_Liberation_0.964", format ["<font size='15'>
서버가 업데이트 되었습니다. 업데이트 내용은 아래와 같습니다.<br/><br/>

1.PPAP 스크립트가 적용되었습니다.(Thanks to UNIT_Normal)<br/>
-탄약차량 주변에서 각종 항공기의 무장을 미리 정해진 프리셋중에서 선택할 수 있습니다. PPAP!<br/>
-SEAD:대레이더무장, SDB:소형활강폭탄<br/>
-해당 기능을 사용할 수 있는 항공기들의 건설목록이 통일되었으며, 공격기 가격이 인상되었습니다.<br/><br/>

2.기본분대 가입 스크립트에 문제가 있어 관련 스크립트가 해제되었습니다. <br/>
-여전히 항공모함의 NPC를 이용해 분대장을 맡을 필요가 없는 보병분대에 가입할 수 있습니다.<br/><br/>

3.서버 음성 코덱 퀄리티를 감소시켰습니다.<br/>
-음성퀄리티를 줄여 무전음같은 효과를 얻고, 서버 통신 대역폭을 감소시켜 잠재적인 성능향상이 이루어졌습니다.<br/><br/>

4.자원이 부족한경우 반복건설기능을 이용해도 건설이 불가능하도록 수정하였습니다. 대출은 건강한 가계에 해롭습니다.</font>
"]]];

player createDiaryRecord ["updates", ["Jeonlado_Liberation_0.963", format ["<font size='15'>
서버가 업데이트 되었습니다. 업데이트 내용은 아래와 같습니다.<br/><br/>

1.윈도우키를 누르면 화면 좌측 하단에 HP게이지가 표시되도록 추가하였습니다.<br/><br/>

2.리바이브 관련 스크립트가 일부 수정되었습니다.<br/>
-더이상 사망시 주변 AI로 리바이브할 수 없습니다.<br/>
-기절상태에서 추가적인 공격을 받으면 사망할 수 있도록 수정되었습니다.<br/>
-적군은 아군이 쓰러진것을 확인하면 더이상 사격하지 않습니다! 쓰러진 아군에게 수류탄을 던지지 말아주세요!...<br/><br/>

3.IGI로드 스크립트가 일부 수정되었습니다.<br/>
-건설가능한 목록의 장비(모호크 등)에서 해당 스크립트를 사용할 수 있도록 추가하였습니다.<br/>
-이동식 무기고 오브젝트를 IGI로드로 사용할 수 있도록 추가하였습니다. 이제 이동식 무기고를 트럭뒤에 싣거나 모호크로 운송가능합니다.<br/><br/>

4.항공모함에 분대장을 맡지 않고 가입가능한 기본분대를 가입할 수 있도록 AI지휘관을 배치하였습니다. 휠을 이용해 가입가능합니다.<br/><br/>

5.ZAMAK MRL등 일부 포병장비에 [기갑]분대 외의 플레이어가 탑승할 수 있던것을 금지하였습니다.<br/><br/>

6.[특수]분대에서 일반적인 차량을 사용할 수 있도록 수정하였습니다.<br/><br/>

7.서버 접속시 일부 플레이어에게 텍스쳐 오류가 발생하는 현상을 수정하였습니다.<br/><br/>

8.대포병 레이더 스크립트가 삭제되었습니다. 정찰 닉스와 대공 레이더에서 더이상 맵에 마커를 생성하지 않습니다.<br/><br/>

9.탄약자원 수급방식이 전면적으로 개편되었습니다.<br/>
-점령지 유형별 기본 수급량이 아래와 같이 수정되었습니다.<br/>
-일반 점령지 : 2점 / 라디오 타워 : 1점 / 공장 : 2점 / 군사기지 : 3점 / 대도시 : 5점<br/>
-탄약 수급 주기가 빨라졌습니다. 최대 30분에 한번에서 20개의 군사기지를 점령시 5분에 한번으로 수급 주기가 짧아집니다.<br/>
-위협도에 따라 기본 수급량에서 감소된 양 만큼의 자원이 들어오도록 수정되었습니다. (110%-위협도%)*기본 수급량<br/>
-기본 수급량이 100인경우, 위협도가 0%일때 110%인 110의 자원 획득, 위협도가 100%일때 10%인 10의 자원을 흭득하게 됩니다.<br/>
-탄약자원이 10000을 넘어가는 경우, 더이상 자동 자원수급이 이루어지지 않습니다. 10000이상의 자원은 현상금이나 무사복귀 보너스를 이용해 축적할 수 있습니다.<br/>
-자원이 다시 10000 아래로 내려가면 자동으로 자원수급이 이루어집니다.<br/><br/>

10.적군의 기본 경계태세가 강화됩니다.<br/><br/>

11.FOB건설 비용이 3000으로 상향되었습니다.</font>
"]]];

player createDiaryRecord ["updates", ["Jeonlado_Liberation_0.962", format ["<font size='15'>
서버가 업데이트 되었습니다. 업데이트 내용은 아래와 같습니다.<br/><br/>

1.분대태그가 안맞는 경우에도 FFV좌석에 탑승할 수 있도록 수정되었습니다. 허밍버드의 옆좌석등에 탑승할 수 있습니다.<br/><br/>

2.사망시 효과음을 추가하였습니다.<br/><br/>

3.FOB에서 건설되는 물체들의 연산을 비활성화하여 서버 성능을 개선하였습니다.<br/><br/>

4.무선전파 수집스크립트를 추가하였습니다. 자세한 사용방법은 지도-브리핑-RF SCAN 에서 확인할 수 있습니다.<br/><br/>

5.지도상에 적위치 표시주기가 길어지고 정확도를 하향하였습니다.<br/><br/>

6.자원 수집방식이 변경되었습니다. 이제 매 자원 계산당 자원수입량이 위협도만큼 감소합니다. <br/>
-위협도가 0%%일때 자원 수입량은 130%%가 되고, 위협도가 100%%일때 자원수입량은 30%%가 됩니다.<br/>
-위협도는 특수임무를 수행하여 감소시킬 수 있습니다.<br/><br/>

7.일부 적 차량이 현상금을 지급하지 않는 경우를 수정하였습니다.</font>
"]]];

player createDiaryRecord ["updates", ["Jeonlado_Liberation_0.961", format ["<font size='15'>
서버가 업데이트 되었습니다. 업데이트 내용은 아래와 같습니다.<br/><br/>

1.공수강하 비용이 30으로 증가하였습니다.<br/><br/>

2.항공기를 이용한 공수강하의 최소고도가 300m로 완화되었습니다. 또한, 가방이 사라지는 버그가 수정되었습니다.<br/><br/>

3.리스폰시 전술통신망 상태를 유지하도록 수정하였습니다. (조종사는 항상 가입)<br/><br/>

4.특수임무를 생성할 수 없는 경우 안내문과 함께 투입한 정보량 만큼의 위협도가 곱연산으로 감소하도록 수정하였습니다.<br/><br/>

5.임시권한 탑승관련 안내문이 발생하지 않는 현상을 수정하였습니다.<br/><br/></font>
"]]];

player createDiaryRecord ["updates", ["Jeonlado_Liberation_0.960", format ["<font size='15'>
서버가 업데이트 되었습니다. 업데이트 내용은 아래와 같습니다.<br/><br/>

1.공수강하 시스템이 개편되었습니다.<br/>
-이제 지표면 고도 500m이상 장비의 객석에 탑승하고 있는 경우 스크립트 공수강하를 이용할 수 있습니다. <br/>
-낙하산 가방이 없어도 자동으로 낙하산이 생성되며, 항공기를 이용해 공수강하 하는경우 낙하산은 90m상공에서 자동전개됩니다.<br/>
-기존 FOB에서 이용하는 공수강하는 비용은 이전과 동일하며, 대신 200m상공에서 강제로 낙하산이 전개됩니다.<br/>
-객석외에 조종석, 사수석(자신의 총기를 이용해 사격할 수 있는 좌석 포함) 등에서는 공수강하를 사용할 수 없습니다.<br/><br/>

2.추가로 설치한 오브젝트들의 충돌무시가 해제되는 현상을 수정하였습니다.<br/><br/>

3.오브젝트 건설시 지형 각도에 맞추어 건설되도록 수정하여 건설시 오브젝트가 넘어지는 현상을 감소시켰습니다.<br/><br/>

4.슬링로드 스크립트를 일부 수정하였습니다.<br/>
-이제 객석에서 슬링로드 관련 스크립트를 조작할 수 없도록 수정하였습니다. (로프건들지 마세요! 안해도 됩니다!)<br/>
-밥캣에서 밧줄을 연결할 수 있도록 수정하였습니다. 마찬가지로 운전석에서 밧줄을 배치할 수 있습니다.<br/><br/>

5.유지비용이 시간당 위협도*15로 증가하였습니다. (시간당 최대 -1500)</font>
"]]];

player createDiaryRecord ["updates", ["Jeonlado_Liberation_0.959", format ["<font size='15'>
서버가 업데이트 되었습니다. 업데이트 내용은 아래와 같습니다.<br/><br/>

1.서버 규정 안내 방식과 임시 장비사용 권한이 변경되었습니다.<br/>
-기존에 3인이상 분대 분대장이 차량에 탑승하는 경우 안내문이 반복되는 현상을 수정하였습니다. (데스페라도님 제보 감사합니다.)<br/>
-장비 임시사용에 필요한 분대원이 4인으로 늘었습니다. 또한 분대장이 임시권한을 이용해 장비를 탑승하는 경우에만 안내문이 발생하도록 수정하였습니다.<br/>
-조종사 보직으로 접속하는 경우에도 서버 안내문이 발생하도록 수정하였습니다.<br/>
-조종사 보직으로 접속하는 경우 서버안내문 확인 후 조종사 관련 안내문을 추가로 읽고 동의버튼을 눌러야 접속가능하도록 수정하였습니다.<br/><br/>

2.FOB꾸미기에 사용되는 건설목록과 관련되어 몇가지 변경사항이 적용되었습니다.<br/>
-이제 부딪히면 튕겨나가는 오브젝트들이 건설후 한번 정지하면 그자리에 고정되도록 수정하였습니다.<br/>
-오염제거샤워부스에 서버성능에 큰 악영향을 미칠 수 있는 결함이 발견되어 건설목록에서 삭제되었습니다.<br/>
-휴대용 기상스테이션에 상호작용을 추가하였습니다. 이제 FOB에서 건설한 기상장비를 이용해서도 날씨정보를 확인할 수 있습니다.<br/><br/>

3.유지비용이 시간당 위협도*10으로 증가하였습니다.(시간당 최대 -1000)<br/><br/>

4.공수강하시 150m상공에서 자동으로 낙하산이 펼쳐지도록 수정되었습니다. <font color='#FF0000'>죽디말라!</font><br/><br/>

5.시야거리 조절 스크립트에서 최소 프레임을 35아래로 설정하는 경우에도 최소 35프레임 이상을 유지하도록 변경하였습니다.</font>
"]]];

player createDiaryRecord ["updates", ["Jeonlado_Liberation_0.958", format ["<font size='15'>
서버가 업데이트 되었습니다. 업데이트 내용은 아래와 같습니다.<br/><br/>

1.무사복귀 보너스가 제대로 지급되지 않은 오류를 수정하였습니다. 보상차원으로 서버업데이트와 함께 10000자원을 투입하였습니다.<br/><br/>

2.유지비 명목으로 감소하는 자원량 산출방식이 변경되어 자원이 더 잘 축정되도록 변경하였습니다.<br/><br/>
-이전방식 : 매 계산틱당 위협도*2 (시간당 최대 -2400)<br/>
-개선방식 : 매 시간당 위협도*4 (시간당 최대 -400)<br/><br/>

3.조종사로 접속하는경우 강제로 전술통신망에 가입하고 해제할 수 없도록 수정하였습니다.<br/><br/>

4.분대태그 관련 경고문이 발생활 때, 화면 중앙 경고문과 채팅창 경고문이 동시에 발생하도록 수정하였습니다.<br/><br/>

5.인게임 서버규정탭에 무전망 사용지침이 추가되었습니다.<br/><br/>

6.분대태그를 무시하고 장비탑승이 가능한 조건을 5인분대 분대장으로 상향하였습니다.<br/>
-5인이상 분대장은 분대태그를 수정하지 않고 장비탑승이 가능합니다. 이 기능은 꼭 필요한 상황에서 임시로만 사용하시기 바라며, 지속적으로 분대유형을 무시한 장비 운용시 킥, 밴될 수 있습니다.<br/><br/>

7.마을과 무전탑, 공장을 점령하는경우 매 자원계산틱마다 증가하는 자원량을 증가시켰습니다.<br/><br/>

8.새로운 FOB건설에 필요한 비용을 2000으로 상향하였습니다.</font>
"]]];

player createDiaryRecord ["updates", ["Jeonlado_Liberation_0.957", format ["<font size='15'>
서버가 업데이트 되었습니다. 업데이트 내용은 아래와 같습니다.<br/><br/>

1.귀마개 볼륨을 설정하지 않고 귀마개를 착용하는 경우 안내문이 발생하도록 수정하였습니다.<br/><br/>

2.전술통신망 토글방식을 윈도우키 메뉴를 통해 토글할 수 있도록 변경하였습니다.<br/><br/>

3.지형 세부설정에서 매우 낮음을 설정해도 가장 가까운 거리의 수풀이 사라지지 않도록 수정하였습니다.<br/><br/>

4.샷건으로 무장한 적군이 일부 추가되었습니다.<br/><br/>

5.항공모함에서 스폰되는 EH302 모바일 리스폰헬기의 도색을 AAF군 도색으로 변경하였습니다.<br/><br/>

6.컨택트 DLC에 맞추어 건설목록이 대폭 개편되었습니다.<br/>
-경차량 탭에 무장형 MRAP을 다시 추가하였습니다.<br/>
-T-140이나 Xi'an같은 CSAT장비가 건설목록에 추가되었습니다.<br/>
-Contact DLC에서 추가된 장비들과 건축물들이 건설목록에 추가되었습니다.<br/>
-다양한 건설목록을 추가하고 분류별로 정렬하여 FOB를 건설하기 쉽도록 개선하였습니다.<br/><br/>

7.모든 장비가 자동적으로 Datalink의 모든 기능을 자동으로 활성화 하도록 수정하였습니다.<br/>
-Datalink는 Jets DLC와 함께 출시된 플랫폼 업데이트 내용입니다.<br/>
-Datalink의 구체적인 기능은 레이더 방사통제, 아군위치 송수신 및 감지된 적 정보 송수신 기능입니다.<br/>
-이제 방공장비들은 더 빠르게 주변 적기에 반응하고 교전을 시작하게 됩니다.<br/><br/>

8.분대태그 시스템이 강화되었습니다.<br/>
-[특수]분대가 아닌경우 무인기 접속이 자동으로 해제됩니다.<br/>
-조종사가 아닌 경우에 항공분대에 가입하는 경우 자동으로 탈퇴됩니다.<br/>
-조종사가 항공분대 외의 분대에 가입하는 경우에도 자동으로 탈퇴됩니다.<br/><br/>

9.지도상에 무인기의 이름과 무인기 조종사의 이름이 나오도록 수정하였습니다.</font>
"]]];

player createDiaryRecord ["updates", ["Jeonlado_Liberation_0.956", format ["<font size='15'>
서버가 업데이트 되었습니다. 업데이트 내용은 아래와 같습니다.<br/><br/>

1.서버 규정 확인 방법을 수정하였습니다.<br/>
-한눈에 보기 어려운 ORBAT 대신, 맵 좌측 상단에서 확인가능한 Diary메뉴를 통해 규정을 체계적이고 자세하게 기록하였습니다.<br/>
-서버 업데이트 내역또한 맵 메뉴를 통해 확인가능하도록 수정하였습니다.<br/>
-기타 잡다한 스크립트 설명을 '브리핑'메뉴로 통일하였습니다.<br/><br/>

2.서버 규정이 일부 수정되었습니다.<br/>
-장비 건설은 자유롭게 해도 되지만 자원으로 인한 분쟁이 일어나는 경우 우선권을 가진 분대를 명시하였습니다.<br/>
-모든 무인기 사용권한은 이제 특수분대에 있습니다. 특수분대 외에는 무인장비 사용을 엄금합니다. (항공분대 포함)<br/>
-분대장의 권한과 책임에 대한 항목이 추가되었습니다.<br/><br/>

3.무사복귀 보너스가 100으로 증가하였습니다.<br/>
-무사복귀 보너스는 여러 거점을 연속으로 점령할경우 중첩가능합니다.<br/>
-무사복귀 보너스는 기절상태로는 초기화되지 않으며, 재배치기능을 사용하거나 완전히 사망한 경우에만 초기화됩니다.<br/><br/>

4.미션맵을 알티스로 변경하였습니다.<br/>
<font size='20'>-말덴맵 이제 안엽니다.</font><br/><br/>

5.방치장비 삭제 스크립트를 개선하였습니다.<br/>
-이전 업데이트로 15분마다 삭제되던 것을 10분으로 단축하였습니다.<br/>
-500m내에 플레이어가 존재하는 장비는 타이머가 초기화됩니다.<br/><br/>

6.자원계산 로직이 일부 수정되었습니다. 이제 매 틱당 손실되는 자원량은 위협도*2로 계산됩니다. <br/>
-매 틱당 자원계산은 (점령지별 수입의 총합 - 위협도*2)로 계산됩니다. 자원계산 주기는 점령한 군사기지 수에 따라 빨라집니다.<br/><br/>

7.지휘무전망이 삭제되었습니다.</font>
"]]];