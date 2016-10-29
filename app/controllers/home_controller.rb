class HomeController < ApplicationController
  before_action :header

  def index
    response.write("Hi from ApplicationController")
  end

  private
  def header
    response.write("<h1>This is Header</h1>")
  end
end