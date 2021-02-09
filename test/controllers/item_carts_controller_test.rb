require "test_helper"

class ItemCartsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @item_cart = item_carts(:one)
  end

  test "should get index" do
    get item_carts_url
    assert_response :success
  end

  test "should get new" do
    get new_item_cart_url
    assert_response :success
  end

  test "should create item_cart" do
    assert_difference('ItemCart.count') do
      post item_carts_url, params: { item_cart: { quantity: @item_cart.quantity, unit_price: @item_cart.unit_price } }
    end

    assert_redirected_to item_cart_url(ItemCart.last)
  end

  test "should show item_cart" do
    get item_cart_url(@item_cart)
    assert_response :success
  end

  test "should get edit" do
    get edit_item_cart_url(@item_cart)
    assert_response :success
  end

  test "should update item_cart" do
    patch item_cart_url(@item_cart), params: { item_cart: { quantity: @item_cart.quantity, unit_price: @item_cart.unit_price } }
    assert_redirected_to item_cart_url(@item_cart)
  end

  test "should destroy item_cart" do
    assert_difference('ItemCart.count', -1) do
      delete item_cart_url(@item_cart)
    end

    assert_redirected_to item_carts_url
  end
end
