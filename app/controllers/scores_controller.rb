class ScoresController < ApplicationController
  before_action :set_game

  def new
    @score = @game.scores.build
  end

  def create
    @score = @game.scores.build(score_params)
    if @score.save
      redirect_to game_path(@game), notice: "Score added successfully."
    else
      render :new
    end
  end

  private

  def set_game
    @game = Game.find(params[:game_id])
  end

  def score_params
    params.require(:score).permit(:player, :points)
  end
end
