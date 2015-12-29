.PHONY: test

test:
	cutest -r ./test/test_helper.rb test/**/*_test.rb
