NAVFILES := $(wildcard nav/*.yml)

serve: mkdocs.yml
	@mkdocs serve

deploy: mkdocs.yml
	@git add .
	@git commit -m 'Just update'
	@git pull
	@git push origin main
	@mkdocs gh-deploy

mkdocs.yml: $(NAVFILES)
	@scripts/merge

clean:
	rm mkdocs.yml

.PHONY: clean serve deploy
