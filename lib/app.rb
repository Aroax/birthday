require 'sinatra'
require 'sinatra/reloader' if development?
require 'date'

class Birthday < Sinatra::Base

  enable :sessions

  get '/' do
    erb :index

  end

  post '/results' do
    session[:celebrate] = false
    session[:name] = params[:Name]
    session[:birth_day] = params[:Day].to_i
    session[:birth_month] = month(params[:Month])
    session[:birth_year] = params[:Year]
    redirect('/display')
  end

  get '/display' do
    @name = session[:name]
    @birth_day = session[:birth_day]
    @birth_month = session[:birth_month]
    @birth_year = session[:birth_year]
    @remaining = days_remaining
    redirect('/celebrate') if birthday?
    erb :display
  end

  get '/celebrate' do
    erb :celebrate
  end

  def days_remaining
    today = DateTime.now
    # puts today
    birthday = DateTime.new(today.year, session[:birth_month], session[:birth_day])
    # puts birthday
    session[:celebrate] = true if today == birthday
    birthday = birthday.next_year(1) if today > birthday
    (birthday - today).to_i
  end

  def birthday?
    today = DateTime.now
    (session[:birth_month].to_i == today.month.to_i) && (session[:birth_day].to_i == today.day.to_i)
  end

  def month(month)
    months = {
      "January" => 1,
      "February" => 2,
      "March" => 3,
      "April" => 4,
      "May" => 5,
      "June" => 6,
      "July" => 7,
      "August" => 8,
      "September" => 9,
      "October" => 10,
      "November" => 11,
      "December" => 12,
    }
    months[month]
  end








  run! if app_file == $0
end
