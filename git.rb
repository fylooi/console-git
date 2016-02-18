class Git
  attr_accessor :calls
 
  class << self
    def git_instance
      @git_instance ||= new   
    end

    def git_instance=(val)
      @git_instance = val  
    end

    def git(*args)
      self.git_instance = nil
      git_instance
    end
  end

  def initialize
    @calls = []
  end


  def method_missing(m, *args, &block)
    self.class.git_instance.tap do |git|
      incoming_methods = [m] + sym_to_flag(args)
      git.calls << incoming_methods
    end
  end 

  def to_s
    "git #{calls.join(' ')}"
  end

  def inspect
    puts invoke
  end

  def invoke
    system(to_s)
  end

  def sym_to_flag(args)
    args.map do |arg| 
      arg.is_a?(Symbol) ? "-#{arg.to_s}" : arg
    end
  end
end

define_method(:git) { Git.git }
