CHECKERS := yesno nyesno acmp dl-player
PLAYERS  := interactor-a-plus-b

test: $(CHECKERS) $(PLAYERS)

clean:
	-@rm -rvf out/

$(CHECKERS): % : checkers/%.cpp
	mkdir -p out
	g++ -I. -o out/$@ checkers/$@.cpp
	./test-checker.sh $@

$(PLAYERS): % : interactors/%.cpp
	mkdir -p out
	g++ -I. -o out/$@ interactors/$@.cpp -DINFILE='"input.txt"' -DOUTFILE='"result.txt"' -DLOGFILE='"log.txt"'
	./test-interactor.sh $@
