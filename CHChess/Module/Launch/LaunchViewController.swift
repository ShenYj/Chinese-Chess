//
//  LaunchViewController.swift
//  CHChess
//
//  Created by EZen on 2022/3/29.
//

import UIKit
import PPILibrary
import RxViewController

internal class LaunchViewController: BaseViewController {
    
}

extension LaunchViewController {
    
    override func bindViewModel() {
        
        guard let viewModel = viewModel as? LaunchViewModel else { return }
        
        let input = LaunchViewModel.Input(
            viewDidAppearTrigger: rx.viewDidAppear.mapToVoid().asSignal(onErrorJustReturn: ())
        )
        let output = viewModel.transform(input: input)
        
    }
}
