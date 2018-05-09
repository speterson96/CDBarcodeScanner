class LoginSystemController < ApplicationController
  before_filter :authenticate_user!
  def login
  end

  def signup
  end

  def userInfo
  end
end
