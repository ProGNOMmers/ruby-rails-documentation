# [Ruby and Ruby on Rails merged documentations](http://mdesantis.github.io/ruby-rails-documentations/)

I :heart:'d RailsAPI: it included the Ruby and Ruby On Rails docs merged together.

But RailsAPI is no more online. This project provides a replacement.

## Current releases

The documentations are available online [here](http://mdesantis.github.io/ruby-rails-documentations/). At the moment, the available documentations are the following:

<table>
  <tr>
    <th>Ruby</th>
    <th>Ruby on Rails</th>
    <th>Docs</th>
  </tr>
  <tr>
    <td>1.9.3-p545</td>
    <td>3.0.20</td>
    <td><a href="http://mdesantis.github.io/ruby-rails-documentations/Ruby v1.9.3-p545, Ruby on Rails v3.0.20/index.html">link</a></td>
  </tr>
  <tr>
    <td>1.9.3-p545</td>
    <td>3.1.12</td>
    <td><a href="http://mdesantis.github.io/ruby-rails-documentations/Ruby v1.9.3-p545, Ruby on Rails v3.1.12/index.html">link</a></td>
  </tr>
  <tr>
    <td>1.9.3-p545</td>
    <td>3.2.17</td>
    <td><a href="http://mdesantis.github.io/ruby-rails-documentations/Ruby v1.9.3-p545, Ruby on Rails v3.2.17/index.html">link</a></td>
  </tr>
  <tr>
    <td>1.9.3-p545</td>
    <td>4.0.4</td>
    <td><a href="http://mdesantis.github.io/ruby-rails-documentations/Ruby v1.9.3-p545, Ruby on Rails v4.0.4/index.html">link</a></td>
  </tr>
  <tr>
    <td>1.9.3-p545</td>
    <td>4.1.0</td>
    <td><a href="http://mdesantis.github.io/ruby-rails-documentations/Ruby v1.9.3-p545, Ruby on Rails v4.1.0/index.html">link</a></td>
  </tr>
  <tr>
    <td>2.0.0-p451</td>
    <td>3.0.20</td>
    <td><a href="http://mdesantis.github.io/ruby-rails-documentations/Ruby v2.0.0-p451, Ruby on Rails v3.0.20/index.html">link</a></td>
  </tr>
  <tr>
    <td>2.0.0-p451</td>
    <td>3.1.12</td>
    <td><a href="http://mdesantis.github.io/ruby-rails-documentations/Ruby v2.0.0-p451, Ruby on Rails v3.1.12/index.html">link</a></td>
  </tr>
  <tr>
    <td>2.0.0-p451</td>
    <td>3.2.17</td>
    <td><a href="http://mdesantis.github.io/ruby-rails-documentations/Ruby v2.0.0-p451, Ruby on Rails v3.2.17/index.html">link</a></td>
  </tr>
  <tr>
    <td>2.0.0-p451</td>
    <td>4.0.4</td>
    <td><a href="http://mdesantis.github.io/ruby-rails-documentations/Ruby v2.0.0-p451, Ruby on Rails v4.0.4/index.html">link</a></td>
  </tr>
  <tr>
    <td>2.0.0-p451</td>
    <td>4.1.0</td>
    <td><a href="http://mdesantis.github.io/ruby-rails-documentations/Ruby v2.0.0-p451, Ruby on Rails v4.1.0/index.html">link</a></td>
  </tr>
  <tr>
    <td>2.1.1</td>
    <td>3.0.20</td>
    <td><a href="http://mdesantis.github.io/ruby-rails-documentations/Ruby v2.1.1, Ruby on Rails v3.0.20/index.html">link</a></td>
  </tr>
  <tr>
    <td>2.1.1</td>
    <td>3.1.12</td>
    <td><a href="http://mdesantis.github.io/ruby-rails-documentations/Ruby v2.1.1, Ruby on Rails v3.1.12/index.html">link</a></td>
  </tr>
  <tr>
    <td>2.1.1</td>
    <td>3.2.17</td>
    <td><a href="http://mdesantis.github.io/ruby-rails-documentations/Ruby v2.1.1, Ruby on Rails v3.2.17/index.html">link</a></td>
  </tr>
  <tr>
    <td>2.1.1</td>
    <td>4.0.4</td>
    <td><a href="http://mdesantis.github.io/ruby-rails-documentations/Ruby v2.1.1, Ruby on Rails v4.0.4/index.html">link</a></td>
  </tr>
  <tr>
    <td>2.1.1</td>
    <td>4.1.0</td>
    <td><a href="http://mdesantis.github.io/ruby-rails-documentations/Ruby v2.1.1, Ruby on Rails v4.1.0/index.html">link</a></td>
  </tr>
</table>

New versions will be added as soon as a new Ruby or Ruby on Rails version will be released. If I forget to add them, just open an issue ;-)

## Local copy

If you want a local copy, you can download the [gh-pages archive <sub> ~ 200 MB</sub>](https://github.com/mdesantis/ruby-rails-documentations/archive/gh-pages.zip) or clone the gh-pages branch using `git clone git://github.com/mdesantis/ruby-rails-documentations.git -b gh-pages`.

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

* Using a terminal, `cd` into the project clone folder
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

to [1.9.3-p545 `.document` file](https://github.com/ruby/ruby/blob/v1_9_3_545/.document) so to add these files to the documentation and set the Ruby docs main page to the README (actually it doesn't work, see [Known Issues](#known-issues))

* I use a Ruby on Rails fork in order to:
* * port the Rails 4.x docs generation, which includes sdoc support, to 3.x, which doesn't
* * enable the rdoc `--all` option which adds private methods to the documentation
* I use my sdoc fork in order to add RDoc 4.1.0 compatibility and force the Ruby documentation main page (it would default to ChangeLog even using the RDoc `--main-page` option)

## Known Issues

* Ruby documentation has `ChangeLog` as default page, while it should be `README`.

## TODO

* Reference the commits of the customizations
* Clean up the scripts
* Better docs generation instructions
* Simplify the generation
* Gemify

## License

MIT (see [LICENSE](LICENSE))