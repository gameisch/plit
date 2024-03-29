begin
  require 'i18n'
  require 'active_support/lazy_load_hooks'
rescue LoadError => e
  $stderr.puts "You don't have i18n installed in your application. Please add it to your Gemfile and run bundle install"
  raise e
end

I18n.load_path << "#{File.dirname(__FILE__)}/locale/ru.yml"
ActiveSupport.run_load_hooks(:i18n)
