require 'ostruct'
require 'async_data_provider'

class Model < AsyncDataProvider
	def initialize
		super()
		@time_retrieve_interval = 1
	end

	private
	def update_data(**args)
		begin
			struct                   = OpenStruct.new
			struct.process_info_data = ProcessInfoData.instance.get_data

			return struct
		rescue
			return @data
		end
	end
end