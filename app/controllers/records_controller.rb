class RecordsController < ApplicationController
  def index
    @records = Record.all
  end
  def create

  end

  def show
    @records = Record.find(params[:id])
  end
end
