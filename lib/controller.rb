require 'singleton'

class Controller
	include Singleton

	def initialize
		@ui_thread = init_user_input_control
		@pc_thread = init_program_flow_control
	end

	def init_controller
		@pc_thread.join
	end

	private
	def init_user_input_control
		t = Thread.new do
			loop do
				char = STDIN.getch.downcase

				if (char == 'q' || char == "\e" || char == "\u0003")
					SmoothTerminalPrint.new.stop_smooth_printing_mode
					exit
				end
			end
		end

		return t
	end

	def init_program_flow_control
		t = Thread.new do
			loop do
				View.instance.print_frame(Model.instance.get_data)
				sleep 1
			end
		end

		return t
	end
end