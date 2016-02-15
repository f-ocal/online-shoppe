require 'rails_helper'

RSpec.feature "Products", type: :feature, js: true do
  let(:product) {
    Product.create(title: "Soccer ball",
                              description: "Nike soccer ball manufactured in China",
                              price: "25.50",
                              quantity: "30",
                              picture: "http://vignette2.wikia.nocookie.net/legomessageboards/images/3/34/Cute-Dog-Desktop-HD-Wallpaper.jpg/revision/latest?cb=20131020221612")
  }

  context 'a guest user' do
    it 'can see the page title' do
      visit root_path
      expect(page).to have_content("New Product List of items in Our Store")
    end

    describe 'filling out a form' do
      let(:title) { "This is my first productwerwr" }
      let(:description) { "Selling an umbrella" }
      
      it 'can submit a new product and see it rendered on the page' do
        visit new_product_path
        fill_in 'Title', with: title
        attach_file 'Picture', "#{Rails.root}/spec/fixtures/product.jpeg"
        fill_in 'Description', with: description
        fill_in 'Quantity', with: 5
        fill_in 'Price', with: 25.99
        click_button 'Save Product'
        expect(page).to have_content "Thanks for entering a new product called #{title}"
        expect(page).to have_content description
      end
    end

  end
end
