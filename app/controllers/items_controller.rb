class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]
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
  end

  def edit
  end

  def create
    @item = Item.new(item_params)
    @item.user_id = current_user.id

    respond_to do |format|
      if @item.save
        format.html { redirect_to @item, notice: 'Item was successfully created.' }
        format.json { render :show, status: :created, location: @item }
      else
        format.html { render :new }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    authorize! :update, @item
    
    respond_to do |format|
      if @item.update(item_params)
        format.html { redirect_to @item, notice: 'Item was successfully updated.' }
        format.json { render :show, status: :ok, location: @item }
      else
        format.html { render :edit }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    authorize! :destroy, @item
    @item.destroy
    respond_to do |format|
      format.html { redirect_to items_url, notice: 'Item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  
  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:title, :category, :status, :rating, :priority, :link, :all_tags)
  end
  
  def convert_enums
    params[:item][:category] = params[:item][:category].to_i if params[:item][:category]
    params[:item][:status] = params[:item][:status].to_i if params[:item][:status]
    params[:item][:rating] = params[:item][:rating].to_i if params[:item][:rating]
    params[:item][:priority] = params[:item][:priority].to_i if params[:item][:priority]
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
