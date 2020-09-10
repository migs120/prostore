class MainCategoryPicsController < ApplicationController
  def index
  end

  def show
  end

  def new
  end
  
  def create
   
    MainCategory.find(params[:main_category_id]).main_category_pics.create(params.require(:main_category_pic).permit(:pic_url, :name, :description))
    redirect_to root_path
  end

  def edit
  end
  
  def update
   
    MainCategoryPic.find(params[:id]).update_attributes(params.require(:main_category_pic).permit(:pic_url, :name, :description) )
    redirect_to main_category_path(MainCategoryPic.find(params[:id]).main_category_id )
  end
  
end
