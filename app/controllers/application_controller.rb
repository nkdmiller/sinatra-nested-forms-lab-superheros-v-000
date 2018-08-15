require 'sinatra/base'
require 'pry'
class App < Sinatra::Base

  set :views, Proc.new { File.join(root, "../views/") }
  get '/' do
    erb :super_hero
  end

  post '/team' do
    
    @team = Team.new(params[:team])
    params[:team][:members].each do |member|
      Member.new(member)
    end
     
    @members = Member.all
    erb :team
  end
end
