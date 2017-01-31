# Uncomment the next line to define a global platform for your project
platform :ios, '9.0'

target 'TestTask' do
  # Uncomment the next line if you're using Swift or would like to use dynamic frameworks
  # use_frameworks!

  # easy work with constraints
  pod 'Masonry'

  target 'TestTaskTests' do
    inherit! :search_paths
    
    # matching frameworkd for tests: expect(@"foo").to.equal(@"foo");
	pod 'Expecta', '~> 1.0'
	
    # mocking classes/protocols
    pod 'OCMock'
  end

end
