class Event < ApplicationRecord
  belongs_to :development
  has_rich_text :description

  def policy_action_string
    self.policy_action ? "Action" : "Policy"
  end
end
