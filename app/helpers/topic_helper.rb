# coding: utf-8
module TopicHelper
  def show_topic_info(topic)
    # 节点那需要重构
    base_info       = time_ago(topic.created_at) + " 由 " + topic.fonder.nickname + " 在节点 " + topic.tag_string + " 中发起, " 
    reply_info      = ""
    reply_info      = " 最后由 " + topic.last_replier.nickname + " 于 " + time_ago(topic.last_reply.created_at).to_s + "回复, "  if topic.last_reply
    read_times_info = topic.read_times.to_s + "次阅读"
    base_info + reply_info + read_times_info
  end
end