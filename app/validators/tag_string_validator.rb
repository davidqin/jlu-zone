class TagStringValidator < ActiveModel::EachValidator
  def initialize(options)
    binding.pry
    options[:limit] ||= 5
    super
  end

  def validate_each(record, attribute, value)
    binding.pry
    if value.to_s.split(/[,\s]+/).uniq.count > options[:limit]
      record.errors.add(attribute, :tag_string, options)
    end
  end
end
