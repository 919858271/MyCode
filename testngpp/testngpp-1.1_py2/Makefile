BUILD_TESTNGPP_DIR = ../build_testngpp
BUILD_TESTNGPPST_DIR = ../build_testngppst
BUILD_TESTS_DIR    = ../build_tests

.PHONY : all clean clean_testngpp clean_testngppst clean_tests


all : 
	@echo "do nothing"

clean_testngpp :
	@$(shell cd $(BUILD_TESTNGPP_DIR) && make clean) >/dev/null

clean_testngppst :
	@$(shell cd $(BUILD_TESTNGPPST_DIR) && make clean) >/dev/null

clean_tests :
	@$(shell cd $(BUILD_TESTS_DIR) && make clean) >/dev/null

clean : clean_testngpp clean_testngppst clean_tests
