.PHONY: test

test: 
	cabal test --show-details=streaming --test-option=--color=always

run:
	cabal run