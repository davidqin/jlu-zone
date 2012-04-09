module  Wiki::Models::Scores::AfterCreate
  def self.included(base)
    base.after_create :change_user_score
  end

  def change_user_score
    return if score_reach_the_standard_grade?
    user = self.fonder
    user.score += self.class.create_score

    self.fonder.send(time_method_name + "=", self.created_at)
    count = self.fonder.send(count_method_name)
    self.fonder.send(count_method_name + "=", count + 1)

    user.save
  end

  def score_reach_the_standard_grade?
    if !self.fonder.send(time_method_name)
      return false
    end

    if self.fonder.send(time_method_name).today? and self.fonder.send(count_method_name) < self.class.score_times
      return false
    end

    if not self.fonder.send(time_method_name).today?
      self.fonder.send(count_method_name + "=", 0)
      return false
    end

    return true
  end

  def time_method_name
    "today_last_#{self.model_type.to_s}_time"
  end

  def count_method_name
    "today_#{self.model_type.to_s}_count"
  end
end