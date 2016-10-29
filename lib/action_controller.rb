require "filtering"
require "rendering"

module ActionController
  class Metal
    attr_accessor :request, :response

    def process(action_name)
      send action_name
    end
  end

  class Base < Metal
    include Filtering
    include Rendering

    # attr_accessor :request, :response

    # def process(action_name)
    #   # before_actions.each { |method| send(method) }
    #   send action_name  # index
    # end

    # def self.before_action(method)
    #   # before filter
    # end
  end
end