# Uncomment the next line to define a global platform for your project
source 'https://cdn.cocoapods.org/'

platform :ios, '15.0'
inhibit_all_warnings!
install! 'cocoapods',
  :warn_for_unused_master_specs_repo => false
  
def testing_pods
  pod 'Quick'
  pod 'RxNimble', :git => 'https://github.com/RxSwiftCommunity/RxNimble.git', :subspecs => ['RxBlocking', 'RxTest']
  pod 'XcodeCoverage','~>1.4.0'
  pod 'RxAtomic', :modular_headers => true
end

def libs_rx_swift
  # Core & Derived library
  pod 'RxTheme', :git => 'https://github.com/RxSwiftCommunity/RxTheme.git', :tag => '6.0.0'
  pod 'RxRealm', :git => 'https://github.com/RxSwiftCommunity/RxRealm', :tag => 'v5.0.2'
  pod 'RxFlow', :git => 'https://github.com/RxSwiftCommunity/RxFlow.git', :tag => '2.12.2'
  pod 'RxBinding', :git => 'https://github.com/RxSwiftCommunity/RxBinding.git', :tag => '0.5'
  pod 'RxKeyboard', :git => 'https://github.com/RxSwiftCommunity/RxKeyboard', :tag => '2.0.0'
  pod 'RxLocalizer', :git => 'https://github.com/RxSwiftCommunity/RxLocalizer.git', :tag => '1.7.0'
end

def libs_forme
  pod 'PPILibrary',
    :subspecs => [
        'Core',
        'Tool/Base',
        'Tool/Log',
        'Tool/Cache',
        'Tool/Security',
        'Tool/Deserialize/ObjectMapper',
        'UI/Colour',
        'Rx/Net/Moya',
        'Rx/UI/Dialog',
        'Rx/UI/MVVM',
        'Rx/UI/Extension',
        'Rx/UI/Animate'
      ],
    :git => 'https://github.com/ShenYj/PPILibrary.git',
    :commit => '9aaab0d'
end

def libs_widgets_pods
  pod 'SkeletonView', :git => 'https://github.com/Juanpe/SkeletonView.git', :tag => '1.12.1'
  pod 'NVActivityIndicatorView', '~> 5.1.1'
  pod 'TextAttributes', '~> 2.0.2'
  pod 'SVProgressHUD', '~> 2.2.5'
end

def libs_tools_pods
  pod 'SwiftyFitsize', '~> 1.1.0'
  pod 'FaceAware', '~> 2.1.0'
  pod 'SwiftyImage', '~> 1.6.0'
end

def libs_for_diagnosis
  pod 'DoraemonKit/Core', '~> 3.1.2', :configurations => ['debug']
end

target 'CHChess' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!
  # Pods for CHChess
  libs_forme
  libs_widgets_pods
  libs_tools_pods
end

target 'CHChess-Develop' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!
  # Pods for CHChess
  libs_forme
  libs_widgets_pods
  libs_tools_pods
end



post_install do |installer|
  
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |configuration|
      #configuration.build_settings['EXPANDED_CODE_SIGN_IDENTITY'] = ""
      #configuration.build_settings['CODE_SIGNING_REQUIRED'] = "NO"
      #configuration.build_settings['CODE_SIGNING_ALLOWED'] = "NO"
      configuration.build_settings['SWIFT_VERSION'] = "5.6"
      #configuration.build_settings['ALWAYS_EMBED_SWIFT_STANDARD_LIBRARIES'] = 'NO'
      configuration.build_settings['ENABLE_BITCODE'] = 'YES'
      if ( configuration.build_settings['IPHONEOS_DEPLOYMENT_TARGET'].to_f < 15.0 )
        configuration.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '15.0'
      end
    end
    
    if target.name == 'PPILibrary'
      target.build_configurations.each do |config|
        puts "#### config.name: ####  #{config.name}"
#        puts "#### config: ####  #{config}"
#        if config.name == 'Debug'
#          #config.build_settings['OTHER_SWIFT_FLAGS'] ||= ['-D', 'DEBUG_FILE_LOG']
#          config.build_settings['SWIFT_ACTIVE_COMPILATION_CONDITIONS'] = "$(inherited) DEBUG_FILE_LOG"
#        end
      end
    end
    
    if target.name == 'RxSwift'
      puts "#### target.name: ####  #{target.name}"
      target.build_configurations.each do |config|
        if config.name == 'DEBUG' || config.name == 'RxSwift'
          config.build_settings['OTHER_SWIFT_FLAGS'] ||= ['-D', 'TRACE_RESOURCES']
        end
      end
    end
    
  end
end
