//
//  RegistrationView.swift
//  Coordinator
//
//  Created by Александр Пархамович on 03.11.22.
//

import UIKit
import Combine
import EasyAutolayout


final class RegistrationView: UIViewController{
    var viewModel: RegistrationViewModel!
    let buttonNextScreen = UIButton()
    private var cancellable: Set<AnyCancellable> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        titleName()
        buttonAddNextScreen()
        
    }
    
    private func titleName(){
        viewModel.titleSubject
            .sink { [weak self] title in
                self?.title = title
            }
            .store(in: &cancellable)
    }
    private func buttonAddNextScreen(){
        view.addSubview(buttonNextScreen)
        buttonNextScreen.pin.center(in: view)
        buttonNextScreen.setTitle("tap", for: .normal)
        buttonNextScreen.backgroundColor = .systemRed
        buttonNextScreen.addTarget(self, action: #selector(buttonDidTapped), for: .touchUpInside)
    }
    
    @objc func buttonDidTapped(){
    viewModel.actionSubject.send()
    }
}
