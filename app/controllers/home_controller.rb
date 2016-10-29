class HomeController < ApplicationController
  def index
    response.write("Hi from ApplicationController")
  end
end