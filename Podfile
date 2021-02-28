# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

# ignore all warnings from all pods
inhibit_all_warnings!

target 'GenPerson' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for GenPerson
    pod 'RealmSwift', :inhibit_warnings => true
    pod 'SwiftLint', '~> 0.39', :inhibit_warnings => true
    pod 'Kingfisher', '~> 5.13.2', :inhibit_warnings => true
    pod 'R.swift', '~> 5.1.0', :inhibit_warnings => true
    pod 'IQKeyboardManagerSwift', '~> 6.5.4', :inhibit_warnings => true
    
  target 'GenPersonTests' do
    inherit! :search_paths
    # Pods for testing
    pod 'Quick', '2.2.0', :inhibit_warnings => true
    pod 'Nimble', '8.0.4', :inhibit_warnings => true
    pod 'SnapshotTesting', '~> 1.7.2', :inhibit_warnings => true
  end

  target 'GenPersonUITests' do
    # Pods for testing
  end

end
