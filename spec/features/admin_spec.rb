require 'rails_helper'
feature 'Admin' do
  let(:admin) { create(:admin) }

  before do
    sign_in(admin)
  end

  scenario 'Creates a new category' do
    click_on 'Admin'
    click_on 'Create new Category'
    fill_in 'Name', with: 'Category 1'
    attach_file('Image', "#{Rails.root}/app/assets/images/backup.jpg")
    click_on 'Create Category'
    expect(page).to have_content('Category created successfully')
  end

  scenario 'Edits a new category' do
    create(:category)
    visit current_path
    click_on 'Edit'
    fill_in 'Name', with: 'Category 2'
    click_on 'Update Category'
    expect(page).to have_content('Category updated successfully')
  end

  scenario 'Deletes a new category' do
    create(:category)
    visit current_path
    click_on 'Delete'
    expect(page).to have_content('Category deleted successfully')
  end

  scenario 'Creates a new product' do
    create(:category)
    click_on 'Admin'
    click_on 'Create new Product'
    fill_in 'Name', with: 'Product 1'
    fill_in 'Price', with: '1'
    attach_file('Image', "#{Rails.root}/app/assets/images/backup.jpg")
    check 'Category 1'
    click_on 'Create Product'
    expect(page).to have_content('Product created successfully')
  end

  scenario 'Edits a new product' do
    category = create(:category)
    product = create(:product)
    category.products << product
    visit current_path
    click_on 'Category 1'
    click_on 'Edit'
    fill_in 'Name', with: 'Product 2'
    click_on 'Update Product'
    expect(page).to have_content('Product updated successfully')
  end

  scenario 'Deletes a new product' do
    category = create(:category)
    product = create(:product)
    category.products << product
    visit current_path
    click_on 'Category 1'
    click_on 'Delete'
    expect(page).to have_content('Product deleted successfully')
  end

  scenario 'Creates a new blog post' do
    click_on 'Admin'
    click_on 'Create new blog post'
    fill_in 'Title', with: 'Post 1'
    fill_in 'Body', with: 'Body 1'
    click_on 'Create Post'
    expect(page).to have_content('Post created successfully')
  end

  scenario 'Edits a new blog post' do
    create(:post)
    visit current_path
    click_on 'Read now'
    click_on 'Edit Post'
    fill_in 'Title', with: 'Post 2'
    click_on 'Update Post'
    expect(page).to have_content('Post updated successfully')
  end

  scenario 'Deletes a new blog post' do
    create(:post)
    visit current_path
    click_on 'Read now'
    click_on 'Delete Post'
    expect(page).to have_content('Post deleted successfully')
  end
end