require 'rails_helper'

RSpec.describe User, type: :model do
  let(:name) { "Taro" }
  let(:email) { "test@example.com" }
  let(:password) { "password" }
  let(:user) { User.new(name: name, email: email, password: password) }

  describe 'nameのバリデーション' do
    context '空欄の場合' do
      let(:name) { nil }
      it '無効である' do
        expect(user).not_to be_valid
      end
    end

    context '10文字以上の場合' do
      let(:name) { "a" * 11 }
      it '無効である' do
        expect(user).not_to be_valid
      end
    end

    context '正常値の場合' do
      it '有効である' do
        expect(user).to be_valid
      end
    end
  end

  describe 'emailのバリデーション' do
    context '空欄の場合' do
      let(:email) { nil }
      it '無効である' do
        expect(user).not_to be_valid
      end
    end

    context 'フォーマット不正の場合' do
      let(:email) { 'invalid' }
      it '無効である' do
        expect(user).not_to be_valid
      end
    end

    context '一意性が守られていない場合' do
      before { User.create!(name: "Other", email: email, password: password) }
      it '無効である' do
        expect(user).not_to be_valid
      end
    end
  end
end
