module ReplyHelper
  def reply_editor_avatar(reply)
    replier = reply.fonder
    tag(:img, :alt => '', :src => gravatar(replier.email, 48))
  end
end