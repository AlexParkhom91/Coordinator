//
//  MainRegistrationView.swift
//  Coordinator
//
//  Created by Александр Пархамович on 11.11.22.
//

import UIKit
import Combine
import EasyAutolayout

final class MainRegistrationView: UIViewController {
    var viewModel: MainRegistrationViewModel!
    private var cancellables: Set<AnyCancellable> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .red
        viewModel.titleSubject.sink { [weak self] value in
            self?.title = value
        }
    }
    
}
