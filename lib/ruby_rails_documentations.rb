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

class RubyRailsDocumentations

  TMP_DIR_PREFIX     = 'ruby-rails-documentations'
  RUBY_VERSION_REGEX = /\A(\d)\.(\d)\.(\d)(-p(\d+))?\z/

  attr_reader :output_dir, :sdoc_dir, :ruby_dir, :rails_dir, :ruby_version, :rails_version

  def initialize(output_dir, sdoc_dir, ruby_dir, rails_dir)
    @output_dir, @sdoc_dir, @ruby_dir, @rails_dir = output_dir, sdoc_dir, ruby_dir, rails_dir
  end

  def generate(ruby_versions, rails_versions)
    FileUtils.mkdir_p output_dir

    if ruby_versions.is_a? Array
      ruby_versions.each do |ruby_version|
        generate ruby_version, rails_versions
      end
      return nil
    end

    if rails_versions.is_a? Array
      rails_versions.each do |rails_version|
        generate ruby_versions, rails_version
      end
      return nil
    end

    @ruby_version, @rails_version = ruby_versions, rails_versions

    Dir.mktmpdir(TMP_DIR_PREFIX) do |temp_dir|
      merged_dir = merge temp_dir, create_ruby_docs(temp_dir), create_rails_docs(temp_dir)

      FileUtils.cp_r merged_dir, version_output_dir
    end

    nil
  end

  private

  # ruby -I ~/ruby-rails-documentations/sdoc/lib ~/ruby-rails-documentations/sdoc/bin/sdoc-merge \
  #   --title 'Ruby v2.0.0-p195, Rails v4.0.0-rc.1' \
  #   --op merged \
  #   --names 'Ruby,Rails' \
  #   ruby*/sdoc rails/doc/rdoc/
  def merge(temp_dir, ruby_docs_dir, rails_docs_dir)
    title = "Ruby #{ruby_version}, Rails #{rails_version}"
    names = 'Ruby,Rails'
    dir   = File.join temp_dir, 'merged'

    system %W( ruby -I  #{sdoc_lib_dir} #{sdoc_bin_sdoc_merge} --op #{dir} --title #{title} --names #{names} #{ruby_docs_dir} #{rails_docs_dir} )

    dir
  end

  def version_output_dir
    File.join output_dir, "Ruby v#{ruby_version}, Ruby on Rails v#{rails_version}"
  end

  # cd rails
  # rake -I ~/ruby-rails-documentations/sdoc/lib rdoc
  def create_rails_docs(temp_dir)
    dir = File.join temp_dir, 'rails-docs'

    if rails_git_checkout
      env, options = {}, { chdir: rails_dir }
      system %W( git checkout #{rails_git_version} ), env, options
    end

    env, options = {}, { chdir: rails_dir }
    system %W( rake -I #{sdoc_lib_dir} rdoc ), env, options

    FileUtils.mv File.join(rails_dir, 'doc', 'rdoc'), dir

    dir
  end

  # cd ruby
  # SDOC_FORCE_MAIN_PAGE=README ruby -I ~/ruby-rails-documentations/sdoc/lib ~/ruby-rails-documentations/sdoc/bin/sdoc --github --all -o sdoc .
  def create_ruby_docs(temp_dir)
    dir = File.join temp_dir, 'ruby-docs'

    if ruby_git_checkout
      env, options = {}, { chdir: ruby_dir }
      system %W( git checkout #{ruby_git_version} ), env, options
    end

    env = { 'SDOC_FORCE_MAIN_PAGE' => 'README' }
    system %W( ruby -I #{sdoc_lib_dir} #{sdoc_bin_sdoc} --github --all -o #{dir} #{ruby_dir} ),
           env

    dir
  end

  def rails_git_version
    "v#{rails_version}"
  end

  def ruby_git_version
    if ruby_version =~ RUBY_VERSION_REGEX
      major, minor, tiny, _, patch = ruby_version.scan(RUBY_VERSION_REGEX).first
      ''.tap do |s|
        s << "v#{major}_#{minor}_#{tiny}"
        s << "_#{patch}" if patch
      end
    else
      "v#{ruby_version}"
    end
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
