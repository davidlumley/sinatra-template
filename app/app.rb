module SinatraApp
  class App < Sinatra::Base

    set :public_folder, File.join(Dir.pwd, 'public')
    
    get '/' do
      erb :index
    end

  end
end