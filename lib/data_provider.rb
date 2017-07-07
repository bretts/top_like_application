class DataProvider

	def initialize
		@mutex = Mutex.new
	end

	def has_data?
		if(@data.nil?)
			return false
		else
			return true
		end
	end

	def get_data
		if(!has_data?)
			return nil
		else
			@mutex.synchronize do
				return @data.clone
			end
		end
	end

	def update_data
		raise "Classes inheriting from DataProvider must implement DataProvider#update_data. "+
			  "The implementation must call the private method DataProvider#__do_update_data__. "+
			  "Have a look at process_info_data.rb for an example on how to implement a data provider."

	end

	private
	def __do_update_data__(lambda)
		result = lambda.call
		@mutex.synchronize do
			@data = result
		end
	end
end