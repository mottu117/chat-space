class Message < ApplicationRecord
    belongs_to :user
    belongs_to :group

    validates :text, presence: true

    def created_at_Prepared
        output = created_at.strftime('%Y/%m/%d/ %H:%M:%S')
        output
    end

    def as_json(_options = {})
        super(methods: [:created_at_Prepared],
              include: {
                  user: { only: ['nickname'] }
              }
        )
    end
end
