CP := cp -v
BASEDIR := ${HOME}
UPDDIR = .update
TARGETS = $(shell git ls-files --format '.update/%(path)' | egrep -v '.gitignore|Makefile')

.PHONY: update clean apply exctract

update: $(TARGETS)
	@echo "Updated"

.update/%: $(BASEDIR)/%
	@mkdir -pv $(shell dirname $@)
	@$(CP) $< $@

apply: update
	@find .update/ -maxdepth 1 -exec $(CP) -r {} -t . \;

extract:
	@find . -maxdepth 1 \
		! -name . -and \
		! -name Makefile -and \
		! -name .gitignore -and \
		! -name .git -and \
		! -name .update \
		-exec $(CP) -r {} -t ${HOME} \;

clean:
	rm -fr $(UPDDIR)
