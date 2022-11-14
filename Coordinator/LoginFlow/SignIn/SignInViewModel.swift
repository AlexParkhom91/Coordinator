//
//  SignInViewModel.swift
//  Coordinator
//
//  Created by Александр Пархамович on 03.11.22.
//

import Combine

final class SignInViewModel{
    let titleSubject = CurrentValueSubject<String, Never>("Sign in")
    let actionSubject = PassthroughSubject<Void, Never>()
    let nextFlowSubject = PassthroughSubject<Void, Never>()
    
}

