require 'rails_helper'
describe Message do
  describe '#create' do
    let(:message) { build(:message) }

    it 'メッセージを保存する' do
      expect(message).to be_valid
    end

    it 'バリデーションチェック：textが未入力では保存できない。' do
      message.text = ''
      message.valid?
      expect(message.errors[:text]).to include('を入力してください')
    end
  end
end
