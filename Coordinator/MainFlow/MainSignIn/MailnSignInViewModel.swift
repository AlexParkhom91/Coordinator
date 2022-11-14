//
//  MailnSignInViewModel.swift
//  Coordinator
//
//  Created by Александр Пархамович on 11.11.22.
//

import Combine

final class MailnSignInViewModel {

let titleSubject = CurrentValueSubject<String, Never>("Screen 1")
let nextSubject = PassthroughSubject<Void, Never>()
}

