run_local_db:
	docker-compose -f docker-compose-local.yml up -d --build db

run_local_server:
	touch web/log/tmp.log
	rm web/log/*.log
	docker-compose -f docker-compose-local.yml up -d --build app
	docker-compose -f docker-compose-local.yml up -d --build web

run_server:
	docker-compose up -d

run_local_bench:
	docker-compose -f docker-compose-local.yml up bench

run_bench:
	docker-compose -f docker-compose-bench.yml up bench

local_down:
	docker-compose -f docker-compose-local.yml down
