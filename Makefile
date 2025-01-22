clean:
	rm -rf dist

build-ttf: clean
	npm run build -- ttf::Radiosevka

rm-unhinted:
	rm -rf dist/Radiosevka/TTF-Unhinted

nerd: build-ttf
	docker run --rm -v ./dist/Radiosevka/TTF:/in:Z -v ./dist/Radiosevka/TTFNerd:/out:Z nerdfonts/patcher

install: nerd
	cp -vr dist/Radiosevka/TTFNerd/* ~/Library/Fonts
	cp -vr dist/Radiosevka/TTF/* ~/Library/Fonts
