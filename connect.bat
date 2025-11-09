@echo off
echo ============================================
echo  サーバー (mc.re4lity.com) へ接続します
echo ============================================
echo 
echo  接続を開始します...
echo  (このウィンドウは、ゲーム中ずっと開いたままにしてください)
echo  (終了するときは Ctrl+C を押すか、ウィンドウを閉じてください)
echo 

cloudflared access tcp --hostname mc.re4lity.com --url localhost:20100

echo 接続が終了しました。
pause