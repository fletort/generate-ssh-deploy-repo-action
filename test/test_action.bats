#!/usr/bin/env bats

setup() {
    load 'test_helper/bats-assert/load'
    load 'test_helper/bats-file/load'
}

@test "ssh private key as secret is defined" {
  run gh secret list --repo ${PUBLISHING_REPO_ORG}/${PUBLISHING_REPO_NAME} --json name --jq '.[].name'
  assert_line --partial 'PUBLISHING_KEY'
}

#@test "Deployment key is defined" {
#  run gh repo deploy-key list --repo ${PUBLISHED_REPO_ORG}/${PUBLISHED_REPO_NAME} --json title --jq '.[].title'
#  assert_line --partial '${PUBLISHED_REPO_ORG}/${PUBLISHED_REPO_NAME}'
#}

@test "Deployment is done" {
  assert_file_exist ./${PUBLISHED_REPO_NAME}/${TEST_UUID_FILE}
  content=$(cat ./${PUBLISHED_REPO_NAME}/${TEST_UUID_FILE})
  assert_equal $content ${WAITED_UUID}
}