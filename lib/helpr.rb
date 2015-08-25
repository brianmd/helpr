require_relative 'helpr/version'

module Helpr
  class Help
    attr_accessor :top
    
    def add(name, text)
      self[name] = text
      tokens = name.split(' ')
    end

    def [](name)
      help[name.to_sym]
    end

    def []=(name, val)
      help[name.to_sym] = val
    end

    def help
      @help ||= Hash.new
    end

    def topic_hierarchy

    end
  end
end
