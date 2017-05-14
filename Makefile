.PHONY: test 

czy_dev_machine_ready:
	if [ ! -f /usr/bin/virtualenvwrapper.sh ]; then echo "Brakuje Ci virtualenvwrapper ";  exit 1; fi;

deps:
	pip install -r requirements.txt; \
	pip install -r test_requirements.txt

lint: 
	flake8 hello_world test

test:
	PYTHONPATH=. py.test  --verbose -s

test_cov:
	PYTHONPATH=. py.test  --verbose -s --cov=.

test_xunit:
	PYTHONPATH=. py.test -s --cov=. --junit-xml=test_results.xml
	
run: 
	python main.py

docker_build:
	docker build -t hello-world-printer-app-2 .

docker_run:docker_build
	docker run --name wsb-project -p 5000:5000 hello-world-printer-app-2:latest

USERNAME=baja

TAG= $(USERNAME)/hello-world-printer-app-2

docker_push:
	@docker login --username $(USERNAME) --password $(PASSWORD) ; \

	docker tag hello-world-printer-app-2 $(TAG); \

	docker push $(TAG); \

	docker logout;


