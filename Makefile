all: css/main.css

css/main.css: main.scss
	node-sass main.scss -o css

watch: css/main.css
	npx node-sass main.scss -o css --watch