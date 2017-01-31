module ApplicationHelper
  # application_helper.rbに集約したメソッドには、apphelperを冠するものとする。
  # どこに記載されている処理なのかわかりにくくなるので。

  def apphelper_show_flash_massage(flash_alert, flash_notice) # javascriptを使用しない場合のflash
    if flash_alert
      content_tag('div', flash.now[:alert], class: 'flash_message--aleat')
    elsif flash_notice
      content_tag('div', flash.now[:notice], class: 'flash_message--notice')
    end
  end
end
