//
//  NextScreenViewModel.swift
//  Coordinator
//
//  Created by Александр Пархамович on 09.11.22.
//

import Foundation
import Combine

final class NextScreenViewModel{
    let titleSubject = CurrentValueSubject<String, Never> ("Final Screen")
    let actionSubject = PassthroughSubject<Void, Never>()
}
