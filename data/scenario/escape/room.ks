
; == room.ks ===============================================

; 小部屋。

; ==========================================================



[eval exp="f.current_scenario = TYRANO.kag.stat.current_scenario"]
[sb]
[scm]
[s]



;-------------------------------------------------------
*Sub_Set_Background

[cm]
[freeimage layer=0 page=back]
[image layer=0 page=back x=0 y=0 storage=escape/room.png]
[image layer=0 page=back x=0 y=0 storage=escape/room_bomb.png   name=layerbomb  cond="f.develops[f.current_scenario] == 0 || f.develops[f.current_scenario] == 1"]
[image layer=0 page=back x=0 y=0 storage=escape/room_black.png  name=layerblack cond="f.develops[f.current_scenario] >= 3                          "]
[image layer=0 page=back x=0 y=0 storage=escape/room_box.png    name=layerbox   cond="f.develops[f.current_scenario] == 1 || f.develops[f.current_scenario] == 2"]
[trans layer=0 time=400 method=puffIn]
[wt]
[return]

;-------------------------------------------------------
*Sub_Set_Clickable_Map

[mc 1 くぼみ x=278 y=548 width=179 height=81  target=*Pos_1 cond="f.develops[f.current_scenario] == 0                          "]
[mc 2 手榴弾 x=327 y=6   width=116 height=117 target=*Pos_2 cond="f.develops[f.current_scenario] == 0 || f.develops[f.current_scenario] == 1"]
[mc 3 木の箱 x=277 y=434 width=180 height=192 target=*Pos_3 cond="f.develops[f.current_scenario] == 1 || f.develops[f.current_scenario] == 2"]
[mc 4 爆発跡 x=191 y=533 width=360 height=101 target=*Pos_4 cond="f.develops[f.current_scenario] >= 3                          "]
[button storage=escape/left.ks graphic=escape/button_down.png x=30  y=550]
[return]

;-------------------------------------------------------
*Pos_1
; 発展度０
[if exp="f.develops[f.current_scenario] == 0"]
  ; 箱を選択中ではない
  [if exp="f.select_item != 'box'"]
    [sm]
    뭔가 바닥에 파인 흔적이 있다.[l][er]
    네모난 것이 딱 맞을 것 같은데….[l][er]
    [hm]
  ; 箱を選択中ではない
  [else]
    [use item=box]
    [image layer=0 x=0 y=0 storage=escape/room_box.png name=layerbox]
    [eval exp="f.develops[f.current_scenario] = 1"]
  [endif]
; 発展度１～
[elsif exp="f.develops[f.current_scenario] >= 1"]
  [ERROR!!]
[endif]
[scm][s]

;-------------------------------------------------------
*Pos_2
; 発展度０
[if exp="f.develops[f.current_scenario] == 0"]
  [sm]
  천장에 수류탄이 매달려 있다.[l][er]
  손만 닿으면 얻을 수 있을 것 같다.[l][er]
  [hm]
; 発展度１
[elsif exp="f.develops[f.current_scenario] == 1"]
  [get item=bomb]
  [eval exp="f.develops[f.current_scenario] = 2"]
; 発展度２～
[elsif exp="f.develops[f.current_scenario] >= 2"]
  [sm]
  천장에 수류탄이 매달려 있었지만 지금은 아무것도 없다.[l][er]
  [hm]
[endif]
[scm][s]

;-------------------------------------------------------
*Pos_3
; 発展度０
[if exp="f.develops[f.current_scenario] == 0"]
  [ERROR!!]
; 発展度１～２
[elsif exp="f.develops[f.current_scenario] <= 2"]
  ; 手榴弾を選択中ではない
  [if exp="f.select_item != 'bomb'"]
    [sm]
    수류탄을 잡기 위해 설치한 나무상자.[l][er]
    던지거나 걷어 차는 정도로는 부서지지 않을 것 같다.[l][er]
    [hm]
  ; 手榴弾を選択中
  [else]
    [sm]
    수류탄으로 나무상자를 부숴보자.[l][er]
    ……。[l][er]
    [mask time=500]
    [use item=bomb]
    [free name=layerbox layer=0]
    [image layer=0 x=0 y=0 storage=escape/room_black.png]
    [cursor storage=default]
    [eval exp="f.develops[f.current_scenario] = 3"]
    [mask_off time=500]
    나무상자를 부수었다.[l][er]
    [hm]
   [endif]
; 発展度３～
[elsif exp="f.develops[f.current_scenario] >= 3"]
  [ERROR!!]
[endif]
[scm][s]

;-------------------------------------------------------
*Pos_4
; 発展度～２
[if exp="f.develops[f.current_scenario] <= 2"]
  [ERROR!!]
; 発展度３
[elsif exp="f.develops[f.current_scenario] == 3"]
  [sm]
  여기서 수류탄을 터뜨렸다.[l][er]
  어? 뭔가 있다...[l][er]
  작은 열쇠를 손에 넣었다.[l][er]
  [get item=key]
  [eval exp="f.develops[f.current_scenario] = 4"]
  [hm]
; 発展度４～
[elsif exp="f.develops[f.current_scenario] >= 4"]
  [sm]
  더 이상 아무것도 없다.[l][er]
  [hm]
[endif]
[scm][s]

;-------------------------------------------------------
*Pos_5
[eval exp="f.chest_top_is_open = false"]
[anim name=chest_top left=960 time=0]
[scm][s]