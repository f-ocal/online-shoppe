require 'rails_helper'

RSpec.describe Product, type: :model do
  let(:no_title_product) { Product.new(picture: 'http://vignette2.wikia.nocookie.net/legomessageboards/images/3/34/Cute-Dog-Desktop-HD-Wallpaper.jpg/revision/latest?cb=20131020221612',
                              description: 'lakshd',
                              price: '12.20',
                              quantity: 10)}

  let(:no_description_product) { Product.new(picture: 'http://vignette2.wikia.nocookie.net/legomessageboards/images/3/34/Cute-Dog-Desktop-HD-Wallpaper.jpg/revision/latest?cb=20131020221612',
                            title: 'lakshd',
                            price: '12.20',
                            quantity: 10)}

 let(:no_given_quantity_product) { Product.new(picture: 'http://vignette2.wikia.nocookie.net/legomessageboards/images/3/34/Cute-Dog-Desktop-HD-Wallpaper.jpg/revision/latest?cb=20131020221612',
                          description: 'lakshd',
                          price: '12.20')}

  let(:no_given_price_product) { Product.new(picture: 'http://vignette2.wikia.nocookie.net/legomessageboards/images/3/34/Cute-Dog-Desktop-HD-Wallpaper.jpg/revision/latest?cb=20131020221612',
                          description: 'lakshd',
                          quantity: 10)}

  let(:no_uploaded_picture_product) { Product.new(title: 'lakshd',
                                                description: 'lakshd',
                                                price: '12.20',
                                                quantity: 10)}

  let(:no_valid_price_product) { Product.new(title: 'lakshd',
                                            picture: 'http://vignette2.wikia.nocookie.net/legomessageboards/images/3/34/Cute-Dog-Desktop-HD-Wallpaper.jpg/revision/latest?cb=20131020221612',
                                            description: 'lakshd',
                                            price: '-12',
                                            quantity: 10)}

  describe 'validations' do
    context 'will raise an error' do
      it 'if title is missing' do
        no_title_product.save
        expect(no_title_product.errors[:title]).to include("can't be blank")
      end

      it 'if description is missing' do
        no_description_product.save
        expect(no_description_product.errors[:description]).to include("can't be blank")
      end

      it 'if quantity is missing' do
        no_given_quantity_product.save
        expect(no_given_quantity_product.errors[:quantity]).to include("can't be blank")
      end

      it 'if price is missing' do
        no_given_price_product.save
        expect(no_given_price_product.errors[:price]).to include("can't be blank")
      end

      it 'if picture is missing' do
        no_uploaded_picture_product.save
        expect(no_uploaded_picture_product.errors[:picture]).to include("can't be blank")
      end
    end
  end

  describe 'checks if given price is valid' do
    it 'raises an error if negative price is given' do
      expect(no_valid_price_product.save).to eq false
    end
  end
end
