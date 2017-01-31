module MessagesHelper
  # message_helper.rbに集約したメソッドには、messagehelperを冠するものとする。
  # どこに記載されている処理なのかわかりにくくなるので。

  def messagehelper_nil_check(last_message) # メッセージまたは画像が未投稿の場合の表示
      if last_message.nil?
          'まだメッセージはありません'
      elsif last_message.text.length == 0
          '画像が投稿されました。'
      else
          last_message.text
      end
  end

  def messagehelper_image_mount(message_id, image_url) # イメージファイルの表示
      if image_url.length != 0 #イメージファイルが存在する時
          image_tag("#{image_url}")
      end
  end
end
