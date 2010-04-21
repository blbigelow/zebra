class SearchController < ApplicationController
  access_control do
		allow logged_in, :to => [:show]
	end

	def show
		@search = Sunspot.search([Post,Discussion,Document]) do
			keywords params['searchTerm'], :highlight => true
		end
		
  end

end
