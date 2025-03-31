setup:
	python3 -m venv env
	. env/bin/activate && pip install -r requirements.txt

clean:
	rm -rf env
	find . -type d -name __pycache__ -exec rm -rf {} +

test:
	. env/bin/activate && pytest

run:
	. env/bin/activate && flask run --host=0.0.0.0
