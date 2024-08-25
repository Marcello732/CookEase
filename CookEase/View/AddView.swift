//
//  AddView.swift
//  CookEase
//
//  Created by Marcel Bączyński on 23/08/2024.
//

import SwiftUI

struct AddView: View {
    @Environment(ModelData.self) var modelData
    @State private var title: String = ""
    @State private var description: String = ""
    
    @State private var selectedDifficulty = "Choose difficulty"
    let difficulties = ["Easy", "Medium", "Hard"]
    
    @State private var selectedCategory = "Choose category"
    let categories = ["Pasta", "Burger", "Pizza"]
    
    @State private var isPickerPresented = false
    @State var hours: Int = 0
    @State var minutes: Int = 0
    @State private var estimatedTime = "Estimate time"
    
    @State private var showingAlert = false
    
    var body: some View {
        @Bindable var modelData = modelData
        
        NavigationView {
            ScrollView {
                VStack {
                    Button(action: {}, label: {
                        Label("Upload images", systemImage: "plus").foregroundStyle(Color.first)
                    })
                    .padding()
                    .frame(width: 175, height: 50)
                    .overlay(
                        RoundedRectangle(cornerRadius: 11)
                            .inset(by: 1)
                            .stroke(.accent, lineWidth: 1)
                    )
                    .padding(.trailing, 12)
                    .padding(.top, 24)
                    .navigationTitle("Add new recipe")
                    
                    VStack {
                        HStack {
                            Text("Title")
                                .padding(.horizontal, 40)
                                
                            TextField("Title", text: $title)
                                .padding(.trailing, 40)
                                .foregroundStyle(Color.secondary)
                        }
                        Rectangle()
                            .fill(Color.accentColor)
                            .padding(.horizontal, 40)
                            .frame(height: 2)
                            .offset(CGSize(width: 0, height: -5))
                    }.padding(.top, 24)
                    
                    VStack {
                        HStack {
                            Text("Description")
                                .padding(.horizontal, 40)
                                
                            TextField("Description", text: $description)
                                .padding(.trailing, 40)
                                .foregroundStyle(Color.secondary)
                        }
                        Rectangle()
                            .fill(Color.accentColor)
                            .padding(.horizontal, 40)
                            .frame(height: 2)
                            .offset(CGSize(width: 0, height: -5))
                    }.padding(.top, 24)
                
                    Menu(selectedDifficulty) {
                        Button(difficulties[0], action: {
                            selectedDifficulty = difficulties[0]
                        })
                        Button(difficulties[1], action: {
                            selectedDifficulty = difficulties[1]
                        })
                        Button(difficulties[2], action: {
                            selectedDifficulty = difficulties[2]
                        })
                    }.padding()
                        .frame(width: 175, height: 50)
                        .overlay(
                            RoundedRectangle(cornerRadius: 11)
                                .inset(by: 1)
                                .stroke(.accent, lineWidth: 1)
                        )
                        .padding(.trailing, 12)
                        .padding(.top, 24)
                    
                    Button(action: {
                        estimatedTime = String(hours) + " hours " + String(minutes) + " min"
                        isPickerPresented.toggle()
                    }, label: {
                        Text(estimatedTime)
                    })
                    
                    .padding()
                    .frame(width: 175, height: 50)
                    .overlay(
                        RoundedRectangle(cornerRadius: 11)
                            .inset(by: 1)
                            .stroke(Color.accentColor, lineWidth: 1)
                    )
                    .padding(.trailing, 12)
                    .padding(.top, 24)
                
                    if(isPickerPresented) {
                        HStack {
                            Picker("", selection: $hours){
                                ForEach(0..<8, id: \.self) { i in
                                    Text("\(i) hours").tag(i)
                                }
                            }.pickerStyle(WheelPickerStyle())
                            Picker("", selection: $minutes){
                                ForEach(0..<60, id: \.self) { i in
                                    Text("\(i) min").tag(i)
                                }
                            }.pickerStyle(WheelPickerStyle())
                            
                            Button("Done") {
                                isPickerPresented = false
                            }
                            .padding()
                            }
                        .padding(.horizontal)
                    }
                    
                    Menu(selectedCategory) {
                        Button(categories[0], action: {
                            selectedCategory = categories[0]
                        })
                        Button(categories[1], action: {
                            selectedCategory = categories[1]
                        })
                        Button(categories[2], action: {
                            selectedCategory = categories[2]
                        })
                    }.padding()
                        .frame(width: 175, height: 50)
                        .overlay(
                            RoundedRectangle(cornerRadius: 11)
                                .inset(by: 1)
                                .stroke(.accent, lineWidth: 1)
                        )
                        .padding(.trailing, 12)
                        .padding(.top, 24)
                    
                    Button(action: {
                        addRecipe()
                        showingAlert = true
                        title = ""
                        description = ""
                        selectedDifficulty = "Choose difficulty"
                        selectedCategory = "Choose category"
                        estimatedTime = "Estimate time"
                    }, label: {
                        Label(
                            "Add",
                            systemImage: "plus")
                        .foregroundStyle(Color.second)
                    })
                    .padding()
                    .bold()
                    .frame(width: 175, height: 50)
                    .background(Color.accentColor)
                    .clipShape(RoundedRectangle(cornerRadius: 11))
                    .padding(.trailing, 12)
                    .padding(.top, 24)
                    .alert("Your recipe has been added successfully", isPresented: $showingAlert) {
                        Button("OK", role: .cancel) {}
                    }
                }
            }
                
        }
    }
    func addRecipe() {
            let newRecipe = Recipe(
                id: modelData.recipes.count + 1,
                name: title,
                tags: selectedCategory,
                time: hours * 60 + minutes,
                difficulty: selectedDifficulty,
                ratings: 0,
                isFavorite: false,
                description: description,
                author: "Unknown",
                imageName: "pasta"
            )
            
            modelData.recipes.append(newRecipe)
            modelData.saveRecipes()
        }
}

#Preview {
    let modelData = ModelData()
    return AddView()
        .environment(modelData)
}
