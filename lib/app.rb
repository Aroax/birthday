require 'sinatra'
require 'sinatra/reloader' if development?

class Birthday < Sinatra::Base

  enable :sessions

  get '/' do
    erb :index
  end

  post '/results' do
    session[:name] = params[:Name]
    session[:birthday] = params[:Birthday]
    redirect('/display')
  end

  get '/display' do
    @name = session[:name]
    @birthday = session[:birthday]
    erb :display
  end

  run! if app_file == $0
end
