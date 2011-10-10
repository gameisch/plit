class PagesController < ApplicationController

  def home
    @title = "Домашняя"
    if signed_in?
      
      @micropost = Micropost.new
      @feed_items = current_user.feed.paginate(:page => params[:page])
      @title = "Моя стена"
  end
end

  

  def contact
    @title = "Контакты"
  end

  def about
    @title = "О проекте"
  end

  def help
    @title = "Помощь"
  end
  
  def indev
    @title = "В разработке"
  end
  
  def develop
    @title = "Разработчики"
  end
  
  def reglament
    @title = "Пользовательское соглашение"
  end
  
  def vacancy
    @title = "Вакансии"
  end
end
