class ScoresController < ApplicationController
  before_action :set_game
  before_action :set_score, only: [:edit, :update]

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

  def edit
  end

  def update
    if @score.update(score_params)
      redirect_to game_path(@game), notice: "Score updated successfully"
    else
      render :edit
    end
  end

  private

  def set_game
    @game = Game.find(params[:game_id])
  end

  def score_params
    params.require(:score).permit(:player, :points)
  end

  def set_score
    @score = @game.scores.find(params[:id])
  end
end
