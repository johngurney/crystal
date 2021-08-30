class Development < ApplicationRecord
  has_many :events
  has_many :assignedkeywords

  # Action text: https://blog.saeloun.com/2019/10/01/rails-6-action-text.html
  has_rich_text :description
end
