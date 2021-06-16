require 'sinatra'
require 'sinatra/reloader' if development?

class Birthday < Sinatra::Base

  enable :sessions

  get '/' do
    "hello, world!"
  end

  run! if app_file == $0
end
