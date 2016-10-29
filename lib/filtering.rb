module Filtering
  # this way is not work for included class to call as class method
  # actually it is Filtering.before_action(....)
  # def self.before_action(method)  
  # end

  def self.included(base)  # base == ActionController::Base
    base.extend ClassMethods
  end

  module ClassMethods
    def before_action(method)
      before_actions << method
    end

    def before_actions
      @before_actions ||= []
    end
  end

  def process(action_name)
    self.class.before_actions.each { |method| send(method) }
    super
  end
end