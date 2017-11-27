class MyController < ApplicationController
  include MyHelper

  before_action :authenticate_user!

  def top
  end
end
