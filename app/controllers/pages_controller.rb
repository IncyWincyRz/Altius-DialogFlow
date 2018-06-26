class PagesController < ApplicationController
  def about
  end

  def home
  	@data1 = Ad1.pass(params[:comment])
  	render json: @data1
  end

  def contact
  end
end
