# encoding: utf-8

class ImageFileUploader < CarrierWave::Uploader::Base
    include CarrierWave::MiniMagick

    # MiniMagickによるファイルリサイズ
    process resize_to_fit: [200, 200]

    # アップローダ選択:
    storage :file
    # storage :fog

    # Rails.root/public/ 配下にファイルが配置される
    def store_dir
        # 例 /home/projects/chat-space/public/uploads/image/message/image_url/148/gazou_0092.jpg
        "uploads/image/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
    end

    # 許可する拡張子
    def extension_white_list
        %w(jpg jpeg gif png)
    end
end
