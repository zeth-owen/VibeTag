//
//  ProfileView.swift
//  VibeTag
//
//  Created by Zeth Thomas on 3/9/25.
//

import AuthenticationServices
import SwiftUI

struct ProfileView: View {
    
    @Environment(\.colorScheme) var colorScheme
    
    @AppStorage("email") var email: String = ""
    @AppStorage("firstName") var firstName: String = ""
    @AppStorage("LastName") var lastName: String = ""
    @AppStorage("userId") var userId: String = ""
    
    var body: some View {
        NavigationView {
            VStack {
                Text("What's your vibe?")
                    .font(.title)
                    .fontWeight(.bold)
                if userId.isEmpty {
                    SignInWithAppleButton(.continue){ request in
                        request.requestedScopes = [.email,
                                                   .fullName]
                    } onCompletion: { result in
                        switch result {
                        case .success(let auth):
                            switch auth.credential {
                            case let credential as ASAuthorizationAppleIDCredential:
                                //Only saved information sfter authentiction
                                let userId = credential.user
                                //Needs cached
                                let email = credential.email
                                let firstName = credential.fullName?.givenName
                                let lastName = credential.fullName?.familyName
                                self.userId = userId
                                self.email = email ?? ""
                                self.firstName = firstName ?? ""
                                self.lastName = lastName ?? ""
                            default:
                                break
                            }
                        case .failure(let error):
                            print(error)
                        }
                    }
                    .signInWithAppleButtonStyle(
                        colorScheme == .dark ? .white : .black
                    )
                    .frame(height:50)
                    .padding()
                    .cornerRadius(8)
                    Button("Create an account"){}
                    
                        .frame(height: 50)
                        .padding(.horizontal)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                        .font(.system(size: 17, weight: .medium))
                } else {
                    Text("Welcome back!")
                    Text("\(firstName), \(lastName)")
                }
            }
        }
    }
}

#Preview {
    ProfileView()
}
