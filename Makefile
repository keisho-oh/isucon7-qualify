run-server:
	touch web/log/tmp.log
	rm web/log/*.log
	touch web/log/access.log
	touch web/log/error.log
	touch db/log/tmp.log
	rm db/log/*.log
	docker-compose -f docker-compose-local.yml up -d --build
	# docker-compose -f docker-compose-local.yml up -d db
	# docker-compose -f docker-compose-local.yml up -d db
	# docker-compose -f docker-compose-local.yml up -d app
	# docker-compose -f docker-compose-local.yml up -d web

run-remote-server:
	docker-compose up -d

run-bench:
	docker-compose -f docker-compose-local.yml up bench

run-remote-bench:
	docker-compose -f docker-compose-bench.yml up bench

build:
	docker-compose -f docker-compose-local.yml build

down:
	docker-compose -f docker-compose-local.yml down
