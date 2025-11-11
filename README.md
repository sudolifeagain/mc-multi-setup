# mc-multi-setup

## このリポジトリの説明

このリポジトリでは、Minecraft(Java版のみ対応)のマルチプレイに参加するためのスクリプトを管理しています。（re4lityの友人向け）

## 参加方法(for Windows)

0. **認証情報の設定**

   Discordサーバーの「サーバー接続方法」チャンネルの一番最初のメッセージに記載されているGoogleフォームから、使用しているGoogleアカウントのメールアドレスを提出してください。<br>
   その後、次のメッセージにある[ダウンロード用リンク](https://github.com/sudolifeagain/mc-multi-setup/archive/refs/heads/main.zip)からファイルをダウンロードしてください。

1. **Minecraftクライアントの準備**

   MODを利用するためにForgeをインストールします。<br>
   詳しい手順は[こちらの解説サイト](https://tech-teacher.jp/kids-blog/minecraft-mod-introduction/)を参考にしてください。

   - 今回使用するForgeのバージョンは **1.20.1-47.4.0** です。<br>
   - 下記リンクからインストーラー（forge-1.20.1-47.4.0-installer.jar）をダウンロードしてください。<br>
     [Forge 1.20.1-47.4.0 ダウンロード](https://adfoc.us/serve/sitelinks/?id=271228&url=https://maven.minecraftforge.net/net/minecraftforge/forge/1.20.1-47.4.0/forge-1.20.1-47.4.0-installer.jar)<br>

   ダウンロードしたjarファイルをダブルクリックし、「Install Client」を選択してインストールしてください。

2. **MODのインストール**

   Createをサーバーに導入したので、接続する際は各自MODのインストールをお願いします🙏<br>
   - 手動で管理している方はこちら → [Create (CurseForge)](https://www.curseforge.com/minecraft/mc-mods/create)<br>
   - CurseForgeのランチャーを使っている方はUI上でいい感じにインストールしてください。

   クライアント側のみで動作するものであれば、好きなものを入れてもらって大丈夫です。
   


3. **cloudflared のセットアップ**

   まず、`setup.bat` を右クリックして「管理者として実行」してください。<br>
   この際、セキュリティの警告が表示されますが、そのまま実行してください。（ソースコードはこのリポジトリで公開されています）<br>
   cloudflared がインストールされていない場合、自動でインストールされます。<br>
   何かしらのキーを押さないと進行しないので放置しないように注意です。

4. **サーバーへの接続**

   `connect.bat` をダブルクリックして実行してください。<br>
   コマンドプロンプトが開き、「Connecting to server (mc.re4lity.com)」と表示されます。<br>
   このウィンドウはMinecraftをプレイしている間、開いたままにしてください。<br>

5. **Minecraft のマルチプレイで接続**

   Minecraft を起動し、マルチプレイの「サーバーを追加」から
   サーバーアドレスに `127.0.0.1:20100` を入力して接続してください。<br>
   バージョンは1.20.1になっているかどうかを確認してください！

6. **認証方法**

   接続を開始すると、ブラウザが立ち上がります。<br>
   0.で登録したGoogleアカウントでサインインしてください。<br>
   サインインが成功すると、このような画面が表示されるので、Approveを選択してください。<br>
   「Congraturation!」の画面が表示されたら認証は完了です。<br>
   接続を開始すると、ブラウザが立ち上がります。
   0.で登録したGoogleアカウントでサインインしてください。
   サインインが成功すると、このような画面が表示されるので、Approveを選択してください。

   ![Cloudflare Access認証画面の例](https://github.com/sudolifeagain/mc-multi-setup/blob/main/photo.png)

   「Congraturation!」の画面が表示されたら認証は完了です。

7. **終了方法**

   プレイを終えるときは、`connect.bat` のウィンドウを閉じるか、Ctrl+C で終了してください。

---

**注意:**
- `setup.bat` は最初の1回だけ実行すればOKです。
- cloudflared のインストールや実行にはインターネット接続が必要です。

## For Ubuntu

read codes, and think!
its not that hard, you can do it :p