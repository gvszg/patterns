class EchoController < ApplicationController
  def index
    response.write("You said: " + request["text"])  # /echo/index?text=haha
  end
end