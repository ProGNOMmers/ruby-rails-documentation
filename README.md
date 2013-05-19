# Updated Ruby and Rails documentation

I like very much [RailsAPI Ruby and Rails merged documentation](http://railsapi.com/doc/rails-v3.2.6_ruby-v1.9.2/), but the Ruby and Rails documentations hosted on RailsAPI are often outdated; I'll try to provide an updated RailsAPI-like Ruby/Rails merged documentation on the Github pages of this project.

## Documentation

### Ruby / Rails versions

At the moment, the documentation is relative to Ruby 2.0.0-p195 and Rails 4.0.0-rc1 .

### Location

You can find the documentation here: http://prognommers.github.io/ruby-rails-documentation/

### Differences between the official documentations and this one

This one sets the rdoc `--all` option, which by default documents private methods too. I like the documentation to contain as many informations as possible.

### Generating the docs

I used some customized versions of [sdoc](https://github.com/ProGNOMmers/sdoc/tree/ruby-rails-documentation) and [Rails](https://github.com/ProGNOMmers/rails/tree/ruby-rails-documentation).

If you want to generate the documentation by yourself you have to execute the following procedure (prerequisites: curl; tar; git; ruby 2.0):

```sh
mkdir ~/ruby-rails-documentation
cd ~/ruby-rails-documentation

git clone https://github.com/ProGNOMmers/sdoc -b ruby-rails-documentation

# Ruby documentation
curl -O http://ftp.ruby-lang.org/pub/ruby/ruby-2.0.0-p195.tar.bz2 /tmp/ruby-source-archive.tar.bz2
tar xvjf /tmp/ruby-source-archive.tar.bz2
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
  --title "Ruby v2.0.0-p195, Rails v4.0.0-rc.1" \
  --op merged \
  --names "Ruby,Rails" \
  ruby*/sdoc rails/doc/rdoc/
# The documentation will be created inside the newly created 
# ~/ruby-rails-documentation/merged/ folder
```