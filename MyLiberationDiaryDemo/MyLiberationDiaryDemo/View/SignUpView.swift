//
//  SignUpView.swift
//  MyLiberationDiaryDemo
//
//  Created by 김지훈 on 2023/12/28.
//
import SwiftUI

struct SignUpView: View {
    @ObservedObject var signUpVM = SignUpViewModel()

    var body: some View {
        VStack(spacing: 20) {
            Text("회원가입")
                .font(.largeTitle)
                .bold()

            TextField("이름", text: $signUpVM.signUpInfo.name)
                .textFieldStyle(RoundedBorderTextFieldStyle())

            TextField("이메일", text: $signUpVM.signUpInfo.email)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .keyboardType(.emailAddress)
                .autocapitalization(.none)

            SecureField("비밀번호", text: $signUpVM.signUpInfo.password)
                .textFieldStyle(RoundedBorderTextFieldStyle())

            SecureField("비밀번호 확인", text: $signUpVM.signUpInfo.confirmPassword)
                .textFieldStyle(RoundedBorderTextFieldStyle())

            Button("회원가입") {
                // 회원가입 로직 처리
            }
            .padding()
            .foregroundColor(.white)
            .background(Color.blue)
            .cornerRadius(8)
        }
        .padding()
    }


}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
