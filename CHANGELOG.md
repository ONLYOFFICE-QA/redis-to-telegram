# Change log

## master (unreleased)

### New Features

* Add `dependabot` support for Docker base image
* Update base image and tests to ruby 3.0.2

## 1.0.0 (2020-12-24)

### New features

* Use `alpine` as base image
* Use `bundle config` to not install extra gems
* Add `markdownlint` check to CI
* Add `rubocop` check to CI
* Add `dependabot` config
* Add `rubocop-performance` and `rubocop-rspec` support

### Fixes

* Do not call `bash` in Dockerfile CMD

### Changes

* Use GitHub Actions instead of TravisCI
* Use `onlyofficeqa/sinatra-post-to-redis` image instead of building from source
* Merge two `bundle` layer in `Dockerfile` into single one
