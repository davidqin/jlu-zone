module Wiki
  class ActionRequest
    attr_accessor :controller
    attr_accessor :action

    def initialize(controller, action)
      self.controller = controller.to_s
      self.action = action.to_s
    end

    def name
      "#{self.controller} => #{self.action}"
    end

    def hash
      self.name.hash
    end

    def eql?(comparee)
      self == comparee
    end

    def ==(comparee)
      self.name == comparee.name
    end

    def to_s
      self.name
    end
  end
end