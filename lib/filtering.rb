require "active_support/concern"
require "active_support/callbacks"

module Filtering
  # this way is not work for included class to call as class method
  # actually it is Filtering.before_action(....)
  # def self.before_action(method)
  # end

  # def self.included(base)  # base == ActionController::Base
  #   base.extend ClassMethods
  # end

  extend ActiveSupport::Concern
  include ActiveSupport::Callbacks

  included do
    define_callbacks :process
  end

  module ClassMethods
    def before_action(method)
      # before_actions << method
      set_callback :process, :before, method
    end

    # def before_actions
    #   @before_actions ||= []
    # end

    def after_action(method)
      # after_actions << method
      set_callback :process, :after, method
    end

    # def after_actions
    #   @after_actions ||= []
    # end
  end

  def process(action_name)
    # self.class.before_actions.each { |method| send(method) }
    # super
    # self.class.after_actions.each { |method| send(method) }

    run_callbacks :process do
      super
    end
  end
end