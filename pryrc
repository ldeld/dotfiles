require 'awesome_print'
AwesomePrint.pry!

# include Rails::ConsoleMethods to call #reload!

if defined?(Rails) && Rails.env
  if defined?(Rails::ConsoleMethods)
    include Rails::ConsoleMethods
  else
    def reload!(print=true)
      puts "Reloading..." if print
      ActionDispatch::Reloader.cleanup!
      ActionDispatch::Reloader.prepare!
      true
    end
  end
end
