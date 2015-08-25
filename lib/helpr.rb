require_relative 'helpr/version'

module Helpr
  class Help
    attr_accessor :top
    
    def add(name, text)
      self[name] = text
      topics(name.split(' '))
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

    def topics(keys=nil)
      result = if keys.nil?
                 hierarchy
               else
                 topics_aux(keys, hierarchy)
               end
      result.keys
    end

    def topics_aux(keys, hier)
      key = keys.shift.to_sym
      hier = hier.fetch(key) do
        hier[key] = {}
      end
      if keys.empty?
        hier
      else
        topics_aux(keys, hier)
      end
    end

    def hierarchy
      @hierarchy ||= Hash.new
    end
  end
end
