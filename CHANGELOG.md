# Change log

## master (unreleased)

### New Features

* Add `dependabot` support for Docker base image
* Update base image and tests to ruby 3.0.2
* Add `ruby-3.1` to CI
* Send all messages in queue instantly
  (Fix [#24](https://github.com/ONLYOFFICE-QA/redis-to-telegram/issues/24))
* Add basic spec suite with 100% coverage
* Check in CI that 100% code is covered with tests

### Fixes

* Fix `markdownlint` failure because of old `nodejs` in CI

### Changes

* Remove `ruby-2.7` fro CI

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
