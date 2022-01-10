class Post < ApplicationRecord
  before_save :escape_content

  belongs_to :user

  private

  def escape_content
    self.content = Loofah.fragment(content).scrub!(:escape).to_s
  end
end
