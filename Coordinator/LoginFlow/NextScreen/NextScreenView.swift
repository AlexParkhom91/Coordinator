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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        viewModel.titleSubject
            .sink { [weak self] title in
                self?.title = title
            }
            .store(in: &cancellable)
    }
    
}

