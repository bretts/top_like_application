require 'singleton'

class Model
	include Singleton

	def initialize
		@process_info_data = ProcessInfoData.instance

		@sort_by_index     = 0
		@reverse_sort      = true
		@num_model_columns = 0
	end
	attr_reader :sort_by_index, :reverse_sort

	def read
		result = @process_info_data.get_data

		result.sort_by! { |array| array[@sort_by_index] }
		result.reverse! if @reverse_sort
		@num_model_columns = result[0].length

		return result
	end

	def update(sort_by_index: nil, reverse_sort: nil)
		if(sort_by_index)
			@sort_by_index = sort_by_index unless (sort_by_index < 0 || sort_by_index > (@num_model_columns - 1))
		end

		if(reverse_sort)
			if(reverse_sort == 0)
				@reverse_sort = false
			elsif(reverse_sort == 1)
				@reverse_sort = true
			end
		end
	end
end