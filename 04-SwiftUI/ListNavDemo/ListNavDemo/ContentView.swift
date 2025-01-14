
import SwiftUI

struct ContentView: View {
    @State var carStore = CarStore(cars: carData)
    @State var stackPath = NavigationPath()
    
    var body: some View {
        
        NavigationStack(path: $stackPath) {
            List {
                ForEach(carStore.cars) { car in
                    NavigationLink(value: car) {
                        ListCell(car: car)
                    }
                }
            }
            .navigationTitle(Text("EV Cars"))
            .toolbar {
                ToolbarItem(placement: .topBarLeading, content: {
                    NavigationLink(value: "Add Car") {
                        Text("Add")
                            .foregroundStyle(.blue)
                    }
                })
                ToolbarItem(placement: .topBarTrailing, content: {
                    EditButton()
                })
            }
            .navigationDestination(for: String.self) { menuString in
                if menuString == "Add Car" {
                    AddNewCar(carStore: carStore, path: $stackPath)
                }
            }
            .navigationDestination(for: Car.self) { car in
                CarDetail(selectedCar: car)
            }
        }
        
    }
}

#Preview {
    ContentView()
}

struct ListCell: View {
    var car: Car
    var body: some View {
        HStack {
            Image(car.imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 100, height: 60)
            Text(car.name)
        }
    }
}
