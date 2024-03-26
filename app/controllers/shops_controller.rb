class ShopsController < ApplicationController
  def index
    @shops = Shop.all
    @markers = @shops.map do |shop| {
      lat: shop.latitude,
      lng: shop.longitude,
      infoWindow: { content: render_to_string(partial: "/shops/map_box", locals: { shop: shop }) },
    id: shop.id
  }
    end
  end
  def new
    @shops = Shop.new
  end

  def show
    @shops = Shop.find(params[:id])
  end

  def create
    @shops = Shop.new(params[:shop])
    @shop.save
    redirect_to shop_path(@shop)
  end

  def destroy
    @shop = Shop.find(params[:id])
    @shop.destroy
    redirect_to shop_path, status: :see_other

  end
  private

  def shop_params
    params.require(:shop).permit(:shop_name, :address, :city, :longitude, :latitude)
  end
end
