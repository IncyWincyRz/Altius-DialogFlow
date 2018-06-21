class PagesController < ApplicationController
  def about
  end

  def home
  	@data1 = Ad1.push("The quality of the product is below average.")
  	#@data1 = Ad1.all
  	#byebug
  	render json: @data1
  end

  def contact
  end
end
