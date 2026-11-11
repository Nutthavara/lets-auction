# Rails on Windows (WSL) gotchas

Last verified: 2026-11-11 (learned while setting the project up; re-check if tooling changes).

- **Use WSL, and keep the checkout in `~/` (WSL filesystem), not `/mnt/c/...`.** On `/mnt/c`
  git has `core.fileMode=false`, so scripts are committed as `100644`. Railway's Docker build
  then fails with `./bin/rails: Permission denied` (exit 126). Fix an existing repo with
  `git update-index --chmod=+x bin/*`. `/mnt/c` is also slow for `bundle install`.
- **`rbenv` must be on `PATH` in the shell**, or `gem install rails` silently uses the system
  Ruby and fails with `can't find header files for ruby`. Check `which ruby` shows
  `~/.rbenv/shims/ruby`. Add `eval "$(~/.rbenv/bin/rbenv init - bash)"` to `~/.bashrc`.
- **ruby-build needs a C toolchain** (`build-essential`, `libssl-dev`, `libyaml-dev`, ...) or
  the OpenSSL step fails with `No C compiler found`. The real error is in
  `/tmp/ruby-build.*.log`, not in the `BUILD FAILED` line.
- **`db:test:prepare` needs `db/schema.rb`.** A Rails app with no models has none until
  `bin/rails db:migrate` runs once; commit it, or CI aborts.
- **`bin/rails test:system` raises `LoadError` if `test/system/` is missing.** Keep the CI
  system-test job only while that directory exists.
- **WSL has its own `~/.ssh`.** A key generated on Windows is not visible there; copy it and
  `chmod 600` the private key, or `gh` will default the remote to SSH and push will be denied.
