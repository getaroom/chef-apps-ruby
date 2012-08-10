name             "apps-ruby"
maintainer       "getaroom"
maintainer_email "devteam@roomvaluesteam.com"
license          "MIT"
description      "Configures Ruby for Apps"
long_description IO.read(File.join(File.dirname(__FILE__), "README.md"))
version          "1.0.0"

depends "apps"

supports "debian"
supports "ubuntu"

recipe "apps-ruby", "Configures Ruby for apps."
recipe "apps-ruby::ruby_version", "Generates a .ruby-version file."
