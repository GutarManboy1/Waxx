class Shop < ApplicationRecord
  def index
    @shops = Shop.all
  end

  def create

  end

  def new
    @shop = Shop.save
  end
end
