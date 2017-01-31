class Message < ApplicationRecord
    belongs_to :user
    belongs_to :group
    mount_uploader :image_url, ImageFileUploader

    # validates

    # テキストかイメージファイルのどちらかが必須。
    validates :text_or_image_url, presence: true

    # methods

    def created_at_Prepared
        created_at.strftime('%Y/%m/%d/ %H:%M:%S')
    end

    def as_json(_options = {})
        super(methods: [:created_at_Prepared],
              include: {
                  user: { only: ['nickname'] }
              }
        )
    end

    private

    def text_or_image_url
        text.presence || image_url.presence
    end
end
