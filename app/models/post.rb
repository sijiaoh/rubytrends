# == Schema Information
#
# Table name: posts
#
#  id         :bigint           not null, primary key
#  title      :string(255)      not null
#  content    :text(65535)      not null
#  published  :boolean          default(FALSE), not null
#  user_id    :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  hashid     :string(255)
#
class Post < ApplicationRecord
  include HashidSluggable

  belongs_to :user

  validates :title, presence: true

  before_save :escape_content

  private

  def escape_content
    self.content = Loofah.fragment(content).scrub!(:escape).to_s
  end
end
