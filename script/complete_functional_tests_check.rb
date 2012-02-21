$LOAD_PATH << '/home/david/Documents/wiki/test'

Contorller_root_folder  = 'app/controllers'
Test_root_folder        = 'test/functional/'
Ignore_controller_names = ['application_controller']

#add fo format: Ignore_action_names << ['payments/purchase_payings_controller',    'create']
Ignore_action_names     = []
Ignore_action_names    << ['payments/purchase_payings_controller',    'create']
Ignore_action_names    << ['payments/purchase_receivings_controller', 'create']
Ignore_action_names    << ['payments/sale_payings_controller',        'create']
Ignore_action_names    << ['payments/sale_receivings_controller',     'create']

def get_all_file_names
  files = Dir["#{Contorller_root_folder}/**/*.rb"]
  names = []
  files.each do |file|
    names << file.sub("#{Contorller_root_folder}/", '').sub(".rb", '')
  end
  names - Ignore_controller_names
end

def get_class(file_name)
  file_name.camelize.constantize
end

def get_test_class(file_name)
  test_file_name = file_name + "_test"
  test_file_name.camelize.constantize
end

def remove_useless_actions(actions, a_class)
  actions.delete_if do |action_name|
    condition_one   = action_name.to_s.scan(/_one_time/).length != 0 
    condition_two   = action_name.to_s.scan(/_callback_before_/).length != 0
    condition_three = Ignore_action_names.include?([a_class.name.underscore, action_name.to_s])
    condition_one || condition_two || condition_three
  end
end

def find_functional_test_file(file_name)
  test_file = "functional/#{file_name}_test.rb"
  begin 
    require test_file
  rescue LoadError
    puts "Can not find the test file: -> #{test_file}"
    return false
  end
  return true
end 

def get_class_actions(a_class)
  all_public_actions = a_class.public_instance_methods(false)
  actions = remove_useless_actions(all_public_actions, a_class)
  actions.map! {|action| action.to_s}
end

class Array
  def have_an_action_name_begin_wiht?(prefix)
    self.each do |item|
      return true if item.scan(prefix).length != 0
    end
    false
  end
end

def matching_check(test_action_name_prefix, test_actions, file_name)
  unless test_actions.have_an_action_name_begin_wiht?(test_action_name_prefix)
    puts "Can't find the #{test_action_name_prefix} in #{Test_root_folder}#{file_name}_test.rb."
  end
end

def one_controller_complete_tests_chekc(controller_actions, test_actions, file_name)
  controller_actions.each do |action|
    case action
    when "create", "destroy", "update"
      matching_check(action + "_successfully", test_actions, file_name)
      matching_check(action + "_failed", test_actions, file_name)
    else
      matching_check(action, test_actions, file_name)
    end
  end
end

def complete_tests_check

  #eg: bills/sales_controller
  controller_file_names = get_all_file_names

  controller_file_names.each do |file_name|
    current_controller_class = get_class(file_name)
    next unless find_functional_test_file(file_name)
    current_controller_test_class = get_test_class(file_name)

    #stop auto test run
    @@stop_auto_run    = true
    controller_actions = get_class_actions(current_controller_class)
    test_actions       = get_class_actions(current_controller_test_class)

    one_controller_complete_tests_chekc(controller_actions, test_actions, file_name)
  end
end

complete_tests_check
