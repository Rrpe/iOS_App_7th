//
//  AddNewCar.swift
//  ListNavDemo
//
//  Created by KimJunsoo on 1/14/25.
//

import SwiftUI

struct AddNewCar: View {
//    @State var carStore = CarStore()
    var carStore: CarStore
    @Binding var path: NavigationPath
    @State private var isHybrid: Bool = false
    @State private var name: String = ""
    @State private var description: String = ""
    
    var body: some View {
        Form {
            Section(header: Text("Car Details")) {
                Image(systemName: "car.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding()
                
                DataInput(title: "Model", userInput: $name)
                DataInput(title: "Description", userInput: $description)
                
                Toggle(isOn: $isHybrid) {
                    Text("Hybrid").font(.headline)
                }
                .padding()
            }
            
            Button(action: addNewCar) {
                Text("Add Car")
            }
        }
    }
    
    func addNewCar() {
        let newCar = Car(id: UUID().uuidString, name: name, description: description, imageName: "tesla_model_3", isHybrid: isHybrid)
        
        carStore.cars.append(newCar)
        path.removeLast() // 현재화면을 닫고 이전화면으로 돌아감
//        path.append("EV Cars") // 새로운 경로를 추가해버려서 이상한 화면으로 감
    }
}

//#Preview {
//    AddNewCar(carStroe: CarStore(), path: .init(NavigationPath.self))
//}

struct DataInput: View {
    var title: String
    @Binding var userInput: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.headline)
            
            TextField("Enter \(title)", text: $userInput)
                .textFieldStyle(RoundedBorderTextFieldStyle())
        }
    }
}
