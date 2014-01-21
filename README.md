# [Ruby and Ruby on Rails merged documentations](http://mdesantis.github.io/ruby-rails-documentations/)

I :heart:'d RailsAPI: it included the Ruby and Ruby On Rails docs merged together.

But RailsAPI is no more online. So this project aims to provide the Ruby and Ruby on Rails merged documentations.

## Current releases

The documentations are available online [here](http://mdesantis.github.io/ruby-rails-documentations/). At the moment, the available documentations are the following:

<table>
  <tr>
    <th>Ruby</th>
    <th>Ruby on Rails</th>
    <th>Docs</th>
  </tr>
  <tr>
    <td>2.1.0</td>
    <td>4.1.0.beta1</td>
    <td><a href="http://mdesantis.github.io/ruby-rails-documentations/Ruby%20v2.1.0,%20Ruby%20On%20Rails%20v4.1.0.beta1/index.html">link</a></td>
  </tr>
  <tr>
    <td>2.1.0</td>
    <td>4.0.2</td>
    <td><a href="http://mdesantis.github.io/ruby-rails-documentations/Ruby%20v2.1.0,%20Ruby%20On%20Rails%20v4.0.2/index.html">link</a></td>
  </tr>
  <tr>
    <td>2.1.0</td>
    <td>3.2.16</td>
    <td><a href="http://mdesantis.github.io/ruby-rails-documentations/Ruby%20v2.1.0,%20Ruby%20On%20Rails%20v3.2.16/index.html">link</a></td>
  </tr>
  <tr>
    <td>2.1.0</td>
    <td>3.1.12</td>
    <td><a href="http://mdesantis.github.io/ruby-rails-documentations/Ruby%20v2.1.0,%20Ruby%20On%20Rails%20v3.1.12/index.html">link</a></td>
  </tr>
  <tr>
    <td>2.1.0</td>
    <td>3.0.20</td>
    <td><a href="http://mdesantis.github.io/ruby-rails-documentations/Ruby%20v2.1.0,%20Ruby%20On%20Rails%20v3.0.20/index.html">link</a></td>
  </tr>
  <tr>
    <td>2.0.0-p253</td>
    <td>4.1.0.beta1</td>
    <td><a href="http://mdesantis.github.io/ruby-rails-documentations/Ruby%20v2.0.0-p253,%20Ruby%20On%20Rails%20v4.1.0.beta1/index.html">link</a></td>
  </tr>
  <tr>
    <td>2.0.0-p253</td>
    <td>4.0.2</td>
    <td><a href="http://mdesantis.github.io/ruby-rails-documentations/Ruby%20v2.0.0-p253,%20Ruby%20On%20Rails%20v4.0.2/index.html">link</a></td>
  </tr>
  <tr>
    <td>2.0.0-p253</td>
    <td>3.2.16</td>
    <td><a href="http://mdesantis.github.io/ruby-rails-documentations/Ruby%20v2.0.0-p253,%20Ruby%20On%20Rails%20v3.2.16/index.html">link</a></td>
  </tr>
  <tr>
    <td>2.0.0-p253</td>
    <td>3.1.12</td>
    <td><a href="http://mdesantis.github.io/ruby-rails-documentations/Ruby%20v2.0.0-p253,%20Ruby%20On%20Rails%20v3.1.12/index.html">link</a></td>
  </tr>
  <tr>
    <td>2.0.0-p253</td>
    <td>3.0.20</td>
    <td><a href="http://mdesantis.github.io/ruby-rails-documentations/Ruby%20v2.0.0-p253,%20Ruby%20On%20Rails%20v3.0.20/index.html">link</a></td>
  </tr>
  <tr>
    <td>1.9.3-p484</td>
    <td>4.1.0.beta1</td>
    <td><a href="http://mdesantis.github.io/ruby-rails-documentations/Ruby%20v1.9.3-p484,%20Ruby%20On%20Rails%20v4.1.0.beta1/index.html">link</a></td>
  </tr>
  <tr>
    <td>1.9.3-p484</td>
    <td>4.0.2</td>
    <td><a href="http://mdesantis.github.io/ruby-rails-documentations/Ruby%20v1.9.3-p484,%20Ruby%20On%20Rails%20v4.0.2/index.html">link</a></td>
  </tr>
  <tr>
    <td>1.9.3-p484</td>
    <td>3.2.16</td>
    <td><a href="http://mdesantis.github.io/ruby-rails-documentations/Ruby%20v1.9.3-p484,%20Ruby%20On%20Rails%20v3.2.16/index.html">link</a></td>
  </tr>
  <tr>
    <td>1.9.3-p484</td>
    <td>3.1.12</td>
    <td><a href="http://mdesantis.github.io/ruby-rails-documentations/Ruby%20v1.9.3-p484,%20Ruby%20On%20Rails%20v3.1.12/index.html">link</a></td>
  </tr>
  <tr>
    <td>1.9.3-p484</td>
    <td>3.0.20</td>
    <td><a href="http://mdesantis.github.io/ruby-rails-documentations/Ruby%20v1.9.3-p484,%20Ruby%20On%20Rails%20v3.0.20/index.html">link</a></td>
  </tr>
</table>

New versions will be added as soon as a new Ruby or Ruby on Rails version will be released. If I forget to add them, just open an issue ;-)

## Local copy

If you want a local copy, just clone the gh-pages branch: `git clone git://github.com/mdesantis/ruby-rails-documentations.git -b gh-pages`

## Generating the docs

The docs are generated using the `sdoc` utility, while the merging is accomplished using `sdoc-merge`.

I used some custom versions of [sdoc](https://github.com/mdesantis/sdoc/tree/ruby-rails-documentations) and [Ruby on Rails](https://github.com/mdesantis/rails/tree/ruby-rails-documentations).

### Prerequisites

* ruby
* git
* a Ruby git clone: `git clone https://github.com/ruby/ruby`
* a Ruby on Rails git clone: `git clone https://github.com/rails/rails`
* the ruby-rails-documentations branch of my sdoc fork: `git clone https://github.com/mdesantis/sdoc -b ruby-rails-documentations`
* the clone of this repository: `git clone https://github.com/mdesantis/ruby-rails-documentations`

### Generation

* From a shell, cd into the project clone folder
* Run `ruby -Ilib bin/ruby-rails-documentations help`
* Follow the instructions

## Notes

* I use a Ruby fork in order to add

```
ChangeLog

NEWS

README
README.EXT
README.EXT.ja
README.ja
```

to 1.9.3-p484 `.document` file so to add these files to the documentation and set the Ruby docs main page to the README.

* I use a Ruby on Rails fork in order to enable the rdoc `--all` option which adds private methods to the documentation.
* I use my sdoc fork in order to add RDoc 4.1.0 compatibility and force the Ruby documentation main page (it would default to ChangeLog even using the RDoc `--main-page` option).

## TODO

* Clean up the scripts
* Better docs generation instructions
* Simplify the generation
* Gemify

## License

MIT (see [LICENSE](LICENSE))