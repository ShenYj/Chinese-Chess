//
//  LaunchViewController.swift
//  CHChess
//
//  Created by EZen on 2022/3/29.
//

import UIKit
import RxSwift
import RxCocoa
import RxOptional
import PPILibrary
import RxAppState

class LaunchViewController: BaseViewController {
    
}

extension LaunchViewController {
    
    override func bindViewModel() {
        super.bindViewModel()
        
        guard let viewModel = viewModel as? LaunchViewModel else { return }
        let viewDidAppear = rx.viewDidAppear.filter{ $0 }.share()
        let appActive = UIApplication.shared.rx.applicationDidBecomeActive.map{ $0 == .active }
        let viewAppearActivedOB: Observable<Bool> = Observable
            .combineLatest(viewDidAppear, appActive)
            .do(onNext: { log.debug("====>  IDFA 检查 [\($0) - \($1)]") })
            .map{ $0 && $1 }
            .filter{ $0 }
            .asObservable()
            .do(onNext: { _ in log.debug("====>  IDFA 检查") })
        
        let input = LaunchViewModel.Input(
            viewDidAppearOB: viewDidAppear.mapToVoid(),
            viewAppearActivedOB: viewAppearActivedOB
        )
        let output = viewModel.transform(input: input)
        
    }
}
