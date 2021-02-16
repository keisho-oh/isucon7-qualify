ISUCON7 予選問題

# ローカル
```
docker-compose -f docker-compose-local.yml build
make run-db
make run-server
make run-bench
```
あとは `webapp` 以下をチューニングする

## alpでリクエストごとのメトリクスをみる
参考:
- https://nishinatoshiharu.com/install-alp-to-nginx/
- https://thinkit.co.jp/article/9617
```
docker-compose -f docker-compose-local.yml exec web bash
$ alp -r -f /var/log/nginx/access.log # maxの降順 
$ alp --sum -r -f /var/log/nginx/access.log # sumの降順
$ alp --avg -r -f /var/log/nginx/access.log # avgの降順
$ alp --sum -r -f /var/log/nginx/access.log --aggregates='/icons/.＊' # /icons/.* をまとめる 
```

## slow-queryを見る
参考: https://masayuki14.hatenablog.com/entry/20120704/1341360260
```
docker-compose -f docker-compose-local.yml exec db bash
$ pt-query-digest /var/log/mysql/mysql-slow.sql
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
- [x] slow-queryの見方を確認
- [ ] しょぼいバグ, index, N+1とかの定番的な問題を潰す
- [ ] redisを使う
- [ ] 複数台構成を試す
