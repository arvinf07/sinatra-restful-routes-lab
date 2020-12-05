class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  # code actions here!
  get '/recipes' do 
    @recipes = Recipe.all
    erb :index
  end  

  get '/recipes/new' do 
    erb :new
  end

  post '/recipes' do 
    recipe = Recipe.new(params)
    if recipe.save
      redirect "/recipes/#{recipe.id}"
    else
      redirect '/recipes/new' 
    end 
  end  

  get '/recipes/:id/edit' do 
    @recipe = Recipe.find(params[:id])
    erb :edit
  end  

  patch '/recipes/:id' do
    recipe = find(params[:id])
    recipe.update(params)
    redirect "/recipes/#{recipe.id}"
  end

  delete '/recipes/:id' do 
    Recipe.destroy(params[:id])
    redirect '/recipes'
  end  

  get '/recipes/:id' do
    @recipe = Recipe.find(params[:id])
    erb :show
  end  

end
