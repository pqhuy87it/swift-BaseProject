platform :ios, '12.0'
use_frameworks!
inhibit_all_warnings!

# Add Application pods here
def app_pods
    pod 'Alamofire'
    pod 'RealmSwift'
    # pod 'AlamofireImage', '~> 4.0'
    # pod 'AsyncSwift', '~> 2.0'
    # pod 'Device', '~> 3.0'
    # pod 'DynamicColor', '~> 4.0'
    # pod 'Eureka', '~> 5.0'
    # pod 'Fabric', '~> 1.10.2'
    # pod 'Crashlytics', '~> 3.14.0'
    # (Recommended) Pod for Google Analytics
    # pod 'Firebase/Analytics'
    # pod 'KeychainAccess', '~> 4.0'
    # pod 'NVActivityIndicatorView', '~> 4.0'
    # pod 'R.swift', '~> 5.0.2'
    # pod 'RxCocoa', '~> 5.0'
    # pod 'RxSwift', '~> 5.0'
    # pod 'SwiftDate', '~> 6.0'
    # pod 'SwiftyUserDefaults', '~> 5.0'
    # pod 'Action', '~> 4.0'
end

def testing_pods
    pod 'Quick', '~> 2.0'
    pod 'Nimble', '~> 8.0'
end

target 'BaseProject' do
  app_pods
end

target 'BaseProjectTests' do
  testing_pods
end

target 'BaseProjectUITests' do
  testing_pods
end
