class ItemsController < ApplicationController
  respond_to :html, :js
  def index
    @items = Item.all
    @order_item = current_order.order_items.new
  end

  def show
  end

  def new
  end
  
  def create
 
    @item = MainCategory.find(params[:main_category_id]).items.create(params.require(:item).permit(:title, :body, :name, :price, :quantity))
    @item_id = @item.id
    redirect_to main_category_item_path(@item.main_category_id,@item.id)
  end

  def edit
  end
  
  def update
    
    Item.find(params[:id]).update_attributes(params.require(:item).permit(:title, :body, :name, :price, :quantity) )
    redirect_to main_category_item_path(Item.find(params[:id]).main_category_id, Item.find(params[:id]).id )
  end

  def destroy
    if Item.find(params[:id]).destroy
    flash[:notice] = 'An Item was destoryed'
    end
    redirect_to root_path
  end  
  
  def checkout
    render  "items/checkout"
  end
  
  
  
end
