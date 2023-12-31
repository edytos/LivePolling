============================================================
	ルールトランジションプラグイン v1.0.0
============================================================

このプラグインは、ルール画像を用いた背景のトランジション、
吉里吉里でいうところの「ユニバーサルトランジション」を
ティラノスクリプトで実行可能にするプラグインです。

2018 © STRIKEWORKS All Rights Reserved.


----------------------------------------
	利用規約
----------------------------------------

このプラグイン及びこれに付属する素材は、
ティラノスクリプトまたはティラノビルダーで制作する作品でのみ使用可能です。

このプラグインを作品で使用するためには
ティラノプレミアムへのご入会が必要です。

http://tyrano.jp/premium

〇個人利用の場合（商用利用含む）
ブロンズプラン以上（¥320 /月）へご加入いただくことで、利用できます。

〇法人利用の場合
ゴールドプラン（¥5,000 /月）へご加入いただくことで、利用できます。

一度入手していただければ、プレミアムメンバーを退会したあとも
作品への利用を続けることができます。

ただし、プレミアムメンバーを退会すると
アップデート情報やバグの修正版などがダウンロードできなくなります。
リリース時まではメンバーに入っていただくことを推奨いたします。


----------------------------------------
	禁止事項
----------------------------------------

このプラグインに関する次の行為を禁止いたします。

・プラグインの再配布またはコードの公開
（プラグインを含んだブラウザゲームを配信するのはもちろんOKです）
・プラグインを参照し新しいプラグインとして公開する行為
・他者への譲渡や提供など


----------------------------------------
	開発者・連絡先
----------------------------------------

ティラノスクリプト公式
Mail: http://shikemokumk@gmail.com
Twitter: https://twitter.com/tyranobase


----------------------------------------
	免責事項
----------------------------------------

本プラグインを使用したことによって生じた損害・損失に対して
制作者は一切責任を負いません。


----------------------------------------
	導入方法
----------------------------------------

(1)zipファイルを展開して出てきた「bg_rule」フォルダを、
ティラノスクリプトのプロジェクトフォルダの
「data/others/plugin」フォルダの中にコピーします。
（「init.ks」の場所が「data/others/plugin/bg_rule/init.ks」となるように。）

(2)zipファイルを展開して出てきた「bg_rule_image」フォルダを、
ティラノスクリプトのプロジェクトフォルダの
「data/image」フォルダの中にコピーします。
ルール画像はここに入れるようにしてください。
（たとえばルール画像「001.png」の場所が「data/image/bg_rule_image/001.png」となるように。）

(3)シナリオファイル「first.ks」を開き、
適当な位置に次のタグを書きます（リファレンスは後述）

[plugin name=bg_rule]

以上の手順によって、プラグインの導入が完了します。
プラグインの導入によって[bg_rule]タグが使えるようになります。
詳細は以下のタグリファレンスをご参照ください。


----------------------------------------
	タグリファレンス
----------------------------------------

●プラグインの読み込み

〇基本例

    [plugin name=bg_rule]

〇パラメータ一覧

    shortcut :【任意】テキストをスキップしているときに[bg_rule]タグを通過するときに
                      演出を省略するかどうか。trueかfalseで指定する。デフォルトはtrue。

〇応用例

    [plugin name=bg_rule shortcut=false]


●背景の切り替え [bg_rule]

〇基本例

    [bg_rule storage=XXX.jpg rule=XXX.png]

〇パラメータ一覧

    storage  :【必須】背景画像ファイル。data/bgimageフォルダに配置。colorを指定する場合のみ省略してよい。
    rule     :【必須】ルール画像ファイル。data/image/bg_ruleフォルダに配置。
    color    :【任意】背景色。storageに代えて色を指定することができる。
    time     :【任意】切り替え時間(ミリ秒)。
    clickskip:【任意】切り替え中にクリックすることで演出をスキップできるようにするか。
                      trueかfalseで指定する。デフォルトはfalse。
    wait     :【任意】切り替え完了まで次のタグへの進行を待機するか。
                      trueかfalseで指定する。デフォルトはtrue。
    reverse  :【任意】ルール画像の白黒を逆向きに処理するかどうか。
                      trueかfalseで指定する。デフォルトはfalse。

〇応用例

    [bg_rule color=0xFF0000 rule=001.png]
    [bg_rule storage=rouka.jpg rule=002.png wait=false]
    [bg_rule storage=rouka.jpg rule=003.png canskip=true]


----------------------------------------
	リリースノート
----------------------------------------

1.0.0(2018/06/15)
    公開


----------------------------------------
	ライブラリ
----------------------------------------

このプラグインは次のライブラリを使用しています。

・forked: forked from: Universal Transition - http://jsdo.it/nosemint/9OWJ
　Licensed under the MIT license - http://opensource.org/licenses/MIT