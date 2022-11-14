//
//  NextScreenView.swift
//  Coordinator
//
//  Created by Александр Пархамович on 09.11.22.
//

import UIKit
import Combine
import EasyAutolayout


final class NextScreenView: UIViewController{
    var viewModel: NextScreenViewModel!
    
    private var cancellable: Set<AnyCancellable> = []
     let nextScreenButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .gray
        setupUI()
        viewModel.titleSubject.sink { [weak self] value in
            self?.title = value
        }.store(in: &cancellable)
    }
    
    private func setupUI() {
        view.addSubview(nextScreenButton)
        nextScreenButton.pin
            .center(in: view)
        nextScreenButton.setTitle("Next flow >", for: .normal)
        nextScreenButton.setTitleColor(.black, for: .normal)
        nextScreenButton.addTarget(self, action: #selector(signInDidTapped), for: .touchUpInside)
    }
    
    @objc private func signInDidTapped() {
        viewModel.signInSubject.send()
    }
}
