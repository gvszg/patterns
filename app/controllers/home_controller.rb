class HomeController < ApplicationController
  before_action :header
  after_action :footer

  def index
    response.write("Hi from ApplicationController")
  end

  private
  def header
    response.write("<h1>This is Header</h1>")
  end

  def footer
    response.write("<p>&copy; me</p>")
  end
end