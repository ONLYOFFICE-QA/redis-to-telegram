# Change log

## master (unreleased)

### New Features

* Move application to `ruby-3.3`
* Add `dependabot` support for Docker base image
* Send all messages in queue instantly
  (Fix [#24](https://github.com/ONLYOFFICE-QA/redis-to-telegram/issues/24))
* Add basic spec suite with 100% coverage
* Check in CI that 100% code is covered with tests
* Add `yamllint` check in CI

### Fixes

* Fix `markdownlint` failure because of old `nodejs` in CI
* Fix config read after some refactoring

### Changes

* Check `dependabot` at 8:00 Moscow time daily
* Fix `rubocop-1.28.1` code issues
* Have only one stable version of ruby in CI and next

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
