module Wiki::Models::Topic
  module TopicTags

    def self.included(base)
      base.before_save :create_new_tags_not_exist
    end
    
    attr_accessor :tags_array
    attr_accessor :tag_string

    def tag_string
      names = self.tags.map {|tag| tag.name}
      names.join(', ')
    end

    protected

    def create_new_tags_not_exist

      return if self.tag_string.blank?
      tags_names = self.tag_string.to_s.split(/[,\s]+/).uniq
      tags_names.each do |name|
        tag = Tag.find_by_name(name)

        new_tag
        if self.tags.include?(tag)
          next
        else

        end
      end

      self.contact = self.contacts.find_by_name(self.contact_name)
      if self.contact
        return
      end

      new_contact = self.contacts.new({:name => self.contact_name })
      if new_contact.save
        self.contact = new_contact
      else
        self.contact = nil
      end
    end

  end
end