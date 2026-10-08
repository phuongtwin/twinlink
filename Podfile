platform :ios, '15.0'

target 'Twin Link' do
  use_frameworks!

  # AdMob Base & Mediation Adapters
  pod 'GoogleMobileAdsMediationInMobi'
  pod 'GoogleMobileAdsMediationVungle'
  pod 'GoogleMobileAdsMediationChartboost'
  pod 'ChartboostSDK'
end


# Unified post-install hook to enforce both deployment target and dSYM extraction rules
post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      
      # 1. Enforce a unified iOS deployment baseline across all framework dependencies
      config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '15.0'
      
      # 2. Force the generation and compilation of dSYM symbols for Release builds
      if config.name == 'Release'
        config.build_settings['DEBUG_INFORMATION_FORMAT'] = 'dwarf-with-dsym'
      end
      
    end
  end
end
