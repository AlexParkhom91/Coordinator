//
//  LoginCoordinator.swift
//  Coordinator
//
//  Created by Александр Пархамович on 03.11.22.
//

import UIKit
import Combine


final class LoginCoordinator{
    let window: UIWindow
    let rootNavigationController: UINavigationController
    private var cancellable: Set<AnyCancellable> = []
    private var mainCoordinator: MainCoordinator?
    
    init(window: UIWindow, rootNavigationController: UINavigationController){
        self.window = window
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
        viewModel.nextFlowSubject
            .sink { [weak self] in
                self?.showMainScreen()
            }.store(in: &cancellable)
    }
    private func showRegistrationScreen() {
        let viewModel = RegistrationViewModel()
        let view = RegistrationView()
        view.viewModel = viewModel
        rootNavigationController.pushViewController(view, animated: true)
        
        
    }
    private func showMainScreen() {
        let viewModel = NextScreenViewModel()
        let view = NextScreenView()
        view.viewModel = viewModel
        
        viewModel.signInSubject.sink { [weak self] in
            self?.moveToMainFlow()
        }.store(in: &cancellable)
        
        rootNavigationController.pushViewController(view, animated: true)
    }
    
  private func moveToMainFlow() {
        rootNavigationController.popViewController(animated: false)
        let clearNavigationController = UINavigationController()
        window.rootViewController = clearNavigationController
        mainCoordinator = MainCoordinator(window: window, rootNavigationController: clearNavigationController)
        mainCoordinator?.start()
   }
}


