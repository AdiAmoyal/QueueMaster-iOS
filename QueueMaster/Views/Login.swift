//
//  Login.swift
//  QueueMaster
//
//  Created by Adi Amoyal on 23/03/2023.
//

import SwiftUI

struct Login: View {
    
    @State var email: String = ""
    @State var password: String = ""
    
    var body: some View {
        ZStack {
            Color.theme.background
            
            VStack() {
                WelcomeContent()
                    .padding(.top, 60)
                
                Spacer()
                
                VStack(spacing: 15) {
                    CustomTextField(title: "Email", text: $email)
                    CustomTextField(title: "Password", text: $password)
                    
                    HStack() {
                        Spacer()
                        LoginBtn(text: "LOGIN")
                            .offset(x: 18)
                    }
                }
                
                Spacer()
                
                SignupContent()
                    .padding(.bottom, 30)
            }
            .padding(.horizontal, 30)
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct WelcomeContent: View {
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("Welcome Back")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(Color.theme.accent)
                
                Text("Please sign in to continue.")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundColor(Color.theme.secondaryText)
            }
            Spacer()
        }
    }
}

struct SignupContent: View {
    var body: some View {
        HStack {
            Text("Don't have an account?")
                .foregroundColor(Color.theme.secondaryText)
            
            NavigationLink(destination: Signup()) {
                Text("Sign up")
                    .foregroundColor(Color.theme.green)
            }
            .transition(.asymmetric(insertion: .move(edge: .trailing), removal: .move(edge: .leading)))
        }
        .fontWeight(.semibold)
    }
}

struct Login_Previews: PreviewProvider {
    static var previews: some View {
        Login()
    }
}
