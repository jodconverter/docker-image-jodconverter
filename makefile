build:
	docker build --build-arg BASE_VERSION=0.0.1 --target gui . -t ghcr.io/jodconverter/jodconverter:gui
	docker build --build-arg BASE_VERSION=0.0.1 --target rest . -t ghcr.io/eugenmayer/jodconverter:rest

start-gui: stop
	docker run --name jodconverter-spring -m 512m --rm -p 8080:8080 ghcr.io/jodconverter/jodconverter-example:gui

start-rest: stop
	docker run --name jodconverter-rest -m 512m --rm -p 8080:8080 ghcr.io/jodconverter/jodconverter-example:rest

stop:
	docker stop --name jodconverter-rest > /dev/null 2>&1 || true
	docker stop --name jodconverter-spring > /dev/null 2>&1 || true
