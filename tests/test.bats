#!/usr/bin/env bats

#-------------------------------------------------------------------------------
# Load helpers
#-------------------------------------------------------------------------------
load '../libs/bats-support/load'
load '../libs/bats-assert/load'
load '../libs/bats-file/load'

#-------------------------------------------------------------------------------
# Globals
#-------------------------------------------------------------------------------
NEWSETUP="${BATS_TEST_DIRNAME}/../newsetup"

#-------------------------------------------------------------------------------
# Tests
#-------------------------------------------------------------------------------
@test "Invoking newsetup without any argument returns with exit status 1" {
  run bash -c "${NEWSETUP}"
  assert_failure
}

@test "Invoking newsetup with -h flag returns usage menu and exit status 0" {
  run bash -c "${NEWSETUP} -h"
  assert_success
}
