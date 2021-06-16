require 'sinatra'
require 'sinatra/reloader' if development?

class Birthday < Sinatra::Base

  enable :sessions

  get '/' do
    erb :index
  end

  post '/results' do
    session[:name] = params[:Name]
    redirect('/display')
  end

  get '/display' do
    @name = session[:name]
    erb :display
  end

  run! if app_file == $0
end
