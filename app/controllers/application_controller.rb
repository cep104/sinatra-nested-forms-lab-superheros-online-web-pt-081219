require 'sinatra/base'

class App < Sinatra::Base

    set :views, Proc.new { File.join(root, "../views/") }

    get '/' do 
        
    erb :index 
        
    end

    post '/teams' do 
       @team = Team.new(name: params[:team][:name], motto: params[:team][:motto])
       members = params[:team][:members]
        
       members.each do |member_data|
        SuperHero.new({name: member_data[:name], power: member_data[:power], bio: member_data[:bio]})
       end
       @super_heroes = SuperHero.all
        erb :team
    end

end
