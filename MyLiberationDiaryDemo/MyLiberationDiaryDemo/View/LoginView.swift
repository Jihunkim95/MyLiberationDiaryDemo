//
//  LoginView.swift
//  MyLiberationDiaryDemo
//
//  Created by 김지훈 on 2023/12/28.
//

import SwiftUI



struct LoginView: View {
    @ObservedObject var LoginVM = LoginViewModel()

    var body: some View {
        VStack {
            Text("로그인")
                .font(.largeTitle)
                .bold()

            TextField("이메일", text: $LoginVM.loginInfo.email)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
                .keyboardType(.emailAddress)
                .autocapitalization(.none)

            SecureField("비밀번호", text: $LoginVM.loginInfo.password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            Button("로그인") {
                LoginVM.handleLogin()
            }
            .padding()
            .foregroundColor(.white)
            .background(Color.blue)
            .cornerRadius(8)
            .alert(isPresented: $LoginVM.showingAlert) {
                Alert(title: Text("로그인 오류"), message: Text(LoginVM.alertMessage), dismissButton: .default(Text("확인")))

            }
        }
        .padding()
    }

}


