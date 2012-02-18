I18n.load_path += Dir[Rails.root.join('config/locales/cn', '*.{rb,yml}')]

def itext(id, *args)
	I18n.t(id, *args)
end