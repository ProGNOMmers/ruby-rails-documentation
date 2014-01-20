require 'thor'

require 'ruby_rails_documentations'

class RubyRailsDocumentations
  class CLI < Thor
    package_name 'RubyRailsDocumentations'

    desc 'generate OUTPUT_DIR',
         'generates Ruby and Ruby on Rails merged documentations for each couple of the Ruby and Rails versions specified; the results will be available inside OUTPUT_DIR'
    long_desc <<-LONGDESC.gsub("\n", "\x5")
      Generates Ruby and Ruby on Rails merged documentations for each couple of the Ruby and Rails versions specified; the results will be available inside OUTPUT_DIR.

      Examples:

     > $ bin/ruby-rails-documentations generate ~/ruby-rails-documentations --sdoc-dir=~/sdoc --ruby-dir=~/ruby --rails-dir=~/rails --ruby-versions=1.9.3p484 2.0.0p353 2.1.0 --rails-versions=3.0.20 3.1.12 3.2.16 4.0.2 4.1.0.beta1
    LONGDESC
    option :'sdoc-dir'       , required: true                , desc: %[SDoc directory, f.e. `ruby -e "p Gem::Specification.find_by_name('sdoc').gem_dir"`]
    option :'ruby-dir'       , required: true                , desc: <<-DESC.gsub(/^ {6}/, '').gsub("\n", '')
      Ruby source directory. It is required to be a valid Ruby git clone, 
      in order to switch between the versions using `git checkout`. 
      Note that the supplied versions will be reformatted (see 'Version formats' section)
    DESC
    option :'rails-dir'      , required: true                , desc: <<-DESC.gsub(/^ {6}/, '').gsub("\n", '')
      Ruby on Rails source directory. It is required to be a valid Ruby on Rails git clone, 
      in order to switch between the versions using `git checkout`. 
      Note that the supplied versions will be reformatted (see 'Version formats' section)
    DESC
    option :'ruby-versions'  , required: true , type: :array , desc: %[The Ruby versions whose documentations will be generated]
    option :'rails-versions' , required: true , type: :array , desc: %[The Ruby on Rails versions whose documentations will be generated]
    def generate(output_dir)
      @sdoc_dir, @ruby_dir, @rails_dir, @ruby_versions, @rails_versions = \
        options[:'sdoc-dir'], options[:'ruby-dir'], options[:'rails-dir'], options[:'ruby-versions'], options[:'rails-versions']

      errors << "'--ruby-versions' option is empty" if @ruby_versions.empty?
      errors << "'--rails-versions' option is empty" if @rails_versions.empty?

      errors!

      # output_dir     = File.join Dir.home, 'ruby-rails-documentations'
      # sdoc_dir       = File.join Dir.home, 'Sviluppo/sdoc'
      # ruby_dir       = File.join Dir.home, 'Sviluppo/ruby'
      # rails_dir      = File.join Dir.home, 'Sviluppo/rails'
      # ruby_versions  = '2.1.0'
      # rails_versions = '4.1.0.beta1'

      # ruby_versions  = %w(1 2)
      # rails_versions = %w(1 2)

      # FileUtils.rm_rf output_dir

      RubyRailsDocumentations.new(output_dir, @sdoc_dir, @ruby_dir, @rails_dir).generate(@ruby_versions, @rails_versions)

      # puts output_dir
    end

    no_commands do
      def errors!(error = nil)
        errors << error if error
        
        unless errors.empty?
          errors_to_s = errors.map { |v| "  #{v}" }.join("\n")
          abort <<-ABORT.gsub(/^ {12}/, '')
            Some errors happened:
            #{errors_to_s}
          ABORT
        end
      end

      def errors
        @errors ||= []
      end
    end

  end
end