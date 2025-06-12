NAVFILES         := $(wildcard nav/*.yml)
CURRENT_BRANCH   := $(shell git rev-parse --abbrev-ref HEAD)
ALLOWED_BRANCHES := main

serve: mkdocs.yml
	@mkdocs serve

deploy: mkdocs.yml
ifeq ($(filter $(CURRENT_BRANCH),$(ALLOWED_BRANCHES)),)
	@echo "错误：仅允许在 main 分支部署！当前分支：$(CURRENT_BRANCH)"
else
	@git diff --quiet || (echo "错误：存在未提交的更改！" && exit 1)
	@mkdocs gh-deploy
endif

mkdocs.yml: $(NAVFILES)
	@scripts/merge

clean:
	rm mkdocs.yml

.PHONY: clean serve deploy
