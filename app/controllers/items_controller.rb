class ItemsController < ApplicationController
  before_action :set_list
  before_action :set_item, except: [:create]

  def create
    @item = @list.items.create(item_params)
    redirect_to @list
  end

  def complete
    @item.update_attribute(:complete, true)
    redirect_to @list
  end

  private

  def item_params
    params.require(:item).permit(:content)
  end

  def set_list
    @list = List.find(params[:list_id])
  end

  def set_item
    @item = @list.items.find(params[:id])
  end
end
