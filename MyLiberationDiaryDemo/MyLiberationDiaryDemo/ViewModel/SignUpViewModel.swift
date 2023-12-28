//
//  SignUpViewModel.swift
//  MyLiberationDiaryDemo
//
//  Created by 김지훈 on 2023/12/28.
//

import SwiftUI


class SignUpViewModel: ObservableObject{
    @Published var signUpInfo = SignUpInfo(name: "",email: "", password: "", confirmPassword: "")

    @Published var showingAlert = false
    @Published var alertMessage = ""
    
    func validateSignUpInfo() -> Bool {
        guard !signUpInfo.name.isEmpty else {
            alertMessage = "이름을 입력해주세요."
            showingAlert = true
            return false
        }

        guard signUpInfo.email.isValidEmail else {
            alertMessage = "유효하지 않은 이메일 주소입니다."
            showingAlert = true
            return false
        }

        guard signUpInfo.password.count >= 8 else {
            alertMessage = "비밀번호는 최소 8자 이상이어야 합니다."
            showingAlert = true
            return false
        }

        guard signUpInfo.password == signUpInfo.confirmPassword else {
            alertMessage = "비밀번호가 일치하지 않습니다."
            showingAlert = true
            return false
        }

        return true
    }


}

