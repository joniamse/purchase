require "application_system_test_case"

class ItemCartsTest < ApplicationSystemTestCase
  setup do
    @item_cart = item_carts(:one)
  end

  test "visiting the index" do
    visit item_carts_url
    assert_selector "h1", text: "Item Carts"
  end

  test "creating a Item cart" do
    visit item_carts_url
    click_on "New Item Cart"

    fill_in "Quantity", with: @item_cart.quantity
    fill_in "Unit price", with: @item_cart.unit_price
    click_on "Create Item cart"

    assert_text "Item cart was successfully created"
    click_on "Back"
  end

  test "updating a Item cart" do
    visit item_carts_url
    click_on "Edit", match: :first

    fill_in "Quantity", with: @item_cart.quantity
    fill_in "Unit price", with: @item_cart.unit_price
    click_on "Update Item cart"

    assert_text "Item cart was successfully updated"
    click_on "Back"
  end

  test "destroying a Item cart" do
    visit item_carts_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Item cart was successfully destroyed"
  end
end
