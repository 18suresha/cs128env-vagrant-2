CXX=clang++
CXX_FLAGS=-std=c++20 -lc++abi -stdlib=libc++ -g -fstandalone-debug -O0 -Wall -Wextra -Werror -Iincludes/

exec: bin/exec
	$<

bin/exec: ./src/HowdyWorld.cc
	$(CXX) $(CXXFLAGS) $^ -o $@

.DEFAULT_GOAL := exec
.PHONY: exec clean

clean:
	rm -f bin/*
