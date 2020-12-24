# Change log

## master (unreleased)

### New features

* Use `alpine` as base image
* Use `bundle config` to not install extra gems
* Add `markdownlint` check to CI
* Add `rubocop` check to CI
* Add `dependabot` config

### Fixes

* Do not call `bash` in Dockerfile CMD

### Changes

* Use GitHub Actions instead of TravisCI
* Use `onlyofficeqa/sinatra-post-to-redis` image instead of building from source
* Merge two `bundle` layer in `Dockerfile` into single one
