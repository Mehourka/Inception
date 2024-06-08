#! /usr/bin/env bash

ENV_PATH=./srcs/.env

function raise_error {
  local ERR_MSG=${1}
  echo -e "\033[31m[Error] check_env.sh: " "${ERR_MSG:-"Unexpected error"}\033[00m"
  exit 1
}

function load_dotenv {
  if [[ ! -f $ENV_PATH ]]; then
    raise_error ".env file not found."
  fi
  source $ENV_PATH
}

function check_wordpress_users {

  if [[ ${WP_SUPER_USER,,} =~ .*admin.* ]]; then
    raise_error "WordPress Super Username should not contain 'admin' in any form"
  fi

  if [[ ${WP_SUPER_USER,,} = ${WP_USER,,} ]]; then
    raise_error "WordPress User and SuperUser should have different user names"
  fi

  if [[ ${WP_SUPER_EMAIL,,} = ${WP_EMAIL,,} ]]; then
    raise_error "WordPress User and SuperUser should have different emails"
  fi
}

load_dotenv
check_wordpress_users


exit 0
