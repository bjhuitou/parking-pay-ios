# Uncomment this line to define a global platform for your project
platform :ios, '11.0'

source 'https://gitee.com/mirrors/CocoaPods-Specs.git'

target 'ParkingPay' do
  # Uncomment this line if you're using Swift or would like to use dynamic frameworks
  use_frameworks!
  pod 'TBEmptyDataSet', '2.7'
  pod 'DTTableViewManager', '6.3.0'
  pod 'MJRefresh', '3.1.15'
  pod 'R.swift', '5.2.2'
  pod 'KRProgressHUD', '3.4.0'
  pod 'StatusProvider', '1.2.10'
  pod 'AsyncSwift', '2.0.4'
  pod 'SwiftEventBus', '3.0.1'

end

post_install do |installer|
    installer.pods_project.targets.each do |target|
        if ['PMHTTP'].include? target.name
            target.build_configurations.each do |config|
                config.build_settings['SWIFT_VERSION'] = '4.0'
            end
            else
            target.build_configurations.each do |config|
                config.build_settings['SWIFT_VERSION'] = '4.2'
            end
        end
    end
end
