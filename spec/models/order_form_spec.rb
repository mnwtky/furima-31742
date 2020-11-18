require 'rails_helper'

RSpec.describe OrderForm, type: :model do
  describe '#crete' do
    before do
      @order_form = FactoryBot.build(:order_form)
    end

    it "tokenとpostal_code, prefecuture_idとcity, addressesとphone_numberがあれば保存ができること" do
      expect(@order_form).to be_valid
    end
    it "tokenが空では登録できないこと" do
      @order_form.token = nil
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include("Token can't be blank")
    end
    it "郵便番号が必須であること" do
      @order_form.postal_code = nil
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include("Postal code can't be blank")
    end
    it "prefecture_idが1のときに登録できないこと" do
      @order_form.prefecture_id = 1
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include("Prefecture select")
    end
    it "市区町村が必須であること" do
      @order_form.city = nil
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include("City can't be blank")
    end
    it "番地が必須であること" do
      @order_form.addresses = nil
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include("Addresses can't be blank")
    end
    it "電話番号が必須であること" do
      @order_form.phone_number = nil
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include("Phone number can't be blank")
    end
    it "郵便番号にはハイフンが必要であること（123-4567となる）" do
      @order_form.postal_code = '1234567'
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
    end
    it "電話番号にはハイフンは不要で、11桁以内であること（09012345678となる）" do
      @order_form.phone_number = '9012345678'
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include("Phone number Input only number")
    end
    it "電話番号にはハイフンは不要で、12桁以上だと購入できないこと" do
      @order_form.phone_number = '90123456789'
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include("Phone number Input only number")
    end
  end
end
