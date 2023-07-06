//
//  LogView.swift
//  MyApp
//
//  Created by Raushan Kashyap on 05/07/23.
//

import SwiftUI

struct LogView: View {
    @State private var username: String = ""
    @State private var password: String = ""
    
    @State private var allowedLogin = true
    
    
    var body: some View {
        VStack {
            Text("Log In")
                .font(.largeTitle)
                .fontWeight(.heavy)
               .foregroundColor(Color.white)
                .padding([.top,.bottom],40)
            Image("twixourlogo")
                .resizable()
                .frame(width:200, height:200)
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.white, lineWidth: 6))
                .shadow(radius: 10)
                .padding(.bottom, 50)
            VStack(alignment: .leading, spacing: 15) {
                TextField("Username", text: $username)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(20.0)
                    .shadow(radius: 6, x:4, y: 4)
                    .shadow(radius: 6, x:-4, y: -4)
                SecureField("Password", text: $password)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(20.0)
                    .shadow(radius: 6, x:4, y: 4)
                    .shadow(radius: 6, x:-4, y: -4)
            }
            .padding([.leading, .trailing],27.5)
            Spacer()
            
            Button(action: {
                print("Logged In")
                allowedLogin = false
                
                    
            }) {
                Text("Sign In")
                    .font(.headline)
                    .fontWeight(.heavy)
                    .foregroundColor(.white)
                    .padding()
                    .frame(width:300, height: 50)
                    .background(Color.green)
                    .cornerRadius(15.0)
                    .shadow( radius: 6, x:4, y: 4)
                    .shadow(radius: 6, x:-4, y: -4)
            }
            // First check username is empty or not if empty returns true which means button .disabled gets true
            // If username.isEmpty returns false then we have another condition to check if password is empty or not
            // If password.isEmpty returns true then button .disabled gets true so you can't log in as the button is disabled
            // If password.isEmpty returns false then we have another condition to check Whether the user has already logged in? as we only want this button to be functional only once
            // so we have a variable named allowedLogin which is true in the beginning but once login is done becomes false so in this condition we negate the allowedLogin value
            .disabled(username.isEmpty ? true : (password.isEmpty ? true : !allowedLogin))
            Spacer()
        }
        .background(LinearGradient(gradient: Gradient(colors: [.purple, .blue]), startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(.all))
    }
}

struct LogView_Previews: PreviewProvider {
    static var previews: some View {
        LogView()
    }
}
