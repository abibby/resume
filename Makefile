all: resume.pdf

resume.pdf: css/main.css hex.svg index.html
	npx chrome-headless-render-pdf \
		--url file:///home/adam/Documents/resume/index.html \
		--pdf resume.pdf \
		--include-background \
		--no-margins \
		--paper-width 8.5in \
		--paper-height 11in \
		--page-ranges '1-2'

cover-letter.pdf: css/main.css hex.svg index.html
	npx chrome-headless-render-pdf \
		--url file:///home/adam/Documents/resume/index.html \
		--pdf cover-letter.pdf \
		--include-background \
		--no-margins \
		--paper-width 8.5in \
		--paper-height 11in \
		--page-ranges '3-3'

css/main.css: main.scss
	npx node-sass main.scss -o css

watch: css/main.css
	npx node-sass main.scss -o css --watch