require 'test_helper'

class CalculosControllerTest < ActionController::TestCase
  setup do
    @calculo = calculos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:calculos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create calculo" do
    assert_difference('Calculo.count') do
      post :create, calculo: { data_de_retirada: @calculo.data_de_retirada, renda_fixa_id: @calculo.renda_fixa_id, valor_inicial: @calculo.valor_inicial, valor_mensal: @calculo.valor_mensal }
    end

    assert_redirected_to calculo_path(assigns(:calculo))
  end

  test "should show calculo" do
    get :show, id: @calculo
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @calculo
    assert_response :success
  end

  test "should update calculo" do
    patch :update, id: @calculo, calculo: { data_de_retirada: @calculo.data_de_retirada, renda_fixa_id: @calculo.renda_fixa_id, valor_inicial: @calculo.valor_inicial, valor_mensal: @calculo.valor_mensal }
    assert_redirected_to calculo_path(assigns(:calculo))
  end

  test "should destroy calculo" do
    assert_difference('Calculo.count', -1) do
      delete :destroy, id: @calculo
    end

    assert_redirected_to calculos_path
  end
end
