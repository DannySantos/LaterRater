class ItemsController < ApplicationController
  before_action :convert_enums, only: [:create, :update]

  def index
    @items = current_user.items if current_user
    filter_items if params[:filter]
  end

  def show
    authorize! :read, @item
  end

  def new
    @item = Item.new
    @button_text = "Add Item"
  end

  def edit
    @button_text = "Update Item"
  end

  def create
    @item = Item.new(item_params)
    @item.user_id = current_user.id
    
    if @item.save
      redirect_to items_path, notice: 'Item was successfully created.'
    else
      render :new
    end
  end

  def update
    authorize! :update, @item
    
    if @item.update(item_params)
      redirect_to @item, notice: 'Item was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    authorize! :destroy, @item
    @item.destroy
    format.html { redirect_to items_url, notice: 'Item was successfully destroyed.' }
  end

  private
  
  def item_params
    params.require(:item).permit(:title, :category, :status, :rating, :priority, :link, :all_tags)
  end
  
  def convert_enums
    params[:item][:rating] = params[:item][:rating].to_i if params[:item][:rating]
  end
  
  def filter_items
    unless params[:filter][:category].blank?
      @items = @items.where(category: params[:filter][:category])
    end
    
    unless params[:filter][:status].blank?
      @items = @items.where(status: params[:filter][:status])
    end
    
    unless params[:filter][:rating].blank?
      @items = @items.where(rating: params[:filter][:rating])
    end
    
    unless params[:filter][:priority].blank?
      @items = @items.where(priority: params[:filter][:priority])
    end
  end
end