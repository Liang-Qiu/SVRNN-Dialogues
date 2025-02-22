.PHONY: install simdial ubuntu mwoz style clean

install:
	pip install -r requirements.txt

simdial:
	python data/simdial/read_simdial.py

ubuntu:
	python data/ubuntu_dataset/src/dataset_generator.py --data=$(data_path)
	python data/ubuntu_dataset/src/dataset_separator.py --data=$(data_path)/#ubuntu.gz
	python data/ubuntu_dataset/src/sample_generator.py --train_data=$(data_path)/train-data.gz --dev_data=$(data_path)/dev-data.gz --test_data=$(data_path)/test-data.gz

mwoz:
	python process_mwoz.py

style:
	yapf -i -r --style google .

clean:
	find . -name '*.pyc' -exec rm -f {} +
	find . -name '*.pyo' -exec rm -f {} +
	find . -name '*~' -exec rm -f  {} +
	rm -rf build/
	rm -rf dist/
	rm -rf *.egg-info
	rm -rf docs/_build
	rm -rf .pytest_cache/