module Wiki
  module Controllers
    module Sidebar
      module CommonSidebar
        def self.included(base)
          base.helper_method :controller_sidebar_path
          base.helper_method :action_sidebar_path
        end

        def controller_sidebar_path
          "#{sidebar_folder}/sidebar"
        end

        def action_sidebar_path
          "#{sidebar_folder}/sidebar_#{action_name}"
        end
  
        def sidebar_folder
          class_name = self.class.name
          class_name_key = class_name.sub(/Controller$/, '')
          class_name_key.underscore
        end
      end

      module WikiSidebar
        def sidebar_folder
          'wiki'
        end
      end

      module UserSidebar
        def sidebar_folder
          'users'
        end
      end

      module HomeSidebar
        def sidebar_folder
          ''
        end
      end
    end
  end
end
