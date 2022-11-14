//
//  MainCoordinator.swift
//  Coordinator
//
//  Created by Александр Пархамович on 11.11.22.
//

import Combine
import UIKit

final class MainCoordinator {
    let window: UIWindow
    let rootNavigationController: UINavigationController
    private var cancellables: Set<AnyCancellable> = []
    
    init(window: UIWindow, rootNavigationController: UINavigationController) {
        self.window = window
        self.rootNavigationController = rootNavigationController
    }
    
    func start() {
        let view = MailnSignInView()
        let viewModel = MailnSignInViewModel()
        view.viewModel = viewModel
        
        viewModel.nextSubject.sink { [weak self] in
            self?.showScreen2()
        }.store(in: &cancellables)
    
        rootNavigationController.pushViewController(view, animated: true)
    }
    
    private func showScreen2() {
        let view = MainRegistrationView()
        let viewModel = MainRegistrationViewModel()
        view.viewModel = viewModel
    
        rootNavigationController.pushViewController(view, animated: true)
    }
    
}

