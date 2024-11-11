.PHONY: nuxt-dev
nuxt-dev:
	@echo "Starting Nuxt.js in development mode..."
	docker tag say-hello-dev


.PHONY: nuxt-prod
nuxt-prod:
	@echo "Starting Nuxt.js in production mode..."
	docker context use local
	docker build -t say-hello-prod .
	docker context use dohello
	docker run -d -p 80:3000 say-hello-prod