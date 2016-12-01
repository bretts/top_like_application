require 'flexible_table'

class CommandLineOutput
	def print_data(app_data)
		table = FlexibleTable.new
		table.add_column("CPU", 10)
		table.add_column("Mem", 10)
		table.add_column("Command", 80)
		table.print_header

		if(app_data)
			if(app_data.process_info_data)
				app_data.process_info_data.each do |x|
					table.print_row(x[0], x[1], x[2])
				end
			end
		end

		return nil
	end
end