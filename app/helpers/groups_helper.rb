module GroupsHelper
  # groups_helper.rbに集約したメソッドには、grouphelperを冠するものとする。
  # どこに記載されている処理なのかわかりにくくなるので。
    def grouphelper_show_error_data(message)
        if message
            content_tag('div', class: 'chat-group-form__errors') do
                concat content_tag('h2', message)
            end
        end
    end
end
