class PagesController < ApplicationController

def home
    redirect_to articles_path if loggedin?
  
end

end
