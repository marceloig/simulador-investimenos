class CalculosController < ApplicationController
  before_action :set_calculo, only: [:show, :edit, :update, :destroy]

  # GET /calculos
  # GET /calculos.json
  def index
    @calculos = Calculo.all
  end

  # GET /calculos/1
  # GET /calculos/1.json
  def show
  end

  # GET /calculos/new
  def new
    @calculo = Calculo.new
  end

  # GET /calculos/1/edit
  def edit
  end

  # POST /calculos
  # POST /calculos.json
  def create
    @calculo = Calculo.new(calculo_params)

    respond_to do |format|
      if @calculo.save
        format.html { redirect_to @calculo, notice: 'Calculo was successfully created.' }
        format.json { render :show, status: :created, location: @calculo }
      else
        format.html { render :new }
        format.json { render json: @calculo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /calculos/1
  # PATCH/PUT /calculos/1.json
  def update
    respond_to do |format|
      if @calculo.update(calculo_params)
        format.html { redirect_to @calculo, notice: 'Calculo was successfully updated.' }
        format.json { render :show, status: :ok, location: @calculo }
      else
        format.html { render :edit }
        format.json { render json: @calculo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /calculos/1
  # DELETE /calculos/1.json
  def destroy
    @calculo.destroy
    respond_to do |format|
      format.html { redirect_to calculos_url, notice: 'Calculo was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_calculo
      @calculo = Calculo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def calculo_params
      params.require(:calculo).permit(:valor_inicial, :valor_mensal, :data_de_retirada, :renda_fixa_id)
    end
end
