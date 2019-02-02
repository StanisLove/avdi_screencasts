class BPL
  @pr = proc { |name| "Hello, #{name}" }
  @lm = lambda { |name| "Hi, #{name}" }

  class << self
    attr_reader :pr, :lm

    def diff_calls
      p pr.call("Johny")
      p pr["Jim"]
      p pr.("Jack")
    end

    def call_both
      p pr.call("Helga", "Smith") #=> Hi, Helga
      p lm.call("Joseph", "Stalin") #=> wrong number of arguments
    end

    def context
      p = proc do
        puts 'in proc'
        return
        puts 'after return'
      end

      l = lambda do
        puts 'in lambda'
        return
        puts 'after return'
      end

      l.call
      p.call

      puts 'End of mehtod' # no this output,
                           # cause lambda executes in self context
                           # and proc binded with method context
    end
  end
end
