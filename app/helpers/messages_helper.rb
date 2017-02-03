module MessagesHelper
  # message_helper.rbに集約したメソッドには、messagehelperを冠するものとする。
  # どこに記載されている処理なのかわかりにくくなるので。

  def messagehelper_nil_check(last_message) # メッセージまたは画像が未投稿の場合の表示
    if last_message.nil?
      'まだメッセージはありません'
    elsif last_message.text.empty?
      '画像が投稿されました。'
    else
      last_message.text
    end
  end

  def messagehelper_image_mount(image_url) # イメージファイルの表示
    image_tag(image_url.to_s) if image_url # イメージファイルが存在する時
  end
end
