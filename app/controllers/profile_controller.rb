class ProfileController < ApplicationController
  def show
    @user = Users.find()
  end
end
