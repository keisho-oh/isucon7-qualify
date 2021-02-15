ISUCON7 予選問題

# ローカル
```
docker-compose -f docker-compose-local.yml build
make run_local_db
make run_local_server
make run_local_bench
```
あとは `webapp` 以下をチューニングする

## alpでリクエストごとのメトリクスをみる
参考: https://nishinatoshiharu.com/install-alp-to-nginx/
```
docker-compose -f docker-compose-local.yml exec web bash
$ alp -r -f /var/log/nginx/access.log # maxの降順
$ alp --sum -r -f /var/log/nginx/access.log # sumの降順
$ alp --sum -r -f /var/log/nginx/access.log --aggregates='/icons/.＊' # /icons/.* をまとめる 
```

# サーバに対してベンチマークを投げる
git, dockerの設定は出来てると仮定する
サーバに入ってbench以外のサービスを立ち上げる
```
docker-compose build
docker-compose up
```

`docker-compose-bench.yml` の `command` のIPを上のサーバのものに書き換えて実行する

# todo
- [x] alpでアクセスログ解析をする方法を確認
- [ ] slow-queryの見方を確認
- [ ] しょぼいバグ, index, N+1とかの定番的な問題を潰す
- [ ] redisを使う
