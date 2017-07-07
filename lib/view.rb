at_exit { SmoothTerminalPrint.new.stop_smooth_printing_mode; STDIN.echo = true; STDIN.cooked!}

require 'smooth_terminal_print'
require 'flexible_table'
require 'singleton'

class View
	include Singleton
	include TerminalUtils
	using TerminalUtils::Color

	def print_frame(data)
		if(data)
			table = FlexibleTable.new
			table.add_column(get_column_name(0), 10)
			table.add_column(get_column_name(1), 10)
			table.add_column(get_column_name(2), 80)

			SmoothTerminalPrint.new.print_smoothly do
				table.print_header

				data.each do |d|
					row = d.map { |e| e.to_s.fg_bright_black }
					table.print_row(*row)
				end
			end
		end
	end

	def get_column_name(index)
		name = ''

		case index
		when 0
			name = 'CPU'
		when 1
			name = 'Memory'
		when 2
			name = 'Command'
		else
			name = 'Unknown Name'
		end

		if(Model.instance.sort_by_index == index)
			if(Model.instance.reverse_sort == true)
				name = ("\u2207 " + name).bg_bright_green.fg_magenta.bold
			else
				name = ("\u2206 " + name).bg_bright_green.fg_magenta.bold
			end
		end

		return name
	end
end