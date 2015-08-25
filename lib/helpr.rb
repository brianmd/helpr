require_relative 'helpr/version'

module Helpr
  class Help
    attr_accessor :top
    
    def add(name, text)
      self[name.to_sym] = text
      tokens = name.split(' ')
    end

    def [](name)
      help[name]
    end

    def []=(name, val)
      help[name] = val
    end

    def help
      @help ||= Hash.new
    end

    def topic_hierarchy

    end
  end
end
