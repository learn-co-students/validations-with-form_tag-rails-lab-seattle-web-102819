class AuthorsController < ApplicationController
  def show
    author_find
  end

  def new
    @author = Author.new
  end

  def create
    @author = Author.new(author_params)
    if @author.valid?
      @author.save
      redirect_to author_path(@author)
    else
      render :new
    end
  end

  def edit
    author_find
  end

  def update
    author_find
    if @author.valid?
      @author.update(author_params)
      redirect_to author_path(@author)
    else
      render :edit
    end
  end

  private

  def author_params
    params.permit(:name, :email, :phone_number)
  end

  def author_find
    @author = Author.find(params[:id])
  end
end
