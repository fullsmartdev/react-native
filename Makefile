install:
	@bundle install
	@npm i -g gh-deploy
	@gem install jill
	@pip install -r requirements.txt
sort:
	sorted-mkdn README.md > README_SORTED.md
	mv README_SORTED README.md
	yarn toc
docs:
	@rm -rf docs
	@mkdir docs
	@cp *.md docs/
	@cp README.md docs/index.md
	@cp extra.css docs/
	@cp icon.svg docs/
	@cp CNAME docs/

publish: docs
	@mkdocs gh-deploy --clean
	@rm -rf docs

serve: docs
	@mkdocs serve

check:
	@bundle exec ruby dedup.rb && bundle exec ruby validate.rb

stars:
	@sh starify.sh

.PHONY: docs publish serve check stars install


