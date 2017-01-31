require 'rails_helper'
describe MessagesController do
  let(:user) { create(:user) }
  let(:group) { create(:group) }
  let(:message) { create(:message, group_id: group.id, user_id: user.id) }

  describe 'ログインしていない場合' do
    before do # 前提条件
      sign_out user
    end

    describe 'POST #create' do
      it '未ログインでのmessage投稿は、ユーザログイン画面にリダイレクトする' do
        post :create, params: { message: attributes_for(:message), group_id: group, user_id: user }
        expect(response).to redirect_to new_user_session_path
      end
    end

    describe 'GET #index' do
      it '未ログインでのindex閲覧は、ユーザログイン画面にリダイレクトする' do
        get :index, params: { group_id: group }
        expect(response).to redirect_to new_user_session_path
      end
    end
  end

  describe 'ログイン済みの場合' do
    before do # 前提条件
      sign_in user
    end

    after do # 事後処理
      sign_out user
    end

    describe 'POST #create' do
      describe 'メッセージ投稿テスト/正常動作' do
        it '事後データ件数[増]確認' do
          expect do
            post :create, params: { message: attributes_for(:message), group_id: group, user_id: user }
          end.to change(Message, :count).by(1)
        end

        it '事後画面遷移（redirect_to group_messages_path）' do
          post :create, params: { message: attributes_for(:message), group_id: group, user_id: user }
          expect(response).to redirect_to group_messages_path
        end

        it '事後flash(notice)' do
          sign_in user
          post :create, params: { message: attributes_for(:message), group_id: group, user_id: user }
          expect(:notice).not_to be_empty
        end
      end

      describe 'メッセージ投稿テスト/異常動作' do
        describe 'バリデーションチェック_message.text' do
          it '事後データ件数[無変化]確認' do
            expect do
              post :create, params: { message: attributes_for(:message, :nil_text), group_id: group, user_id: user }
            end.not_to change(Message, :count)
          end

          it '事後画面遷移（redirect_to group_messages_path）' do
            post :create, params: { message: attributes_for(:message, :nil_text), group_id: group, user_id: user }
            expect(response).to redirect_to group_messages_path
          end

          it '事後flash(alert) ' do
            post :create, params: { message: attributes_for(:message, :nil_text), group_id: group, user_id: user }
            expect(:alert).not_to be_empty
          end
        end
      end
    end

    describe 'GET #index' do
      it 'indexアクションで取得する、groupデータのチェック' do
        get :index, params: { group_id: group, user_id: user }
        expect(assigns(:group)).to match(group)
      end

      it 'indexテンプレートへの遷移' do
        get :index, params: { group_id: group }
        expect(response).to render_template :index
      end
    end
  end
end
