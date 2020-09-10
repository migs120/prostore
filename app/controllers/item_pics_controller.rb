class ItemPicsController < ApplicationController
  def index
  end

  def show
  end

  def new
  end
  
  def create
    
    Item.find(params[:item_id]).item_pics.create(params.require(:item_pic).permit(:pic_url, :name, :description))
    redirect_to main_category_item_path(params[:main_category_id], params[:item_id])
  end  

  def edit
  end
  
  def update
   
    #ItemPic.find(params[:id]).update_attributes(params.require(:item_pic).permit(:pic_url, :name, :description) )
    # ItemPic.find(params[:id]).update_attributes(pic_url: params[:item_pic][:pic_url], name: params[:item_pic][:name], description: OrderCheckoutTransaction.last.params )
    ItemPic.find(params[:id]).update_attributes(pic_url: params[:item_pic][:pic_url], name: params[:item_pic][:name], description: params[:item_pic][:description] )
    redirect_to main_category_item_path(params[:main_category_id], params[:item_id] )
   # ItemPic.where(name: 'template').first.description.inspect
  end  
  
  def destroy
    if ItemPic.find(params[:id]).destroy
    flash[:notice] = 'A Picture was destoryed'
    end
    redirect_to main_category_item_path(params[:main_category_id], params[:item_id])
  end  
  
end
