//
//  LaunchViewModel.swift
//  CHChess
//
//  Created by EZen on 2022/3/29.
//

import RxSwift
import RxCocoa
import PPILibrary

enum LaunchFlow {
    
    /// App 启动 初始化环节
    case initial
    /// 等待 IDFA 环节结束
    case idfa
    /// 检查更新
    case checkUpgrade
    /// 展示升级弹窗
    case showUpgrade(required: Bool, describe: String, link: String)
    /// 启动流程结束, 进入主界面
    case finished
}

public class LaunchViewModel: BaseViewModel, ViewModelType, ExitAppable {
    
    internal let launchFlow = BehaviorSubject<LaunchFlow>(value: .initial)
}

public extension LaunchViewModel {
    
    struct Input {
        let viewDidAppearOB: Observable<Void>
        let viewAppearActivedOB: Observable<Bool>
    }
    
    struct Output {
        //let enterAppDriver: Driver<Void>
    }
}


extension LaunchViewModel {
    
    public func transform(input: Input) -> Output {
        
        
        return Output()
    }
}

