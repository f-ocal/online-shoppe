require 'rails_helper'

RSpec.describe ProductsController do

  let(:product) do
    create_product
  end

  def create_product
    Product.create!(
      title: 'a title',
      description: 'blah blah blah',
      price: 25.50,
      quantity: 30,
      picture: "http://vignette2.wikia.nocookie.net/legomessageboards/images/3/34/Cute-Dog-Desktop-HD-Wallpaper.jpg/revision/latest?cb=20131020221612"
    )
  end

  describe "#index" do
    before(:each) do
      @all_products = 5.times.map do |n|
        create_product
      end
    end

    it "loads all products" do
      get :index
      expect(assigns[:products]).to eq @all_products
      expect(response.status).to eq 200
      expect(response).to have_rendered(:index)
    end
  end

  describe 'index create' do
    context 'when given valid params' do

      let :product_params do
        { title: "Soccer ball",
        description: "Nike soccer ball manufactured in China",
        price: "25.50",
        quantity: "30",
        picture: "http://vignette2.wikia.nocookie.net/legomessageboards/images/3/34/Cute-Dog-Desktop-HD-Wallpaper.jpg/revision/latest?cb=20131020221612"}

      end

      it 'should create the product and redirect to specific product page' do
        expect{
          post :create, product: product_params
          }.to change{Product.count}.by(1)
          expect(assigns[:product]).to be_a Product
          expect(response).to redirect_to("/admin/products/#{Product.last.id}")
      end

    end

    context 'when given invalid params' do
      let :product_params do
        {price: "25.50",
        quantity: "30",
        picture: "http://vignette2.wikia.nocookie.net/legomessageboards/images/3/34/Cute-Dog-Desktop-HD-Wallpaper.jpg/revision/latest?cb=20131020221612"}
      end

      it "shouldn't create the product and re-render the new page" do
        expect{
          post :create, product: product_params
          }.to_not change{Product.count}
          expect(assigns[:product]).to be_a Product
          expect(response).to have_rendered(:new)
          expect(response.status).to eq 200
      end
    end
  end

  describe 'update product' do
    let :product_params do
      { title: "Basketball",
        description: "Adidas basketball manufactured in USA",
        price: 50.00,
        quantity: 10,
        picture: fixture_file_upload('product.jpeg', 'image/jpeg')
      }
    end

    it 'updates the product and redirect to product page' do
      pic = product.picture.dup

      patch :update, product: product_params, id: product.id

      product.reload
      expect(product.title).to eq(product_params[:title])
      expect(product.description).to eq(product_params[:description])
      expect(product.price).to eq(product_params[:price])
      expect(product.quantity).to eq(product_params[:quantity])
      expect(product.picture_updated_at).to be_within(2.seconds).of(Time.now)
      expect(product.picture).not_to eq(pic)
      expect(response).to redirect_to(@product)
    end
  end

  describe '#delete' do
    context 'with logged out user' do
      it 'does not allow the user to delete'
      it 'redirects to home'
    end

    context 'with logged in user' do
      it 'allows the user to delete'
      it 'redirects to home'
    end

    context 'with logged in admin' do
      it 'allows the admin to delete'
      it 'redirects to admin index'
    end

    let!(:product) {create_product}

    it 'decrements products by one' do
      expect do
        delete :destroy, id: product.id
      end.to change{Product.count}.by(-1)
    end

    it 'redirects to the root path' do
      delete :destroy, id: product.id
      expect(response).to redirect_to root_path
    end
  end

end
