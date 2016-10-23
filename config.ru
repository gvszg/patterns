# Start with: shotgun
# Under Windows: rackup  (CTRL+C and restart on each change)
require "pry"
# class App
#   def call(env)
#     [
#       200,
#       { "Content-Type" => "text/html" },
#       [
#         "hi " + env["PATH_INFO"],
#         "<html>",
#         "<h1>OOOOOOOOOHHHHHHHHHHH</h1>",
#         "#{env}",
#         "</html>"
#       ]
#     ]
#   end
# end

# run App.new

# my_proc = -> env do
#   [200, {}, ["hi"]]
# end
# run my_proc

# run -> env do
#   [200, {}, ["hi"]]
# end

# implement sinatra-like version
# get "/" do
#   ......
# end
Routes = {
  "GET" => {
    # "path" => block
  }
}

def get(path, &block)
  Routes["GET"][path] = block
end

get "/" do
  "awesome!!!!"
end

run -> env do
  method = env["REQUEST_METHOD"]
  path = env["PATH_INFO"]

  if block = Routes[method][path]
    body = block.call
    [200, {}, [body]]
  else
    [404, {}, ["Not Found"]]
  end
end