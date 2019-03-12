NAME:=gametemplate
IDENTITY:=GameTemplate

$(NAME).love: $(wildcard src/*)
	cd src && zip -9 -r ../$(NAME).love *

.PHONY: clean test screenshots
clean:
	rm -rf screenshots
	rm game.love
test: game.love
	@love game.love
screenshots:
	mv ~/.local/share/love/$(IDENTITY)/screenshots .
