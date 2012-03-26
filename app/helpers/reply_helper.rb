module ReplyHelper
  def reply_editor_avatar(reply)
    replier = reply.replier
    tag(:img, :alt => '', :src => gravatar(replier.email, 48))
  end
end