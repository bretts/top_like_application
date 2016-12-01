Dir.glob(File.dirname(File.absolute_path(__FILE__)) + '/*') do |file|
	require file unless File.basename(file) == __FILE__
end