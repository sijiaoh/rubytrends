# == Schema Information
#
# Table name: posts
#
#  id          :bigint           not null, primary key
#  title       :string(255)      not null
#  content     :text(65535)      not null
#  published   :boolean          default(FALSE), not null
#  user_id     :bigint           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  hashid      :string(255)
#  editor_type :integer          default("textarea"), not null
#
class Post < ApplicationRecord
  include HashidSluggable
  include EditorTypeEnum
  include HasContent

  belongs_to :user

  validates :title, presence: true

  before_create :set_editor_type_from_user

  private

  def set_editor_type_from_user
    self.editor_type = user.setting.editor_type
  end
end
