class NumberStamp < ActiveRecord::Observer
 
  class << self
     def model_class_list
      @model_class_list ||= []
    end

    def add_model_class_list(model_class)
      if self.model_class_list.include?(model_class)
        return
      end

      self.model_class_list << model_class
    end

    def number_prefix_list
      @number_prefix_list ||= {}
    end

    def add_number_prefix_list(number_prefix, model_class)
      if self.number_prefix_list[number_prefix]
        return
      end

      self.number_prefix_list[number_prefix] = model_class
    end

    def setup_number_stamp_config
      prefix_user  = 'user'
      prefix_topic = 'topic'
      prefix_entry = 'entry'
      prefix_tag   = 'tag'
      prefix_reply = 'reply'

      number_stamp_config = {
        prefix_user  => User,
        prefix_tag   => Tag,
        prefix_entry => Entry,
        prefix_reply => Reply,
        prefix_topic => Topic
      }
      number_stamp_config.each do |number_prefix, settings|
        case settings
        when Class
          model_class = settings
          options = {}
        when Array
          model_class = settings.first
          options = settings.second
        else
          raise ArgumentError, "The settings type expects either Class or Array, actually is #{settings.class}, value is #{settings}."
        end
        
        add_model_class_list model_class
        add_number_prefix_list number_prefix, model_class
      end

      self.observe *self.model_class_list
    end

  end

  setup_number_stamp_config

  def before_create(model)
    set_model_number_with_new_number model
  end

  private

  def set_model_number_with_new_number(model)
    
    return if model.number

    number_prefix = get_model_number_prefix(model)

    last_number = get_model_last_number(model)

    base_number = last_number || "#{number_prefix}000"

    new_number = generate_new_number(model, base_number, number_prefix)

    model.number = new_number
  end

  def generate_new_number(model, base_number, number_prefix)
   number_prefix_len = number_prefix.size
   base_number_order = base_number[number_prefix_len..-1]
   new_number_order  = base_number_order.next
   new_number        = number_prefix + new_number_order   
  end

  def get_model_number_prefix(model)
    self.class.number_prefix_list.each do |number_prefix, model_class|
      if model.is_a?(model_class)
        return number_prefix
      end
    end

    raise "Not find model number prefix, on NumberStamp::get_model_number_prefix" 
  end

  def get_model_last_number(model)
    last_model = model.class.order("created_at desc").first
    return last_model.number if last_model
    return nil
  end
end
