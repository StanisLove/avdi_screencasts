# RUBYLIB="./lib:$RUBYLIB" gem help commands
# RUBYLIB="./lib:$RUBYLIB" gem love --help
# RUBYLIB="./lib:$RUBYLIB" gem love fattr
class Gem::Commands::LoveCommand < Gem::Command
  def initialize
    super 'love', 'Tell the world of your love for a gem'
  end

  # returns documentation of args
  def arguments
    "GEM_NAME the name of the gem you wish to endorse"
  end

  def usage
    "#{program_name} GEM_NAME"
  end

  def description
    "Records your apprecation for a gem on gemlove.org."
  end

  def execute
    puts "Under construction..."
  end
end
