class JoinershipObserver < ActiveRecord::Observer
  def after_create(joinership)
    StatusMailer.delay.joiner_notification(joinership.bid)
  end
end
