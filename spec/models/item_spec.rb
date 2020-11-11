require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#crete' do
    before do
      @item = FactoryBot.build(:item)
      @item.image = fixture_file_upload("/files/IMG_4300.jpg")
    end

    it "nameとdescription, category_idとcondition_id, postage_payer_idとprefecture_id, handling_idとprice, imageが存在すれば登録できること" do
      expect(@item).to be_valid
    end
    it "商品画像を1枚つけることが必須であること" do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end
    it "商品名が必須であること" do
      @item.name = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end
    it "商品の説明が必須であること" do
      @item.description = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Description can't be blank")
    end
    it "category_idが1のときに登録できないこと" do
      @item.category_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Category select")
    end
    it "condition_idが1のときに登録できないこと" do
      @item.condition_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Condition select")
    end
    it "postage_payer_idが1のときに登録できないこと" do
      @item.postage_payer_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Postage payer select")
    end
    it "prefecture_idが1のときに登録できないこと" do
      @item.prefecture_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Prefecture select")
    end
    it "handling_idが1のときに登録できないこと" do
      @item.handling_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Handling select")
    end
    it "販売価格についての情報が必須であること" do
      @item.price = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end
    it "価格の範囲が、¥299以下だと保存できないこと" do
      @item.price = 299
      @item.valid?
      expect(@item.errors.full_messages).to include("Price out of setting range")
    end
    it "価格の範囲が、¥10000000を超えると保存できないこと" do
      @item.price = 10000000
      @item.valid?
      expect(@item.errors.full_messages).to include("Price out of setting range")
    end
    it "販売価格は半角数字のみ保存可能であること" do
      @item.price = '１０００'
      @item.valid?
      expect(@item.errors.full_messages).to include("Price Half-width number")
    end
  end
end
