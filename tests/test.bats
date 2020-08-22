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

# General tests:
@test "general: Invoking newsetup with no args returns status 1" {
  run bash -c "${NEWSETUP}"
  assert_failure
}

# --help, -h tests
@test "--help, -h: prints usage and returns status 0" {
  run bash -c "${NEWSETUP} -h"
  assert_success
  run bash -c "${NEWSETUP} --help"
  assert_success
}

@test "--help, -h: prints usage, descriptions, options & examples sections" {
  run bash -c "${NEWSETUP} -h"
  assert_output --partial "usage:"
  assert_output --partial "descriptions:"
  assert_output --partial "options:"
  assert_output --partial "examples:"
}

# --quiet, -q tests
@test "--quiet, -q: turns off all output" {
  run bash -c "${NEWSETUP} -h -q"
  refute_output
  run bash -c "${NEWSETUP} --quiet -h" # switch -q to begining
  refute_output
  run bash -c "${NEWSETUP} -n test --dry-run --quiet"
  refute_output
  run bash -c "${NEWSETUP} -q -n test --dry-run" # switch -q to begining
  refute_output
  run bash -c "${NEWSETUP} -k rsa --dry-run -q"
  refute_output
  run bash -c "${NEWSETUP} --quiet -k rsa --dry-run" # switch -q to begining
  refute_output
  run bash -c "${NEWSETUP} -k rsa --bits 1024 -n test --dry-run --quiet"
  refute_output
  run bash -c "${NEWSETUP} -q -k rsa --bits 1024 -n test --dry-run" # switch -q to begining
  refute_output
}

# --verbose, -v tests
@test "--verbose, -v: Turns on verbosity" {
  run bash -c "${NEWSETUP} -n test -v --dry-run"
  assert_success
}

# --dry-run tests
@test "--dry-run: Only tests what would be changed" {
  # setup temporary .ssh dir for testing
  local ssh_dir="$(temp_make)"

  # dry run hostname check
  local original_hostname=$(hostname)
  local new_hostname="cool-host"
  run bash -c "${NEWSETUP} -n $new_hostname --dry-run"
  run hostname
  refute_output "$new_hostname"
  assert_output "$original_hostname"

  # dry run ssh keygen test
  assert_dir_exist "${ssh_dir}"
  run ls "${ssh_dir}"
  refute_output
  run bash -c "${NEWSETUP} -k rsa --bits 1024 --dry-run"
  run ls "${ssh_dir}"
  refute_output
  
  # Cleanup
  temp_del "${ssh_dir}"
  assert_dir_not_exist "${ssh_dir}"
}

