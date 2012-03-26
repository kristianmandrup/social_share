module SocialShare
	module Rails
		class Engine < ::Rails::Engine
			initializer 'rails setup' do
				# add view helpers
				ActionView::Base.send :include, SocialShare::ViewHelpers
			end			
		end
	end
end