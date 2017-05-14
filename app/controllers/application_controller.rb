class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_item
  before_action :set_button_text
  
  private
  
  def set_item
    if params[:id]
      @item = Item.find(params[:id])
    else
      @item = Item.new
    end
  end
  
  def set_button_text
    @button_text = "Add Item"
  end
end
