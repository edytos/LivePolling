[_tb_system_call storage=system/escape.ks]

[cm  ]
[tb_start_tyrano_code]
[chara_config talk_focus="brightness" talk_anim="down"]
[_tb_end_tyrano_code]

[bg  time="1000"  method="fadeIn"  storage="rouka.jpg"  cross="true"  ]
[tb_show_message_window  ]
[chara_show  name="조은애"  time="1000"  wait="true"  storage="chara/4/joeunae.png"  width="552"  height="630"  left="0"  top="20"  reflect="false"  ]
[tb_start_text mode=1 ]
#조은애
위드플러스의 e-게임러닝에서는 콘텐츠 사이에 방탈출 게임도 추가가 가능해요.[p]
함께 보실까요?[p]
[_tb_end_text]

[tb_start_tyrano_code]
[chara_config talk_focus="brightness" talk_anim="none"]
[_tb_end_tyrano_code]

[chara_show  name="이광표"  time="1000"  wait="true"  storage="chara/5/leegwangpyo.png"  width="552"  height="697"  left="0"  top="37"  reflect="false"  ]
[tb_start_text mode=1 ]
#이광표
네. 좋습니다![p]
교육적인 스토리텔링에 '방탈출'같은 게임요소를 섞으면 보다 흥미롭겠네요![p]
[_tb_end_text]

[chara_hide  name="이광표"  time="1000"  wait="true"  pos_mode="true"  ]
[tb_start_text mode=1 ]
#조은애
그럼 시작하겠습니다![p]
당신의 두뇌를 믿습니다. 포기하지 마시고 꼭 탈출하시길...![p]
#
[_tb_end_text]

[tb_hide_message_window  ]
[chara_hide_all  time="1000"  wait="true"  ]
[tb_start_tyrano_code]
[chara_config talk_focus="none" talk_anim="none"]
[bg_rule  time="1000"  clickskip="false"  wait="true"  storage="black.png"  rule="011.png"  ]
[_tb_end_tyrano_code]

[jump  storage="escape/start.ks"  ]
[s  ]
