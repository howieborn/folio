class PagesController < ApplicationController

  def welcome
    @title = "Welcome to Howie Born's Website"
  end
  
  def webhome
    @title = "Web design Home Page"
	@heading = "Web Design"
  end
  
  def about
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
    @title = "Projects"
  end
  
  def resume
    @title = "Resume"
  end
  
  def contact
    @title = "Contact Me"
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