//
//  UserRegistrationViewModel.swift
//  BUAASCSE
//

import Foundation
import Combine

class UserregistrationViewModel:ObservableObject {
    // 输入
    @Published var name = ""
    @Published var password = ""
    @Published var passwordConfirm = ""
    // 输出
    @Published var isNameLengthVaild = false
    @Published var isPasswordLengthVaild = false
    @Published var isPasswordCapitalLetter = false
    @Published var isPasswordComfirmValid = false
    
    private var cancellabelSet:Set<AnyCancellable> = []
    
    init() {
        $name
            .receive(on: RunLoop.main)
            .map { name in
                return name.count >= 4
            }
            .assign(to: \.isNameLengthVaild, on: self)
            .store(in: &cancellabelSet)
        
        $password
            .receive(on: RunLoop.main)
            .map { password in
                return password.count >= 8
            }
            .assign(to: \.isPasswordLengthVaild, on: self)
            .store(in: &cancellabelSet)
        
        $password
            .receive(on: RunLoop.main)
            .map { password in
                let pattern = "[A-Z]"
                if let _ = password.range(of: pattern, options: .regularExpression) {
                    return true
                } else {
                    return false
                }
            }
            .assign(to: \.isPasswordCapitalLetter, on: self)
            .store(in: &cancellabelSet)
        
        Publishers.CombineLatest($password, $passwordConfirm)
            .receive(on: RunLoop.main)
            .map { (password, passwordConfirm) in
                return !passwordConfirm.isEmpty && (passwordConfirm == password)
            }
            .assign(to: \.isPasswordComfirmValid, on: self)
            .store(in: &cancellabelSet)
    }
}
