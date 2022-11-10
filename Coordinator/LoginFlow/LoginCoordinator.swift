//
//  LoginCoordinator.swift
//  Coordinator
//
//  Created by Александр Пархамович on 03.11.22.
//

import UIKit
import Combine


final class LoginCoordinator{
    let rootNavigationController: UINavigationController
    private var cancellable: Set<AnyCancellable> = []
    
    init(rootNavigationController: UINavigationController){
        self.rootNavigationController = rootNavigationController
    }
    func start(){
        let viewModel = SignInViewModel()
        let view = SignInView()
        view.viewModel = viewModel
        rootNavigationController.pushViewController(view, animated: true)
        
        viewModel.actionSubject
            .sink(receiveValue: { [weak self] in
                self?.showRegistrationScreen()
                
            })
            .store(in: &cancellable)
    }    
    private func showRegistrationScreen() {
       let viewModel = RegistrationViewModel()
        let view = RegistrationView()
        view.viewModel = viewModel
        rootNavigationController.pushViewController(view, animated: true)
        viewModel.actionSubject
            .sink(receiveValue: { [weak self] in
                self?.showNextScreen()
            })
            .store(in: &cancellable)
        
        
    }
    private func showNextScreen() {
       let viewModel = NextScreenViewModel()
        let view = NextScreenView()
        view.viewModel = viewModel
        rootNavigationController.pushViewController(view, animated: true)
    }
}
