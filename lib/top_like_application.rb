Dir.glob(File.dirname(File.absolute_path(__FILE__)) + '/*.rb') do |file|
	require file unless file == __FILE__
end

Thread.abort_on_exception = true
main_threads = []

# Create the data schedule thread
scheduler_thread = Thread.new do
	Scheduler.instance.init
end
main_threads << scheduler_thread

# Create the user input thread
user_input_thread = Thread.new do
	user_input = UserInput.new
	user_input.get_input
end
main_threads << user_input_thread

# Run the program
main_threads.each { |t| t.join }