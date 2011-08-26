class PagesController < ApplicationController

  def welcome
    @title = "Welcome to Howie Born's Website"
  end
  
  def webhome
   @title = "Howie Born - Web Design and Development Home Page"
	@heading = "Web Design"
  end
  
  def about
   @title = "About Howie Born"
  	@heading = "Bio"
  end
  
  def admin
	@title = "Website Administration Page"
	@heading = "Admin"
  end
  
  def articles
    @title = "Articles"
  end

  def news
    @title = "Latest News"
  end
  
  def projects
    @title = "Sample Projects"
  end
  
  def resume
    @title = "Online Resume For Howie Born"
  end
  
  def contact
    @title = "Contact Howie Born"
  end
  
  def resources
    @title = "Resources"
  end
  
  def skills
    @title = "Skills"
  end
  
  def tutorials
    @title = "tutorials"
  end

  
end
