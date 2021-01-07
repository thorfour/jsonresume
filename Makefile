RESUME_THEME=even
RESUME_THEME_PKG=jsonresume-theme-$(RESUME_THEME)

docker/build:
	docker build -t jsonresume .

pdf: docker/build
	docker run -v ${PWD}:/data jsonresume /bin/bash -c "npm install $(RESUME_THEME_PKG); resume export resume.pdf --theme $(RESUME_THEME)"

clean:
	rm -rf node_modules
	rm -f package*
