require 'sinatra/base'

class App < Sinatra::Base

    set :views, Proc.new { File.join(root, "../views/") }

    get '/' do 
        
    erb :super_hero
        
    end

    post '/teams' do

        @team = Team.new(name: params[:team][:name], motto: params[:team][:motto])
        members = params[:team][:members]
  
        members.each do |member_params|
          SuperHero.new({name: member_params[:name], power: member_params[:power], bio: member_params[:bio]})
        end
        @super_heroes = SuperHero.all
  
        erb :team
      
 	end

      @team = Team.new(params[:team])

      members.each do |member_params|
        SuperHero.new({name: member_params[:name], power: member_params[:power], bio: member_params[:bio]})
      end
      @super_heroes = SuperHero.all

      erb :team
   
	end


end
