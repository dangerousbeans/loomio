class NotificationItems::MembershipRequested < NotificationItem
  attr_accessor :notification

  def initialize(notification)
    @notification = notification
  end

  def actor
    notification.eventable.requester || LoggedOutUser.new
  end

  def action_text
    I18n.t('notifications.membership_requested')
  end

  def title
    notification.eventable.group_name
  end

  def group_full_name
    notification.eventable.group_name
  end

  def linkable
    [ notification.eventable.group, :manage_membership_requests]
  end
end
