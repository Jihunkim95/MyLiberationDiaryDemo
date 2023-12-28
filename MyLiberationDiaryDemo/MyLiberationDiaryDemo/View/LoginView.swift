//
//  LoginView.swift
//  MyLiberationDiaryDemo
//
//  Created by 김지훈 on 2023/12/28.
//

import SwiftUI



struct LoginView: View {
    @ObservedObject var LoginVM = LoginViewModel()

    //navigationPath.append() 메서드를 사용하여 네비게이션을 관리
    @State private var navigationPath = NavigationPath()

    
    var body: some View {
        NavigationStack(path: $navigationPath){
            VStack {
 

                TextField("이메일", text: $LoginVM.loginInfo.email)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                    .keyboardType(.emailAddress)
                    .autocapitalization(.none)

                SecureField("비밀번호", text: $LoginVM.loginInfo.password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()

                HStack{
                    Button{
                        LoginVM.handleLogin()
                    }label: {
                        Text("로그인")
                    }
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.blue)
                    .cornerRadius(8)
                    .alert(isPresented: $LoginVM.showingAlert) {
                        Alert(title: Text("로그인 오류"), message: Text(LoginVM.alertMessage), dismissButton: .default(Text("확인")))

                    }
                    
                    NavigationLink(value: NavigationItem.signUp) {
                         Button {
                             navigationPath.append(NavigationItem.signUp)
                         }label: {
                             Text("회원가입")
                         }
                         .padding()
                         .foregroundColor(.white)
                         .background(Color.blue)
                         .cornerRadius(8)
                     }
                }
 
                
            }
            .navigationDestination(for: NavigationItem.self) { item in
                switch item {
                case .signUp:
                    SignUpView()
                }
            }
        }
        .navigationBarTitle("로그인")

    }

}


enum NavigationItem: Hashable {
    case signUp
}
