class RecordsController < ApplicationController
  def index
    @records = Record.all
  end
  def new
    @records = Record.new
  end

  def show
    @records = Record.find(params[:id])
  end

  def create
    @records = Record.new(params[:record])
    @record.save
    redirect_to record_path(@record)
  end

  def destroy
    @record = Record.find(params[:id])
    @record.destroy
    redirect_to record_path, status: :see_other
    
  end
  private

  def record_params
    params.require(:record).permit(:artist_name, :album_name, :genre)
  end
end
