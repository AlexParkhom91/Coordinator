//
//  RegistrationViewModel.swift
//  Coordinator
//
//  Created by Александр Пархамович on 03.11.22.
//

import Combine

final class RegistrationViewModel{
   
    let titleSubject = CurrentValueSubject<String, Never> ("Registration")
    let actionSubject = PassthroughSubject<Void, Never>()
    
 
}
