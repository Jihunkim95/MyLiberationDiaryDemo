//
//  LoginViewModel.swift
//  MyLiberationDiaryDemo
//
//  Created by 김지훈 on 2023/12/28.
//

import Foundation

class LoginViewModel: ObservableObject{
    @Published var loginInfo = LoginInfo(email: "", password: "")
    @Published var showingAlert = false
    @Published var alertMessage = ""
    
    func handleLogin() {
        if !loginInfo.email.isValidEmail {
            alertMessage = "유효하지 않은 이메일 주소입니다."
            showingAlert = true
            return
        }

        if !loginInfo.password.isValidPassword {
            alertMessage = "비밀번호는 최소 8자 이상이어야 합니다."
            showingAlert = true
            return
        }

        // 유효성 검사를 통과한 경우, 로그인 처리 로직 구현
        print("로그인 시도: \(loginInfo.email)")
        // 여기에 로그인 처리 로직을 추가하세요.
    }
}

// 유효성 검사를 위한 확장
extension String {
    // 이메일 형식 검사
    var isValidEmail: Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: self)
    }

    // 비밀번호 길이 검사 (예: 최소 8자)
    var isValidPassword: Bool {
        return self.count >= 8
    }
}
