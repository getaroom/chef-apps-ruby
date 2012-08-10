name "standalone"
description "Tests for Ruby"

run_list(
  "recipe[users::sysadmins]",
  "recipe[apps]",
  "recipe[apps-ruby]",
)

default_attributes({
  "minitest" => {
    "tests" => "apps-ruby/*_test.rb",
  },
})
