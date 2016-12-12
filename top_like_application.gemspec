Gem::Specification.new do |s|
	s.name        = 'top_like_application'
	s.version     = '0.0.1'
	s.date        = '2016-11-30'
	s.summary     = "Top Like Application"
	s.description = "This is an example of how you would build a Top like application using Ruby"
	s.authors     = ["Brett Sykes"]
	s.email       = 'bsykes@akamai.com'
	s.homepage    = 'https://github.com/bretts/'
	s.files       = Dir.glob("{lib}/**/*")
	s.executables = ["top_like_application"]
	s.license     = 'MIT'

	s.add_runtime_dependency 'flexible_table', '~> 0.0'
	s.add_runtime_dependency 'smooth_terminal_print', '~> 2.2'
	s.add_runtime_dependency 'async_data_provider', '~> 0.0'
	s.add_runtime_dependency 'simple_process_runner', '~> 0.0'
end