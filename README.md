# musclers

# 環境

- Docker
- makeコマンド(新しく入れるならGNU makeがおすすめ)

# このプロジェクトを始めるために

Windowsではコマンドがうまく動かない場合があるので、適宜書き換えるかコマンドを追加してください

1. 必要な環境を全てインストールする
2. GoogleDriveからダウンロードしたenvironmentsディレクトリをプロジェクトのルートに設置する
3. `$ make setenv`
4. `$ make init`
5. `$ make run`

# Dockerの完全再起動

    $ make reinit

# モックサーバー

    # Run
    $ make mock/run

    # Down
    $ make mock/down
