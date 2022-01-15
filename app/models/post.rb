class Post < ApplicationRecord
  belongs_to :user

  validates :title, presence: true

  before_save :escape_content

  private

  def escape_content
    self.content = Loofah.fragment(content).scrub!(:escape).to_s
  end
end
