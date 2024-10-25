class GamesController < ApplicationController
  def index
    @games = Game.all
  end

  def show
    @game = Game.find(params[:id])
    @scores = @game.scores
  end

  def new
    @game = Game.new
  end

  def create
    @game = Game.new(game_params)

    if @game.save
      redirect_to @game, notice: "Game created successfully."
    else
      render :new
    end
  end

  private
  def game_params
    params.require(:game).permit(:name, :date)
  end

end
