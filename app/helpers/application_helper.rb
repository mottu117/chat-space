module ApplicationHelper
  # application_helper.rbに集約したメソッドには、apphelperを冠するものとする。
  # どこに記載されている処理なのかわかりにくくなるので。

  def apphelper_show_flash_massage(flash_alert,flash_notice)
    if flash_alert != nil
      content_tag("div", flash.now[:alert], class: "flash_message--aleat")
    elsif flash_notice != nil
      content_tag("div", flash.now[:notice], class: "flash_message--notice")
    end
  end

  def apphelper_show_text_boolean(true_text,false_text)
    if true_text
      true_text
    else
      false_text
    end
  end
end
