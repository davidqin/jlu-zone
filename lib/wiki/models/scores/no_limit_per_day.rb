module Wiki::Models::Scores::NoLimitPerDay
  def self.included(base)
    base.after_create :change_user_score
  end

  def change_user_score
    user = self.fonder
    user.score += self.class.create_score
    user.save
  end
end