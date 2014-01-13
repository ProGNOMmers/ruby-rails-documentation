=begin
```sh
mkdir ~/ruby-rails-documentations
cd ~/ruby-rails-documentations

git clone https://github.com/mdesantis/sdoc -b ruby-rails-documentations

# Ruby documentation
curl -s http://ftp.ruby-lang.org/pub/ruby/ruby-2.0-stable.tar.bz2 | tar xvj
cd ruby*
export SDOC_FORCE_MAIN_PAGE=README
ruby -I ~/ruby-rails-documentations/sdoc/lib ~/ruby-rails-documentations/sdoc/bin/sdoc --all -o sdoc .
unset SDOC_FORCE_MAIN_PAGE
cd ..

# Rails documentation
git clone https://github.com/mdesantis/rails -b ruby-rails-documentations
cd rails
rake -I ~/ruby-rails-documentations/sdoc/lib rdoc
cd ..

# Merge
ruby -I ~/ruby-rails-documentations/sdoc/lib ~/ruby-rails-documentations/sdoc/bin/sdoc-merge \
  --title 'Ruby v2.0.0-p195, Rails v4.0.0-rc.1' \
  --op merged \
  --names 'Ruby,Rails' \
  ruby*/sdoc rails/doc/rdoc/
```
=end

require 'fileutils'
require 'shellwords'
require 'tmpdir'

class RubyRailsDocumentationsGenerator

  TMP_DIR_PREFIX = 'ruby-rails-documentations'

  attr_reader :output_dir, :sdoc_dir, :ruby_dir, :rails_dir, :ruby_version, :rails_version

  def initialize(output_dir, sdoc_dir, ruby_dir, rails_dir, ruby_version, rails_version)
    @output_dir, @sdoc_dir, @ruby_dir, @rails_dir, @ruby_version, @rails_version = \
      output_dir, sdoc_dir, ruby_dir, rails_dir, ruby_version, rails_version      
  end

  # cd ruby
  # SDOC_FORCE_MAIN_PAGE=README ruby -I ~/ruby-rails-documentations/sdoc/lib ~/ruby-rails-documentations/sdoc/bin/sdoc --all -o sdoc .
  def run
    Dir.mktmpdir(TMP_DIR_PREFIX) do |temp_dir|
      ruby_docs_dir = create_ruby_docs temp_dir

      rails_docs_dir = create_rails_docs temp_dir

      merged_dir = merge temp_dir, ruby_docs_dir, rails_docs_dir

      FileUtils.cp_r merged_dir, output_dir
    end
  end

  private

  # ruby -I ~/ruby-rails-documentations/sdoc/lib ~/ruby-rails-documentations/sdoc/bin/sdoc-merge \
  #   --title 'Ruby v2.0.0-p195, Rails v4.0.0-rc.1' \
  #   --op merged \
  #   --names 'Ruby,Rails' \
  #   ruby*/sdoc rails/doc/rdoc/
  def merge(temp_dir, ruby_docs_dir, rails_docs_dir)
    title      = "Ruby #{ruby_version}, Rails #{rails_version}"
    names      = 'Ruby,Rails'
    merged_dir = File.join temp_dir, 'merged'

    system %W( ruby -I  #{sdoc_lib_dir} #{sdoc_bin_sdoc_merge} --op #{merged_dir} --title #{title} --names #{names} #{ruby_docs_dir} #{rails_docs_dir} )

    merged_dir
  end

  # cd rails
  # rake -I ~/ruby-rails-documentations/sdoc/lib rdoc
  def create_rails_docs(temp_dir)
    rails_docs_dir = File.join temp_dir, 'rails-docs'

    env, options = {}, { chdir: rails_dir }
    system %W( rake -I #{sdoc_lib_dir} rdoc ), env, options

    FileUtils.mv File.join(rails_dir, 'doc', 'rdoc'), rails_docs_dir

    rails_docs_dir
  end

  def create_ruby_docs(temp_dir)
    ruby_docs_dir = File.join temp_dir, 'ruby-docs'

    env = { 'SDOC_FORCE_MAIN_PAGE' => 'README' }
    system %W( ruby -I #{sdoc_lib_dir} #{sdoc_bin_sdoc} --all -o #{ruby_docs_dir} #{ruby_dir} ),
           env

    ruby_docs_dir
  end

  def sdoc_bin_sdoc
    File.join sdoc_dir, 'bin', 'sdoc'
  end

  def sdoc_bin_sdoc_merge
    File.join sdoc_dir, 'bin', 'sdoc-merge'
  end

  def sdoc_lib_dir
    File.join sdoc_dir, 'lib'
  end

  def system(command, env = {}, options = {})
    case Kernel.system env, *command, options
    when false
      abort "The command #{pretty_system_arguments command, env, options} has failed. Aborting"
    when nil
      abort "The command #{pretty_system_arguments command, env, options} does not exist. Aborting"
    end
  end

  def pretty_system_arguments(command, env, options)
    env     = env.map{ |k, v| "#{k.shellescape}=#{v.shellescape}" }.join(' ')
    command = command.join(' ').shellescape
    options = options.empty? ? '' : options.to_s

    [env, command, options].reject(&:empty?).join(' ')
  end
end

output_dir    = File.join Dir.home, 'ruby-rails-documentations'
sdoc_dir      = File.join Dir.home, 'Sviluppo/sdoc'
ruby_dir      = File.join Dir.home, 'Sviluppo/ruby'
rails_dir     = File.join Dir.home, 'Sviluppo/rails'
ruby_version  = '2.1.0'
rails_version = '4.1.0.beta1'

FileUtils.rm_rf output_dir

RubyRailsDocumentationsGenerator.new(output_dir, sdoc_dir, ruby_dir, rails_dir, ruby_version, rails_version).run

puts output_dir