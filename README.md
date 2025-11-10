# mc-multi-setup

## このリポジトリの説明

このリポジトリでは、Minecraft(Java版のみ対応)のマルチプレイに参加するためのスクリプトを管理しています。（re4lityの友人向け）

## 参加方法(for Windows)

0. **認証情報の設定**

   Discordサーバーの「サーバー接続方法」チャンネルの一番最初のメッセージに記載されているGoogleフォームから、使用しているGoogleアカウントのメールアドレスを提出してください。
   その後、次のメッセージにある[ダウンロード用リンク](https://github.com/sudolifeagain/mc-multi-setup/archive/refs/heads/main.zip)からファイルをダウンロードしてください。

1. **Minecraftクライアントの準備**

   MODを利用するためにForgeをインストールします。
   詳しい手順は[こちらの解説サイト](https://tech-teacher.jp/kids-blog/minecraft-mod-introduction/)を参考にしてください。

   - 今回使用するForgeのバージョンは **1.20.1-47.4.0** です。
   - 下記リンクからインストーラー（forge-1.20.1-47.4.0-installer.jar）をダウンロードしてください。
     [Forge 1.20.1-47.4.0 ダウンロード](https://adfoc.us/serve/sitelinks/?id=271228&url=https://maven.minecraftforge.net/net/minecraftforge/forge/1.20.1-47.4.0/forge-1.20.1-47.4.0-installer.jar)

   ダウンロードしたjarファイルをダブルクリックし、「Install Client」を選択してインストールしてください。

2. **cloudflared のセットアップ**

   まず、`setup.bat` を右クリックして「管理者として実行」してください。
   この際、セキュリティの警告が表示されますが、そのまま実行してください。（ソースコードはこのリポジトリで公開されています）
   cloudflared がインストールされていない場合、自動でインストールされます。
   何かしらのキーを押さないと進行しないので放置しないように注意です。

3. **サーバーへの接続**

   `connect.bat` をダブルクリックして実行してください。
   コマンドプロンプトが開き、「Connecting to server (mc.re4lity.com)」と表示されます。
   このウィンドウはMinecraftをプレイしている間、開いたままにしてください。

4. **Minecraft のマルチプレイで接続**

   Minecraft を起動し、マルチプレイの「サーバーを追加」から
   サーバーアドレスに `127.0.0.1:20100` を入力して接続してください。
   バージョンは1.20.1になっているかどうかを確認してください！

5. **認証方法**

   接続を開始すると、ブラウザが立ち上がります。
   0.で登録したGoogleアカウントでサインインしてください。
   サインインが成功すると、このような画面が表示されるので、Approveを選択してください。
   「Congraturation!」の画面が表示されたら認証は完了です。

6. **終了方法**

   プレイを終えるときは、`connect.bat` のウィンドウを閉じるか、Ctrl+C で終了してください。

---

**注意:**
- `setup.bat` は最初の1回だけ実行すればOKです。
- cloudflared のインストールや実行にはインターネット接続が必要です。

## For Ubuntu

read codes, and think!
its not that hard, you can do it :p