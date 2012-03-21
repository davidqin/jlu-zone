# coding: utf-8
class MarkDown
  def self.format(text)
    text = self.formater.render(text)
    self.link_mention_user(text)
    self.link_mention_floor(text)
    return text
  rescue => e
    puts "Markdown.format failed. Because: #{e}!"
    return text
  end

  def self.find_association_users(text)
    users = text.scan(self.find_user_regexp)
    users.collect {|user| user[1]}
  end

  private

  def self.formater
    Redcarpet::Markdown.new(
    Redcarpet::Render::HTML,
    :autolink => true, 
    :space_after_headers => true, 
    :fenced_code_blocks => true,
    :no_intra_emphasis => true, 
    :hard_wrap => true, 
    :strikethrough =>true)
  end

  def self.link_mention_floor(text)
    text.gsub!(/#(\d+)([楼Ff])/) { 
    %(<a href="#reply#{$1}" class="at_floor" data-floor="#{$1}">##{$1}#{$2}</a>)}
  end

  # convert '@user' to link
  # match any user even not exist.
  def self.link_mention_user(text)
    text.gsub!(self.find_user_regexp) { 
    %(#{$1}<a href="/users/#{$2}" class="at_user" title="@#{$2}"><i>@</i>#{$2}</a>)}
  end

  def self.find_user_regexp
    /(^|[^a-zA-Z0-9_!#\$%&*@＠])@([a-zA-Z0-9_]{1,20})/io
  end
end
