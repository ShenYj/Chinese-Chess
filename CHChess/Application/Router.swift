//
//  Router.swift
//  CHChess
//
//  Created by ShenYj on 2021/7/1.
//

import UIKit
import SafariServices

public struct Router {
    
    static var `default` = Router()
    
    /// 路由方式
    public enum Transition {
        
        case root(in: UIWindow, rootController: BaseViewController, needNavigator: Bool)
        case navigate(destination: BaseViewController)
        
        case push(destination: BaseViewController)
        case pop(toRoot: Bool, destination: BaseViewController?)
        case modal(presentationStyle: UIModalPresentationStyle, destination: BaseViewController, source: BaseViewController?, completion: (() -> Void)?)
        case modalInNavigator(presentationStyle: UIModalPresentationStyle, destination: BaseViewController, source: BaseViewController?, completion: (() -> Void)?)
        case dismiss(source: BaseViewController?, completion: (() -> Void)?)
        
        /// 暂未开放
        case alert
    }
    
    
    public enum Scene {
        
        /// 启动页
        case launch(viewModel: LaunchViewModel)
        /// 首页
//        case home(viewModel: HomeViewModel)

        /// 打开`Safari`
        case safari(link: URL)
        /// `App`内打开`SafariController`
        case safariController(link: URL)
        /// `WebView`
        case webController(link: URL)
    }
    
    /// `当前栈顶控制器`
    var stackTopViewController: BaseViewController? {
        guard let controller = _stackTopViewController as? BaseViewController else { return nil }
        return controller
    }
    fileprivate weak var _stackTopViewController: UIViewController?
    
    /// `Window`
    var keyWindow: UIWindow? { AppDelegate.default?.window }
}

public extension Router {
    
    /// 获取`Controller`
    static subscript(scene: Scene) -> BaseViewController {
        
        switch scene {
        case let .launch(viewModel):                return LaunchViewController(viewModel: viewModel)
//        case let .home(viewModel):                  return HomeViewController(viewModel: viewModel)
        default:                                    fatalError("未定义的页面")
        }
    }
}

public extension Router {
    
    mutating func navigate(transition: Transition) {
        
        switch transition {
        
        case let .root(window, rootController, needNavigator):
            _stackTopViewController = rootController
            switch needNavigator {
            case false:     window.rootViewController = rootController
            case true:      window.rootViewController = BaseNavigationController(rootViewController: rootController)
            }
            window.makeKeyAndVisible()
            
        case let .navigate(destination):
            /// 类似于`RN`那种路由方式, 当目标控制器在视图栈中存在的时候, 将当前控制器到目标类型控制器之间的全部控制器都移除, 相当于返回到同类型控制器下, 刷新数据
            fatalError("暂不支持: \(destination.className)")
            
        case let .push(destination):
            
            guard let navigation = stackTopViewController?.navigationController else { return }
            navigation.pushViewController(destination) { Router.default._stackTopViewController = destination }
            
        case let .pop(toRoot, destination):
            
            guard let navigation = _stackTopViewController?.navigationController, navigation.viewControllers.count > 1 else { return }
            
            if toRoot {
                navigation.popToRootViewController(animated: true)
                _stackTopViewController = navigation.viewControllers.first
                return
            }
            
            if let destination = destination {
                navigation.popToViewController(destination, animated: true)
                _stackTopViewController = destination
                return
            }
            
            navigation.popViewController(animated: true) { [weak navigation] in Router.default._stackTopViewController = navigation?.viewControllers.last }
            
        case let .modal(presentationStyle, destination, source, completion):
            
            destination.modalPresentationStyle = presentationStyle
            guard let source = source else {
                _stackTopViewController?.present(destination, animated: true, completion: completion)
                return
            }
            source.present(destination, animated: true, completion: completion)
        
        case let .modalInNavigator(presentationStyle, destination, source, completion):
            
            let navigation = BaseNavigationController(rootViewController: destination)
            navigation.modalPresentationStyle = presentationStyle
            guard let source = source else {
                _stackTopViewController?.present(navigation, animated: true, completion: completion)
                return
            }
            source.present(navigation, animated: true, completion: completion)
            
        case let .dismiss(source, completion):
            
            guard let source = source else {
                _stackTopViewController?.dismiss(animated: true, completion: completion)
                return
            }
            
            guard let presentingViewController = source.presentingViewController else {
                source.dismiss(animated: true, completion: completion)
                return
            }
            presentingViewController.dismiss(animated: true, completion: completion)
            
        case .alert:
            break
        }
    }
}
