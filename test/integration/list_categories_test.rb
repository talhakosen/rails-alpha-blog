require 'test_helper'
class ListCategoriesTest < ActionDispatch::IntegrationTest
  def setup
    @category = Category.create(name: "books")
    @category_2 = Category.create(name: "musics")
  end

  test "should show category listing" do
    get categories_path
    assert_template 'categories/index'

    assert_select "a[href=?]",category_path(@category), text: @category.name
    assert_select "a[href=?]",category_path(@category_2), text:@category_2.name
  end
end