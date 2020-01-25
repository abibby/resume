all: main.css

main.css: main.scss
	node-sass main.scss > main.css