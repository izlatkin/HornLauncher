all: coverage

build:
	rm -f *.gcno
	gcc -pthread -O0 --coverage main.c -o test-coverage

lcov: build
	rm -f *.gcda coverage.info
	./test-coverage
	#./test-coverage "SecondParam for complete branch testing"
	lcov --capture --rc lcov_branch_coverage=1 --directory . --config-file ../../lcovrc --output coverage.info

genhtml: lcov
	rm -rf /tmp/coverage/
	genhtml --branch-coverage --output ./generated-coverage/ coverage.info

coverage: genhtml

clean:
	rm -rf main.gc* main.o coverage.info test-coverage generated-coverage
