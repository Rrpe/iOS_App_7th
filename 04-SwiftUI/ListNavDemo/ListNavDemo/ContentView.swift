
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
                .onDelete(perform: deleteItem)
                .onMove(perform: moveItem)
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
                if menuString == "Add Car" { // 동적 전환
                    AddNewCar(carStore: carStore, path: $stackPath)
                }
            }
            .navigationDestination(for: Car.self) { car in
                CarDetail(selectedCar: car)
            }
        }
    } // body View
    
    func deleteItem(offsets: IndexSet) {
        carStore.cars.remove(atOffsets: offsets)
    }
    
    func moveItem(from source: IndexSet, to destination: Int) {
        carStore.cars.move(fromOffsets: source, toOffset: destination)
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
