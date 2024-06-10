module Concerns
  class Performable
    def perform(...)
      self.new(...).send(performable_method)
    end

    def performable_method(method_name = nil)
      @method_name = method_name if method_name
      @method_name || :perform
    end
  end
end
