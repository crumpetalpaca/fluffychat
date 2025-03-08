#!/usr/bin/env bash
cd android
echo $KEY_STORE | base64 --decode --ignore-garbage > key.jks
echo "storePassword=${KEY_PASS}" >> key.properties
echo "keyPassword=${KEY_PASS}" >> key.properties
echo "keyAlias=crumpet" >> key.properties
echo "storeFile=../key.jks" >> key.properties
ls | grep key
bundle install
bundle update fastlane
bundle exec fastlane set_build_code_internal
cd ..
