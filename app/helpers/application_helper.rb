module ApplicationHelper
    # application_helper.rbに集約したメソッドには、apphelperを冠するものとする。
    # どこに記載されている処理なのかわかりにくくなるので。

    def apphelper_show_flash_massage(flash_alert, flash_notice)
        if flash_alert
            content_tag('div', flash.now[:alert], class: 'flash_message--aleat')
        elsif flash_notice
            content_tag('div', flash.now[:notice], class: 'flash_message--notice')
        end
    end

    # messege関連で使用するヘルパー
    def messagehelper_nil_check(last_message)
        if last_message.nil?
            'まだメッセージはありません'
        else
            last_message.text
        end
    end

    # group関連で使用するヘルパー
    def grouphelper_show_error_data(message)
        if message
            content_tag('div', class: 'chat-group-form__errors') do
                concat content_tag('h2', message)
            end
        end
    end
end
