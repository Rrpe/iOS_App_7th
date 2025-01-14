
import SwiftUI

struct ContentView: View {
    @State var carStore = CarStore(cars: carData)
    var body: some View {
        
        List {
            ForEach(carStore.cars) { car in
                NavigationLink(value: car) {
                    ListCell(car: car)
                }
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
