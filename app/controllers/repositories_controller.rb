class RepositoriesController < ApplicationController

  def search

  end

  def foursquare
   @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
     req.params['client_id'] = 'Iv1.cde26eac6e7e1da0'
     req.params['client_secret'] = '69b02369b74e206e2a4bfecc25117998e361a81e'
     req.params['v'] = '20160201'
     req.params['near'] = params[:zipcode]
     req.params['query'] = 'coffee shop'
   end
   body_hash = JSON.parse(@resp.body)
   if @resp.success?
    @venues = body["response"]["venues"]
   else
    @error = body["meta"]["errorDetail"]
   end
   render 'search'
 end
end
