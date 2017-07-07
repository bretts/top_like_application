require 'singleton'

class Scheduler
	include Singleton

	def initialize
		@process_info_data = ProcessInfoData.instance

		@scheduler_threads = []
	end

	def init
		create_new_scheduler_thread(@process_info_data, 1)

		@scheduler_threads.each { |t| t.join }
	end

	private
	def create_new_scheduler_thread(data_provider, time_interval)
		@scheduler_threads << Thread.new do
			loop do
				data_provider.update_data

				if(data_provider.has_data?)
					Controller.instance.update_view
				end

				sleep time_interval
			end
		end
	end
end