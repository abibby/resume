all: resume.pdf

resume.pdf: css/main.css hex.svg
	npx chrome-headless-render-pdf --url file:///home/adam/Documents/resume/index.html --pdf resume.pdf --include-background --no-margins

css/main.css: main.scss
	npx node-sass main.scss -o css

watch: css/main.css
	npx node-sass main.scss -o css --watch