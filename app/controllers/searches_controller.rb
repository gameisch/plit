class SearchesController < ApplicationController

  def index
    @searches = Search.all
    @title = 'Популярные запросы'
end
  def new
    @search = Search.new
    @title = 'Расширенный поиск'
  end

  def create
  @search = User.search(params[:search])
    
    @search = Search.new(params[:search])
    if @search.save
      redirect_to @search, :success => "Создан новый запрос."
    else
      render :action => 'new'
    end
  end

  def show
    @search = Search.find(params[:id])
    @title = 'Результаты поиска'
  end
  
  def destroy
    Search.find(params[:id]).destroy
    flash[:success] = "Результат уничтожен!"
    redirect_back
  end
end
