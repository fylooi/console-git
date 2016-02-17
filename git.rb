class Git
  attr_accessor :calls
  Mutt = Mutex.new
 
  class << self
    def singleton_git
      Mutt.synchronize { @singleton_git ||= new }  
    end

    def singleton_git=(val)
      Mutt.synchronize { @singleton_git = val }  
    end

    def git(*args)
      self.singleton_git = nil

      Thread.new do 
        sleep(0.1)
        singleton_git.invoke
      end

      singleton_git
    end
  end

  def initialize
    @calls = []
  end


  def method_missing(m, *args, &block)
    self.class.singleton_git.tap do |git|
      incoming_methods = [m] + sym_to_flag(args)
      git.calls << incoming_methods
    end
  end 

  def to_s
    "git #{calls.join(' ')}"
  end

  def inspect
    to_s
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
