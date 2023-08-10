
; == _end.ks ===============================================

; 방 왼쪽

; ==========================================================



[eval exp="f.current_scenario = TYRANO.kag.stat.current_scenario"]
[sb]
[scm]
[s]

;-------------------------------------------------------
*Sub_Set_Background

[cm]
[freeimage layer=0 page=back]
[image layer=0 page=back x=0 y=0 storage=escape/left.png]
[image layer=0 page=back x=0 y=0 storage=escape/left_box.png name=layerbox cond="f.develops['escape/left.ks'] == 0"]
;[chara_show    page=back name=master left=170 time=0]
[chara_show  page=back name=master  time="0" width="400" left="170"  top="40"]
[trans layer=0 time=400 method=fadeIn]
[wt]
[return]

;-------------------------------------------------------
*Sub_Set_Clickable_Map

[mc 1 ドア           x=55  y=255 width=114 height=381 target=*Pos_1]
[mc 2 ゲームマスター x=189 y=40   width=400 height=600 target=*Pos_2]
[return]

;-------------------------------------------------------
*Pos_1
[sm]
[chara_mod name=master face=ase]
#master
아니!! 그냥 나가려고? 무시하는 거야!![l][er]
#
[hm]
[scm][s]

;-------------------------------------------------------
*Pos_2
; 手榴弾を選択中ではない
[if exp="f.select_item != 'bomb'"]
  [chara_mod name=master face=happy]
  [sm]
  #master
  게임 클리어 축하해.[l][er]
  너는 내가 예상했던 대로 좋은 두뇌의 소유자군![l][er]
  좋아, 여기서 내보내 줄게.[l][er]
  #
  이게 전부일까?... 또다른 엔딩이 있을지도...[l][er]
  [hm]
  [jump target=*End]
; 手榴弾を選択中
[else]
  [chara_mod name=master face=happy]
  [sm]
  #master
  게임 클리어 축하---[l][er]
  #master:ase
  !!????　, 왜 그것을 가지고 있는 거야!!!![l][er]
  그건 이미 사용했을 텐데……!![l][er]
  기다려, 기다려 줘……!!![l][er]
  [use item=bomb]
  #
  수류탄의 핀을 뽑았다.[l][er]
  [freeimage layer=0 time=1000]
  #master
  으아아아아아악!![l][er]
  #
  치팅이 아니면 어떻게 이런 엔딩을 찾았지?[l][er]
  [hm]
  [jump target=*End]
[endif]
[scm][s]

;-------------------------------------------------------
*End

; 메뉴버튼을 숨김
[hidemenubutton]
; 메시지의 삭제 및 프리 레이어의 해방
; (프리레이어 ＝ 버튼과 HTML 등이 삽입되어있는 레이어)
[cm]
; fix레이어 해방
[clearfix]
; 합성 레이어 해방
[free_layermode time="0"]
; 필터 해방
[free_filter]
; 레이어 해방
[freeimage layer="base"]
[freeimage layer="0"]
[freeimage layer="1"]
[freeimage layer="2"]
[freeimage layer="base" page="back"]
[freeimage layer="0"    page="back"]
[freeimage layer="1"    page="back"]
[freeimage layer="2"    page="back"]
; 메시지 윈도우 비표시
[layopt layer="message0" visible="false"]
[layopt layer="message1" visible="false"]

[mtext  layer=0 x=0 y=260 text=Thank&ensp;you&ensp;for&ensp;playing! width=960 align=center size=60 color=white in_effect=bounce]
; text 파라미터 중에「&ensp;」가 있는데, 이것은 반각 스페이스의 의미. 이 부분은 반각 스페이스로 변환됨.
[wait time=500]
[jump storage=first.ks]