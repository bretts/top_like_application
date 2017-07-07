class UserInput

	def initialize
		@model      = Model.instance
		@controller = Controller.instance
	end

	def read_char
		STDIN.echo = false
		STDIN.raw!

		input = STDIN.getc.chr
		if input == "\e" then
			input << STDIN.read_nonblock(3) rescue nil
			input << STDIN.read_nonblock(2) rescue nil
		end

		return input
	end

	def get_input
		loop do
			char = read_char

			# Exit if 'q' or CTRL-C is sent
			if ['q', "\u0003"].any? { |c| c == char }
				exit 0
			end

			case char
			when "\e[A"
				#UP ARROW
				@model.update(reverse_sort: 0)
				@controller.update_view
			when "\e[B"
				#DOWN ARROW
				@model.update(reverse_sort: 1)
				@controller.update_view
			when "\e[C"
				#RIGHT ARROW
				@model.update(sort_by_index: @model.sort_by_index + 1)
				@controller.update_view
			when "\e[D"
				#LEFT ARROW
				@model.update(sort_by_index: @model.sort_by_index - 1)
				@controller.update_view
			end
		end
	end
end