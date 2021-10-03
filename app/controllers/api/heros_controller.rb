class Api::HerosController < ApplicationController
  include Authenticable

  before_action :authenticate_with_token, only: [:update, :destroy]
  before_action :set_hero, only: [:update, :show, :destroy]

  # GET /heros
  def index
    @heros = Hero.search(params[:term]).sorted_by_name

    render json: @heros
  end

  # GET /heros/1
  def show
    render json: @hero
  end

  # POST /heros
  def create
    @hero = Hero.new(hero_params)

    if @hero.save
      render json: @hero, status: :created, location: api_heros_url(@hero)
    else
      render json: @hero.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /heros/1
  def update
    if @hero.update(hero_params)
      render json: @hero
    else
      render json: @hero.errors, status: :unprocessable_entity
    end
  end

  # DELETE /heros/1
  def destroy
    @hero.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_hero
      @hero = Hero.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def hero_params
      params.require(:hero).permit(:name)
    end
end
