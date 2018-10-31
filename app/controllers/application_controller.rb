require 'pry'
class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  #index
  get '/recipes' do
    @recipes = Recipe.all
    erb :index
  end

  #NEW create new form
  get '/recipes/new' do
    erb :new
  end

  #NEW gets the data from new form
  post '/recipes' do
  @recipe = Recipe.create(params[:recipe])
  redirect :"/recipes/#{@recipe.id}" #redirect to show page
  end

   #SHOW 
  get '/recipes/:id' do
  @recipe = Recipe.find_by_id(params[:id])
  
  erb :show
  end

  #Edit 
  get '/recipes/:id/edit' do
  @recipe = Recipe.find_by_id(params[:id])
  erb :edit
  end

  #EDIT
  patch '/recipes/:id' do #edit action
  @recipe = Recipe.find_by_id(params[:id])
  @recipe.assign_attributes(params[:recipe])
  erb :show
  end

  #DELETE 
  delete '/recipes/:id/delete' do
    @recipe = Recipe.find_by_id(params[:id])
    @recipe.delete
    redirect :'/recipes'
  end

end