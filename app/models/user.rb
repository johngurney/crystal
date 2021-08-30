class User < ApplicationRecord
  def name
    self.first_name.to_s + " " + self.last_name.to_s
  end

  def isuser?
    self.status == "User"
  end

  def isadmin?
    self.status == "Admin"
  end

  def iscurator?
    self.status == "Curator"
  end
end
