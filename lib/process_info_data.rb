require 'singleton'
require 'simple_process_runner'

class ProcessInfoData < DataProvider
	include Singleton

	def initialize
		super()
	end

	def update_data
		lamb = lambda do
			process = SimpleProcessRunner.run_process(['ps', 'ax', '-o', '%cpu,%mem,command'])
			exit_code, stdout, stderr = process.wait

			result = []
			stdout.split("\n").each_with_index do |line, index|
				next if index == 0

				array   = line.strip!.split(" ")
				current = []
				current << array.shift.to_f.round(2)
				current << array.shift.to_f.round(2)
				current << array.join(" ")

				result << current
			end

			return result
		end

		__do_update_data__(lamb)
	end
end