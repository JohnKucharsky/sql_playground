dev:
	fresh
dev-db:
	docker compose up db -d
prod:
	docker compose up --build
tidy:
	go mod tidy
migrate:
	cd migrations; goose postgres postgres://postgres:pass@localhost:5432/data up
migrate-down:
	cd migrations; goose postgres postgres://postgres:pass@localhost:5432/data down