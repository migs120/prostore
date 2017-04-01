class MainCategoriesController < ApplicationController
respond_to :html, :js
  def index

  end

  def show
   
  end
  
  def create
    MainCategory.create(params.require(:main_category).permit(:title,:body,:template ) )
   # MainCategory.create(title: "test" ,body: params.inspect )
    redirect_to main_categories_path
  end

  def new
    
  end
  

  def edit
    
  end
  
  def update
    MainCategory.find(params[:id]).update_attributes(params.require(:main_category).permit(:title, :body) )
    redirect_to main_category_path(params[:id])
  end
  
  def destroy
    if MainCategory.find(params[:id]).destroy
    flash[:notice] = 'A Category was destoryed'
    end
    redirect_to root_path
  end
  
  
  
end
