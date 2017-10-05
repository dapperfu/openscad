
VENV = .venv

${VENV}:
	python3 -mvenv ${@}

.PHONY: pip
pip:
	pip install -U -r requirements.txt

.PHONY: bootstrap
bootstrap:
	sudo apt-get install openscad python3 python3-venv

.PHONY: clean
clean:
	rm -rf ${VENV}
