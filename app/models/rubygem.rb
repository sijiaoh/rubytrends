class Rubygem < ApplicationRecord
  has_many :daily_summaries, dependent: :destroy
end
