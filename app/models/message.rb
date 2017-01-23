class Message < ApplicationRecord
  belongs_to :user
  belongs_to :group

  validates :text, presence: true

  def created_at_Prepared
      output = created_at.strftime('%Y/%m/%d/ %H:%M:%S')
      return output
  end

end
