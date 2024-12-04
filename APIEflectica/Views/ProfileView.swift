//
//  ProfileView.swift
//  APIEflectica
//
//  Created by Анна on 03.12.2024.
//

import SwiftUI

struct ProfileView: View {
    @State private var user: UserProfile = UserProfile(
        firstName: "John",
        lastName: "Doe",
        email: "john.doe@example.com",
        avatar: UIImage(named: "avatar_placeholder")
    )
    @State private var isEditing: Bool = false
    @State private var showSettings: Bool = false
    @State private var selectedImage: UIImage?
    
    var body: some View {
        NavigationView {
            VStack {
                // Avatar or default icon
                if let avatar = user.avatar {
                    Image(uiImage: avatar)
                        .resizable()
                        .frame(width: 100, height: 100)
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color.white, lineWidth: 4))
                        .shadow(radius: 10)
                } else {
                    Image(systemName: "person.circle.fill")
                        .resizable()
                        .frame(width: 100, height: 100)
                        .overlay(Circle().stroke(Color.white, lineWidth: 4))
                        .shadow(radius: 10)
                }
                
                // Name and email
                Text("\(user.firstName) \(user.lastName)")
                    .font(.largeTitle)
                    .padding(.top, 20)
                
                Text(user.email)
                    .font(.subheadline)
                    .padding(.top, 5)
                
                Spacer()
                
                // Edit Profile Button
                Button(action: {
                    isEditing.toggle()
                }) {
                    Text("Edit Profile")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(width: 200, height: 50)
                        .background(Color.blue)
                        .cornerRadius(10)
                }
                .sheet(isPresented: $isEditing) {
                    EditProfileView(user: $user, selectedImage: $selectedImage)
                }
            }
            .padding()
            .navigationBarTitle("Profile", displayMode: .inline)
            .navigationBarItems(trailing: Button(action: {
                showSettings.toggle()
            }) {
                Image(systemName: "gear")
            })
        }
        .sheet(isPresented: $showSettings) {
            SettingsView()
        }
    }
}

struct SettingsView: View {
    var body: some View {
        Text("Settings")
            .font(.largeTitle)
    }
}

struct EditProfileView: View {
    @Binding var user: UserProfile
    @Binding var selectedImage: UIImage?
    @State private var firstName: String = ""
    @State private var lastName: String = ""
    @State private var email: String = ""
    @State private var showImagePicker: Bool = false
    
    var body: some View {
        NavigationView {
            Form {
                // Avatar Section
                Section(header: Text("Avatar")) {
                    Button(action: {
                        showImagePicker.toggle()
                    }) {
                        if let selectedImage = selectedImage {
                            Image(uiImage: selectedImage)
                                .resizable()
                                .frame(width: 100, height: 100)
                                .clipShape(Circle())
                        } else {
                            Image(systemName: "person.circle.fill")
                                .resizable()
                                .frame(width: 100, height: 100)
                                .clipShape(Circle())
                        }
                    }
                }
                
                // Personal Information Section
                Section(header: Text("Personal information")) {
                    TextField("First Name", text: $firstName)
                    TextField("Last Name", text: $lastName)
                    TextField("Email", text: $email)
                        .keyboardType(.emailAddress)
                }
            }
            .navigationBarTitle("Edit Profile")
            .navigationBarItems(
                leading: Button("Cancel") {
                    // Close without saving
                },
                trailing: Button("Save") {
                    user.firstName = firstName
                    user.lastName = lastName
                    user.email = email
                    if let selectedImage = selectedImage {
                        user.avatar = selectedImage
                    }
                    // Close edit view
                }
            )
            .onAppear {
                firstName = user.firstName
                lastName = user.lastName
                email = user.email
            }
            .sheet(isPresented: $showImagePicker) {
                ImagePicker(image: $selectedImage)
            }
        }
    }
}
