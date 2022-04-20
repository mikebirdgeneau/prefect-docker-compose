

env:
	python -m venv .venv && . .venv/bin/activate && python -m pip install --upgrade pip && python -m pip install -r requirements.txt

up:
	docker-compose --env-file server/.env -f server/docker-compose.yml up -d

down:
	docker-compose -f server/docker-compose.yml down

restart: down up

runagent:
	docker-compose -f agent/docker-compose.yml down && docker-compose -f agent/docker-compose.yml up -d

runclient:
	docker-compose -f client/docker-compose.yml down && docker-compose -f client/docker-compose.yml up -d

status:
	docker-compose -f server/docker-compose.yml ps

logs:
	docker-compose -f server/docker-compose.yml logs -f