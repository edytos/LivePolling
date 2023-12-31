
[call target=*Sub_Opening]
[call target=*Sub_Setting]
[jump storage="escape/left.ks"]
[s]



; 오프닝 연출
; ------------------------------------------------------------------------------
*Sub_Opening

[layopt layer=message visible=false]
[layopt layer=1       visible=true ]
[mtext  layer=1 x=0 y=260 text=제공&emsp;위드플러스 width=960 align=center size=60 color=0xffffff in_effect=bounce out_sync=true time=1000]
; text 파라메타중에「&emsp;」가 있습니다만 이것은 스페이스를 의미하며 이 부분이 스페이스로 변환됩니다.

[return]



; 다양한 초기 설정을 행함
; ------------------------------------------------------------------------------
*Sub_Setting

[call target=*Sub_Position]
[call target=*Sub_Variable]
[call target=*Sub_Macro   ]
[call target=*Sub_Chara   ]
[call target=*Sub_Button  ]

[return]



; 메시지 윈도우 설정
; ------------------------------------------------------------------------------
*Sub_Position

[position layer="message0" frame="none" color="0x000000" opacity="200"]
[position layer="message0" width="750" height="220" left="25" top="395"]
[position layer="message0" margint="55" marginr="25" marginb="25" marginl="25"]

[position layer="message1" frame="none" color="0x000000" opacity="200"]
[position layer="message1" width="750" height="140" left="25" top="25"]
[position layer="message1" margint="25" marginr="25" marginb="25" marginl="25"]

;[ptext name="chara_name_area"  layer="message0" zindex="102" x="60" y="410" text="" color="0xffffff" size="40"  edge="0x000000"]
;[chara_config ptext="chara_name_area"]

[return]



; 변수를 정의
; ------------------------------------------------------------------------------
*Sub_Variable

/*
       탈출 게임용으로 정의하고 있는 변수 일람표

------------------------------------------------------------------------------
변수명                         종류      설명
--------------------------- ------- ----------------------------------------
f.select_item               문자열    선택중인 아이템명
f.current_scenario          문자열    현재 시나리오 파일명
f.is_open_chest_top         진위      옷장 위의 서랍을 열고 있습니까?
f.is_open_chest_bottom      진위      옷장 아래의 서랍을 열고 있습니까?
f.develops                  {}        각 방의 발전도를 정리한 것
f.dials                     {}        각 다이얼의 수치를 정리한 것
f.items                     {}        각 아이템의 소유수를 정리한 것
 f.develops['...']          수치      방 ['...']의 발전도
 f.dials['...']             수치      다이얼 ['...']의 숫자
 f.items['...']             수치      아이템 ['...'] 소지수
------------------------------------------------------------------------------
*/

[iscript]
f.select_item = 'empty'
f.current_scenario  = 'escape/_start.ks'
f.is_open_chest_top    = false
f.is_open_chest_bottom = false
f.develops = {}
 f.develops['escape/left.ks']  = 0
 f.develops['escape/right.ks'] = 0
 f.develops['escape/wall.ks']  = 0
 f.develops['escape/room.ks']  = 0
 f.develops['escape/chest.ks'] = 0
f.dials = {}
 f.dials['1'] = 0
 f.dials['2'] = 0
 f.dials['3'] = 0
 f.dials['4'] = 0
f.items = {}
 f.items['box']    = 0
 f.items['bomb']   = 0
 f.items['key']    = 0
 f.items['lpaper'] = 0
 f.items['rpaper'] = 0
[endscript]

[return]



; 매크로를 정의
; ------------------------------------------------------------------------------
*Sub_Macro

/*
       탈출 게임용으로 정의하고 있는 매크로 일람표

--------------------------------------------------------------------------
マクロ名(+命名の意図)       内容の簡単な説明
--------------------------  ----------------------------------------------
mc  (my clickable)          自分用にデザインを固定したクリッカブルタグ

sm  (show message)          メッセージレイヤー0番を表示する
hm  (hide message)          メッセージレイヤー0番を非表示にする
sm2 (show message 2)        メッセージレイヤー1番を表示する
hm2 (hide message 2)        メッセージレイヤー1番を非表示にする

sv  (set variable)          変数をセットする(マクロの中身としてはサブルーチンを呼ぶだけ)
scm (set clickable map)     クリッカブルマップをセットする(同上)
sb  (set background)        背景をセットする(同上)

use                         アイテムを使用する
get                         アイテムをゲットする

ERROR!!                     エラーメッセージを通知する
--------------------------------------------------------------------------
*/

[macro name=mc]
  [clickable * opacity=0 mouseopacity=40 border=1px:dashed:black color=pink]
[endmacro]

[macro name=sm]
  [cm]
  [layopt layer=message0 visible=true]
[endmacro]

[macro name=hm]
  [layopt layer=message0 visible=false]
[endmacro]

[macro name=sm2]
  ; もしフリーレイヤーに何か入っているなら、フリーレイヤーを非表示にせよ。という特殊な操作です。
  ; いま出ているクリッカブル等の情報をキープしながらメッセージレイヤー1番(アイテム説明が出るレイヤー)にメッセージを出す場合に必要な処理です。
  [eval cond="$('.layer_free').html() != ''" exp="$('.layer_free').hide(0)"]
  [layopt layer=message1 visible=true]
  [current layer=message1]
[endmacro]

[macro name=hm2]
  [layopt layer=message1 visible=false]
  [current layer=message0]
  ; もしフリーレイヤーに何か入っているなら、フリーレイヤーを表示せよ。という特殊な操作です。
  [eval cond="$('.layer_free').html() != ''" exp="$('.layer_free').show(0)"]
[endmacro]

; [sv] 変数をセットする。
[macro name=sv ]
  ; *Sub_Set_Variableラベルをコールする。storageは変数から参照する。
  [call storage=&f.current_scenario target=*Sub_Set_Variable]
[endmacro]

; [sb] 背景をセットする。
[macro name=sb ]
  [call storage=&f.current_scenario target=*Sub_Set_Background]
[endmacro]

; [scm] クリッカブルマップをセットする。
[macro name=scm]
  [call storage=&f.current_scenario target=*Sub_Set_Clickable_Map]
[endmacro]

; [use] 選択中のアイテムを使う。
[macro name=use]
  ; 変数の更新
  [eval exp="f.select_item = 'empty'"]
  ; 画面右に出ているアイテムボタン/強調背景ボタンを画面外に
  [anim name="&'fix'+mp.item" left="+=1000" time=0]
  [anim name="select"         left="+=1000" time=0]
  ; カーソルをデフォルトに
  [cursor storage=default]
[endmacro]

; [get] アイテムを入手する。
[macro name=get]
  ; 画面からアイテム画像を解放する。nameにはたとえば「layerbomb」「fixbomb」などが渡される。
  [free name="&'layer'+mp.item" layer=0]
  [anim name="&'fix'+mp.item" left="-=1000" time=0]
  ; 変数の更新
  [eval exp="f.items[mp.item] = 1"]
[endmacro]

[macro name=ERROR!!]
  [iscript]
  alert('【エラー】調べられないはずの箇所を調べています。')
  [endscript]
[endmacro]

[return]



; キャラを定義する
; ------------------------------------------------------------------------------
*Sub_Chara

;[chara_new  name="master"  jname="마스터" storage="escape/c_normal.png"]
;[chara_face name="master" face="ase"        storage="escape/c_ase.png"]
;[chara_face name="master" face="happy"      storage="escape/c_happy.png"]
[chara_new  name="master"  jname="마스터" storage="chara/2/normal.png"]
[chara_face name="master" face="ase"        storage="chara/2/doki.png"]
[chara_face name="master" face="happy"      storage="chara/2/happy.png"]



; ボタンを設置する
; ------------------------------------------------------------------------------
*Sub_Button

; 前景レイヤー1番にボタン部分の背景を出しておく。
[image layer=1 x=800 y=0   storage=escape/button_bg.png]
[image layer=1 x=840 y=640 storage=escape/button_select.png name=select]

; アイテムを使うためのボタンを表示する。すべて固定ボタン。画面外に出しておき、アイテムを入手したら画面内に引っ張ってくる。
[button fix=true name=fixbox    graphic=escape/item_box.png    x=1840 y=30  storage=escape/subroutine.ks target=*Sub_Select auto_next=false exp="tf.select = 'box'   ; tf.top =  30"]
[button fix=true name=fixbomb   graphic=escape/item_bomb.png   x=1840 y=120 storage=escape/subroutine.ks target=*Sub_Select auto_next=false exp="tf.select = 'bomb'  ; tf.top = 120"]
[button fix=true name=fixkey    graphic=escape/item_key.png    x=1840 y=210 storage=escape/subroutine.ks target=*Sub_Select auto_next=false exp="tf.select = 'key'   ; tf.top = 210"]
[button fix=true name=fixlpaper graphic=escape/item_lpaper.png x=1840 y=300 storage=escape/subroutine.ks target=*Sub_Select auto_next=false exp="tf.select = 'lpaper'; tf.top = 300"]
[button fix=true name=fixrpaper graphic=escape/item_rpaper.png x=1840 y=390 storage=escape/subroutine.ks target=*Sub_Select auto_next=false exp="tf.select = 'rpaper'; tf.top = 390"]

; アイテムの説明を見るためのボタンを表示する。すべて固定ボタン。画面外に出しておき、アイテムを入手したら画面内に引っ張ってくる。
[button fix=true name=fixbox    graphic=escape/button_question.png x=1915 y=30  storage=escape/subroutine.ks target=*Sub_Check_Box     auto_next=false]
[button fix=true name=fixbomb   graphic=escape/button_question.png x=1915 y=120 storage=escape/subroutine.ks target=*Sub_Check_Bomb    auto_next=false]
[button fix=true name=fixkey    graphic=escape/button_question.png x=1915 y=210 storage=escape/subroutine.ks target=*Sub_Check_Key     auto_next=false]
[button fix=true name=fixlpaper graphic=escape/button_question.png x=1915 y=300 storage=escape/subroutine.ks target=*Sub_Check_LPaper  auto_next=false]
[button fix=true name=fixrpaper graphic=escape/button_question.png x=1915 y=390 storage=escape/subroutine.ks target=*Sub_Check_RPaper  auto_next=false]

[return]
