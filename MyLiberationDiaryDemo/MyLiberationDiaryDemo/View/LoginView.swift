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
                    //NavigationLink에서 value로 NavigationItem.signUp을 전달하고
                    //navigationDestination(for:content:) 모디파이어를 사용하여 각 대상에 대한 뷰를 제공
                    //이렇게 하면 각 네비게이션 항목에 대한 뷰를 동적으로 결정
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
