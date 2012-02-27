class ActiveRecord::Base
  def model_type
    self.class.to_s.underscore.to_sym
  end

  def self.paging(params)
    params ||= {}
    paginate(:page => params[:page], :per_page => paging_per_page(params))
  end
end

class Symbol
  def pluralize
    self.to_s.pluralize
  end
end

class Object
  def call_object_method(methods)
    object = self
    unless object
      return
    end

    methods = Array.wrap(methods)
    if methods.count == 0
      return
    end

    first_method = methods.first
    unless first_method
      return
    end

    unless object.respond_to?(first_method)
      return
    end

    method_result = object.send(first_method)
    if methods.count <= 1
      return method_result
    else
      remaining_methods = methods.clone
      remaining_methods.shift
      return method_result.call_object_method(remaining_methods)
    end
  end
end

