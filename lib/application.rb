require "action_controller"
require "application_controller"
require "active_record"
require "router"
require "config/routes"
require "pry"

# always require model file
# class Object
#   def const_missing(name)
#     name  # User
#     require name.to_s.downcase
#   end
# end


class Application
  def call(env)
    # [200, {}, ["Hi from Application"]]

    request = Rack::Request.new(env)

    response = Rack::Response.new
    # response.write("Hi from Application")
    
    controller_name, action_name = route(request.path_info)  # /home/index
    # ["home", "index"]

    controller_class = load_controller_class(controller_name)
    controller = controller_class.new  # HomeController.new
    controller.request = request
    controller.response = response
    controller.process action_name  # calls controller.index

    response.finish
  end

  def route(path)
    # => "/home/index" => ["", "home", "index"]
    # _, controller_name, action_name = path.split("/")
    # [controller_name || "home", action_name || "index"]
    Routes.recognize(path)
  end

  def load_controller_class(name)
    # "home" => HomeController
    require "#{name}_controller" # require "home_controller"
    Object.const_get(name.capitalize + "Controller") # HomeController
  end
end