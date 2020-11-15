class PagesController < ApplicationController

  skip_before_action :authenticate_user!, only: [ :home]

  def home
    respond_to do |format|
      format.html { render :layout => 'home' }
    end
  end

  def contact

  end

end
