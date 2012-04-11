module Wiki
  module Controllers
    module TabsHighLight
      module Base
        def self.included(base)
          base.before_filter :set_menu_active
        end

        def set_menu_active
          @current = nil
        end
      end

      module Wiki
        def set_menu_active
          @current = ['/wiki']
        end
      end

      module Users
        def set_menu_active
          @current = ['/users/menu']
        end
      end

      module Community
        def set_menu_active
          @current = ['/community']
        end
      end

      module Photos
        def set_menu_active
          @current = ['/photos']
        end
      end

      module Home
        def set_menu_active
          @current = ['/']
        end
      end
    end
  end
end
