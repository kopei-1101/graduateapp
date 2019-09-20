class GuesthousesController < ApplicationController
  def top
    @guesthouse = Guesthouse.all
  end

  def recruit
    
  end

  def create
    @guesthouse = Guesthouse.new(
      city: params[:city],
      address: params[:address],
      appeal: params[:appeal],
      prefecture: params[:prefecture],
      image: params[:image]
      )
      if @guesthouse.save
        flash[:notice] ="募集中です"
        redirect_to("/guesthouses/top")
      else
        flash[:notice]="すべて記入してください"
        @city = params[:city]
        @address = params[:address]
        @appeal = params[:appeal]
        render("guesthouses/recruit")
      end

    end

    private

    def user_params
      params.require(:user).permit(:name, :description, :image)
    end

end
