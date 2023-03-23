//
//  Signup.swift
//  QueueMaster
//
//  Created by Adi Amoyal on 23/03/2023.
//

import SwiftUI

struct Signup: View {
    
    @State var name: String = ""
    @State var email: String = ""
    @State var password: String = ""
    @State var confirmPassword: String = ""
    
    var body: some View {
        ZStack {
            Color.theme.background
            
            VStack() {
                Title()
                Spacer()
                
                VStack(spacing: 10) {
                    CustomTextField(title: "Full Name", text: $name)
                    CustomTextField(title: "Email", text: $email)
                    CustomTextField(title: "Password", text: $password)
                    CustomTextField(title: "Confirm Password", text: $confirmPassword)
                    
                    HStack {
                        Spacer()
                        LoginBtn(text: "SIGN UP")
                            .offset(x: 18)
                    }
                }
                
                Spacer()
                LoginContent()
                    .padding(30)
            }
            .padding(.horizontal, 30)
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct Title: View {
    var body: some View {
        HStack {
            Text("Create Account")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            Spacer()
        }
        .padding(.top, 20)
    }
}

struct LoginContent: View {
    var body: some View {
        HStack {
            Text("Already have an account?")
                .foregroundColor(Color.theme.secondaryText)
            NavigationLink(destination: Login()) {
                Text("Sign in")
                    .foregroundColor(Color.theme.green)
            }
            
        }
        .fontWeight(.semibold)
    }
}

struct Signup_Previews: PreviewProvider {
    static var previews: some View {
        Signup()
    }
}
