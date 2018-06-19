class PagesController < ApplicationController
  def about
  end

  def home
  	Ad1.push
  	@data1 = Ad1.all
  	render json: @data1
  end

  def contact
  end
end
