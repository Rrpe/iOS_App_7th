
import Foundation

struct Car: Codable, Identifiable {
    
    var id: String
    var name: String
    var description: String
    var imageName: String
    var isHybrid: Bool
}
