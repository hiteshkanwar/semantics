class HomeController < ApplicationController
	require 'semantics3'

  def index
  	sem3 = Semantics3::Products.new("SEM31C8A01718426C42AFE54DD7B7A0F4BA9","ZTQ2ZGM4MDQ2YThjMWIwMmI5YTllYWU0NjNkZGRkZTU")
  	sem3.products_field( "search", "electronics" )
  	@products = sem3.get_products()

  	if params[:search].nil? || params[:search].blank?
  		@products_list = @products["results"]
  	else      
  		 @products_list = @products["results"].select{|w| ((w["model"]== params[:search]) || (w["category"] == params[:search]) || (w["name"]== params[:search]) || (w["brand"]== params[:search])  ) }
  	end
  end
end
