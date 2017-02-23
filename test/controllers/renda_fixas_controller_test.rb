require 'test_helper'

class RendaFixasControllerTest < ActionController::TestCase
  setup do
    @renda_fixa = renda_fixas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:renda_fixas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create renda_fixa" do
    assert_difference('RendaFixa.count') do
      post :create, renda_fixa: { imposto_de_renda: @renda_fixa.imposto_de_renda, is_imposto_de_renda_fixo: @renda_fixa.is_imposto_de_renda_fixo, taxa_de_juros: @renda_fixa.taxa_de_juros, tipo: @renda_fixa.tipo, titulo: @renda_fixa.titulo, vencimento: @renda_fixa.vencimento }
    end

    assert_redirected_to renda_fixa_path(assigns(:renda_fixa))
  end

  test "should show renda_fixa" do
    get :show, id: @renda_fixa
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @renda_fixa
    assert_response :success
  end

  test "should update renda_fixa" do
    patch :update, id: @renda_fixa, renda_fixa: { imposto_de_renda: @renda_fixa.imposto_de_renda, is_imposto_de_renda_fixo: @renda_fixa.is_imposto_de_renda_fixo, taxa_de_juros: @renda_fixa.taxa_de_juros, tipo: @renda_fixa.tipo, titulo: @renda_fixa.titulo, vencimento: @renda_fixa.vencimento }
    assert_redirected_to renda_fixa_path(assigns(:renda_fixa))
  end

  test "should destroy renda_fixa" do
    assert_difference('RendaFixa.count', -1) do
      delete :destroy, id: @renda_fixa
    end

    assert_redirected_to renda_fixas_path
  end
end
