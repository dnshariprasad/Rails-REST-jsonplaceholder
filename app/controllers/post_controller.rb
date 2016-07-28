class PostController < ApplicationController
  def index
  	raw_response = RestClient.get 'http://jsonplaceholder.typicode.com/posts'
	case raw_response.code 
  	when 200
  		render json: {response: JSON.parse(raw_response.body)}, statu: :ok
  	else
  		render json: {response: "Unknown Request"}, status: :un_processible_entity
  	end
  end

  def show
  	   raw_response = RestClient.get "http://jsonplaceholder.typicode.com/posts/#{params[:id]}"
  	   case raw_response.code
  	   when 200
       	render json: {response: JSON.parse(raw_response)}, status: :ok
       else
  		render json: {response: "Unknown Request"}, status: :un_processible_entity
  end

end
