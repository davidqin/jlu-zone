# coding: utf-8
module TopicHelper
  def show_topic_info(topic)
    itext("entry.entry_info", :versions => entry.history_versions_size, :gap => entry.updated_at.strftime("%Y-%m-%d"))
    "9天前 由 iwinux 在 Gem 节点 中发起
    最后由 iwinux 于18分钟前回复 , 83次阅读"
  end
end