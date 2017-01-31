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

    # messege関連で使用するヘルパー
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

    # group関連で使用するヘルパー
    def grouphelper_show_error_data(message)
        if message
            content_tag('div', class: 'chat-group-form__errors') do
                concat content_tag('h2', message)
            end
        end
    end
end
