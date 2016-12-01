require 'async_data_provider'
require 'simple_process_runner'

class ProcessInfoData < AsyncDataProvider

	def initialize
		super()
		@time_retrieve_interval = 1
	end

	private
	def update_data(**args)
		begin
			process = SimpleProcessRunner.run_process(['ps', 'ax', '-o', '%cpu,%mem,command'])
			exit_code, stdout, stderr = process.wait

			return (((stdout.split("\n")[1..-1]).map { |x| x.strip!; x.split(" ") }).sort! { |a, b| a[0] <=> b[0] }).reverse!
		rescue
			return @data
		end
	end
end