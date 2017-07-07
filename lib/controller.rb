require_relative 'model'
require_relative 'view'
require 'singleton'

class Controller
	include Singleton

	def update_view
		data = Model.instance.read

		View.instance.print_frame(data)
	end
end