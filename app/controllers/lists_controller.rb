class ListsController < ApplicationController
  before_action :set_list, only: [:show, :destroy]
  def index
    @lists = List.all
  end

  def show
    @bookmark = Bookmark.new
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)

    if @list.save
      redirect_to @list, notice: "New list is create"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @list.destroy
    redirect_to lists_path, status: :see_other
  end

  private

  def list_params
    params.require(:list).permit(:name, :photo)
  end

  def set_list
    @list = List.find(params[:id])
  end
end
