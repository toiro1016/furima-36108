require 'rails_helper'

RSpec.describe PurchaseInfomation, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.build(:item)
    @item.image = fixture_file_upload('app/assets/images/flag.png')
    @item.save
    @purchase = FactoryBot.build(:purchase_infomation, user_id: @user.id, item_id: @item.id)
    sleep 0.1
  end

  describe '商品の購入機能' do
    context '内容に問題がなければ購入ができる' do
      it 'postal_code, prefecture_id, municipality, address, phone_number、user_id, item_id、 tokenが存在すれば購入が出来る' do
        expect(@purchase).to be_valid
      end

      it 'building_nameがなくても購入ができる' do
        @purchase.building_name = ''
        @purchase.valid?
      end

      context '商品の購入ができない' do
        it 'user_idが無い場合は購入ができない' do
          @purchase.user_id = ''
          @purchase.valid?
          expect(@purchase.errors.full_messages).to include("User can't be blank")
        end

        it 'item_idがない場合は購入ができない' do
          @purchase.item_id = ''
          @purchase.valid?
          expect(@purchase.errors.full_messages).to include("Item can't be blank")
        end

        it 'postal_codeがない場合は購入ができない' do
          @purchase.postal_code = ''
          @purchase.valid?
          expect(@purchase.errors.full_messages).to include("Postal code can't be blank")
        end

        it 'postal_codeが3桁ハイフン４桁でない場合は購入ができない' do
          @purchase.postal_code = '4444-333'
          @purchase.valid?
          expect(@purchase.errors.full_messages).to include('Postal code is invalid')
        end

        it 'postal_codeが半角でない場合は購入ができない' do
          @purchase.postal_code = '４４４-３３３'
          @purchase.valid?
          expect(@purchase.errors.full_messages).to include('Postal code is invalid')
        end

        it 'shipping_addressがない場合は購入ができない' do
          @purchase.shipping_address_id = nil
          @purchase.valid?
          expect(@purchase.errors.full_messages).to include("Shipping address can't be blank")
        end

        it 'shipping_addressがない場合は購入ができない' do
          @purchase.shipping_address_id = 1
          @purchase.valid?
          expect(@purchase.errors.full_messages).to include("Shipping address can't be blank")
        end

        it 'municipalityがない場合は購入ができない' do
          @purchase.municipality = ''
          @purchase.valid?
          expect(@purchase.errors.full_messages).to include("Municipality can't be blank")
        end
        it 'addressがない場合は購入ができない' do
          @purchase.address = ''
          @purchase.valid?
          expect(@purchase.errors.full_messages).to include("Address can't be blank")
        end

        it 'phone_numberがない場合は購入ができない' do
          @purchase.phone_number = nil
          @purchase.valid?
          expect(@purchase.errors.full_messages).to include("Phone number can't be blank")
        end

        it 'phone_numberが9桁以下の場合は購入ができない' do
          @purchase.phone_number = '080123456'
          @purchase.valid?
          expect(@purchase.errors.full_messages).to include('Phone number is invalid')
        end

        it 'phone_numberが12桁以上の場合は購入ができない' do
          @purchase.phone_number = '080123456789'
          @purchase.valid?
          expect(@purchase.errors.full_messages).to include('Phone number is invalid')
        end

        it 'phone_numberが全角の場合は購入ができない' do
          @purchase.phone_number = '０８０１２３４５６７８'
          @purchase.valid?
          expect(@purchase.errors.full_messages).to include('Phone number is invalid')
        end

        it 'tokenがからの場合は購入ができない' do
          @purchase.token = ''
          @purchase.valid?
          expect(@purchase.errors.full_messages).to include("Token can't be blank")
        end
      end
    end
  end
end
