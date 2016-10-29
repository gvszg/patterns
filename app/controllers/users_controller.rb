require "user"

class UsersController < ApplicationController
  def index
    # response.write("This is from UsersController#index")

    User.all.each do |user|
      response.write("<p>#{user.name}</p>")
    end
  end

  def show
    # response.write("This is from UsersController#show")
  end
end