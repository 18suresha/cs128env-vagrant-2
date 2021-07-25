CXX=clang++
CXX_FLAGS=-std=c++20 -Iincludes -lc++abi -stdlib=libc++ -g -fstandalone-debug -O0 -Wall -Wextra -Werror

exec: bin/exec
	$<

bin/exec: ./src/howdy_world.cc ./src/utilities.cc
	$(CXX) $(CXX_FLAGS) $^ -o $@

.DEFAULT_GOAL := exec
.PHONY: exec clean

clean:
	rm -f bin/*
