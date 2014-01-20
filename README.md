# [Ruby and Ruby on Rails merged documentations](http://mdesantis.github.io/ruby-rails-documentations/)

I :heart:'d RailsAPI: it included the Ruby and Ruby On Rails docs merged together.

But RailsAPI is no more online. So this project aims to provide the Ruby and Ruby on Rails merged documentations.

## Ruby / Rails versions

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
    <td>2.0.0-p195</td>
    <td>4.0.0.rc1</td>
    <td><a href="http://mdesantis.github.io/ruby-rails-documentations/Ruby%20v2.0.0-p195,%20Ruby%20On%20Rails%20v4.0.0.rc1/index.html">link</a></td>
  </tr>
</table>

New versions will be added as soon as a new Ruby or Ruby on Rails version will be released. If I forget to add them, just open an issue ;-)

## Local copy

If you want a local copy, just clone the gh-pages branch: `git clone git://github.com/mdesantis/ruby-rails-documentations.git -b gh-pages`

## Differences between the official documentations and this one

This one has the rdoc `--all` option setting enabled, which documents private methods too. I like the documentation to contain as many informations as possible.

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

## TODO

* Explain why I modified sdoc
* Clean up the scripts
* Better docs generation instructions
* Simplify the generation
* Gemify

## License

MIT (see [LICENSE](LICENSE))