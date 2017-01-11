require 'rails_helper'
describe Message do
    describe '#create' do
        it 'メッセージを保存する' do
            message = build(:message)
            expect(message).to be_valid
        end

        it 'バリデーションチェック：テキストが未入力では保存できない。' do
            message = build(:message, text: '')
            message.valid?
            expect(message.errors[:text]).to include('を入力してください')
        end
    end
end
