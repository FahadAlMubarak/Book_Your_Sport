class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]
  skip_before_action :authenticate_user!, only: :home
  def home
  end



  def user_dashboard

  end

  def owner_dashboard

  end

end
