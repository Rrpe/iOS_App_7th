//
//  CarDetailView.swift
//  ListNavDemo
//
//  Created by KimJunsoo on 1/14/25.
//

import SwiftUI

struct CarDetail: View {
    let selectedCar: Car
    
    var body: some View {
        Form {
            Section(header: Text("Car Details")) {
                Image(selectedCar.imageName)
                    .resizable()
                    // cornerRadius의 최신 코드 업데이트
                    .clipShape(.rect(cornerRadius: 12))
                    .aspectRatio(contentMode: .fit)
                    .padding()
                
                Text(selectedCar.name)
                    .font(.headline)
                
                Text(selectedCar.description)
                    .font(.body)
                
                HStack {
                    Text("Hybrid").font(.headline)
                    Spacer()
                    Image(systemName: selectedCar.isHybrid ? "checkmark.circle" : "xmark.circle")
                }
            }
        }
    }
}

#Preview {
    CarDetail(selectedCar: carData[0])
}
