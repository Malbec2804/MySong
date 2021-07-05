class ArtistBalancesController < ApplicationController
  before_action :set_artist_balance, only: [:show, :update, :destroy]

  # GET /artist_balances
  def index
    @artist_balances = ArtistBalance.all

    render json: @artist_balances
  end

  # GET /artist_balances/1
  def show
    render json: @artist_balance
  end

  # POST /artist_balances
  def create
    @artist_balance = ArtistBalance.new(artist_balance_params)

    if @artist_balance.save
      render json: @artist_balance, status: :created, location: @artist_balance
    else
      render json: @artist_balance.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /artist_balances/1
  def update
    if @artist_balance.update(artist_balance_params)
      render json: @artist_balance
    else
      render json: @artist_balance.errors, status: :unprocessable_entity
    end
  end

  # DELETE /artist_balances/1
  def destroy
    @artist_balance.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_artist_balance
      @artist_balance = ArtistBalance.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def artist_balance_params
      params.require(:artist_balance).permit(:artist_id, :balance)
    end
end
