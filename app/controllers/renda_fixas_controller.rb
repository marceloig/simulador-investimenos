class RendaFixasController < ApplicationController
  before_action :set_renda_fixa, only: [:show, :edit, :update, :destroy]

  # GET /renda_fixas
  # GET /renda_fixas.json
  def index
    @renda_fixas = RendaFixa.all
  end

  # GET /renda_fixas/1
  # GET /renda_fixas/1.json
  def show
  end

  # GET /renda_fixas/new
  def new
    @renda_fixa = RendaFixa.new
  end

  # GET /renda_fixas/1/edit
  def edit
  end

  # POST /renda_fixas
  # POST /renda_fixas.json
  def create
    @renda_fixa = RendaFixa.new(renda_fixa_params)

    respond_to do |format|
      if @renda_fixa.save
        format.html { redirect_to @renda_fixa, notice: 'Renda fixa was successfully created.' }
        format.json { render :show, status: :created, location: @renda_fixa }
      else
        format.html { render :new }
        format.json { render json: @renda_fixa.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /renda_fixas/1
  # PATCH/PUT /renda_fixas/1.json
  def update
    respond_to do |format|
      if @renda_fixa.update(renda_fixa_params)
        format.html { redirect_to @renda_fixa, notice: 'Renda fixa was successfully updated.' }
        format.json { render :show, status: :ok, location: @renda_fixa }
      else
        format.html { render :edit }
        format.json { render json: @renda_fixa.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /renda_fixas/1
  # DELETE /renda_fixas/1.json
  def destroy
    @renda_fixa.destroy
    respond_to do |format|
      format.html { redirect_to renda_fixas_url, notice: 'Renda fixa was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_renda_fixa
      @renda_fixa = RendaFixa.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def renda_fixa_params
      params.require(:renda_fixa).permit(:titulo, :vencimento, :taxa_de_juros, :tipo, :imposto_de_renda, :is_imposto_de_renda_fixo)
    end
end
