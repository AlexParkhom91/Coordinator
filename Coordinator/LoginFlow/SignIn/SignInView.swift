//
//  SignInView.swift
//  Coordinator
//
//  Created by Александр Пархамович on 03.11.22.
//

import UIKit
import Combine
import EasyAutolayout

final class SignInView: UIViewController{
    
    var viewModel: SignInViewModel!
    let button = UIButton()
    private var cancellable: Set<AnyCancellable> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        viewModel.titleSubject
            .sink{ [weak self] title in
                   self?.title = title
            }
            .store(in: &cancellable)
        buttonAdd()
      
    }
    
    private func buttonAdd(){
        view.addSubview(button)
        button.pin.center(in: view)
        button.setTitle("tap", for: .normal)
        button.backgroundColor = .green
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }
    
    @objc func buttonTapped(){
        viewModel.actionSubject.send()
    }
}
