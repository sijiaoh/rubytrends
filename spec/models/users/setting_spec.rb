# == Schema Information
#
# Table name: users_settings
#
#  id          :bigint           not null, primary key
#  user_id     :bigint           not null
#  editor_type :integer          not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
require "rails_helper"

RSpec.describe Users::Setting do
  pending "add some examples to (or delete) #{__FILE__}"
end
