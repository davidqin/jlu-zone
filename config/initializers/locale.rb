# tell the I18n library where to find your translations
I18n.load_path += Dir[Rails.root.join('config/locales/cn', '*.{rb,yml}')]
# set default locale to something other than :en
I18n.default_locale = :cn

def t(*arguments)
  I18n.t(*arguments)
end
