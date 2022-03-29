//
//  LaunchViewModel.swift
//  CHChess
//
//  Created by EZen on 2022/3/29.
//

import RxSwift
import RxCocoa
import PPILibrary

public class LaunchViewModel: BaseViewModel, ViewModelType, ExitAppable { }

public extension LaunchViewModel {
    
    struct Input {
        let viewDidAppearTrigger: Signal<Void>
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

