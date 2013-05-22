# Latest Ruby and Rails documentation

I :heart: the [Ruby and Rails merged documentations on RailsAPI](http://railsapi.com/doc/rails-v3.2.6_ruby-v1.9.2/), but their Ruby and Rails versions are often outdated; I'll try to provide the latest documentation on the [Github pages of this project](http://prognommers.github.io/ruby-rails-documentation/).

## Documentation

### Ruby / Rails versions

At the moment, the documentation is about Ruby 2.0.0-p195 and Rails 4.0.0-rc1. It will be updated after a Ruby or a Rails release as soon as possible (if I forget to do it, just open an issue and I will provide to update it).

### Location

The documentation is available online [here](http://prognommers.github.io/ruby-rails-documentation/). If you want a local copy, just clone the gh-pages branch (size: ~ 80 MB): `git clone git://github.com/ProGNOMmers/ruby-rails-documentation.git -b gh-pages`

### Differences between the official documentations and this one

This one sets the rdoc `--all` option, which by default documents private methods too. I like the documentation to contain as many informations as possible.

### Generating the docs

I used some customized versions of [sdoc](https://github.com/ProGNOMmers/sdoc/tree/ruby-rails-documentation) and [Rails](https://github.com/ProGNOMmers/rails/tree/ruby-rails-documentation).

If you want to generate the documentation by yourself you can follow the procedure below (prerequisites: curl, tar, git, ruby 2.0):

```sh
mkdir ~/ruby-rails-documentation
cd ~/ruby-rails-documentation

git clone https://github.com/ProGNOMmers/sdoc -b ruby-rails-documentation

# Ruby documentation
curl -s http://ftp.ruby-lang.org/pub/ruby/ruby-2.0.0-p195.tar.bz2 | tar xvj
cd ruby*
export SDOC_FORCE_MAIN_PAGE=README
ruby -I ~/ruby-rails-documentation/sdoc/lib ~/ruby-rails-documentation/sdoc/bin/sdoc --all -o sdoc .
unset SDOC_FORCE_MAIN_PAGE
cd ..

# Rails documentation
git clone https://github.com/ProGNOMmers/rails -b ruby-rails-documentation
cd rails
rake -I ~/ruby-rails-documentation/sdoc/lib rdoc
cd ..

# Merge
ruby -I ~/ruby-rails-documentation/sdoc/lib ~/ruby-rails-documentation/sdoc/bin/sdoc-merge \
  --title 'Ruby v2.0.0-p195, Rails v4.0.0-rc.1' \
  --op merged \
  --names 'Ruby,Rails' \
  ruby*/sdoc rails/doc/rdoc/
```

If you didn't get any issue you should see the documentation opening `~/ruby-rails-documentation/merged/index.html` in any browser.

## TODO

* GitHub links don't work. Investigate (probably it's an sdoc issue)
* Automatize via script the docs generation