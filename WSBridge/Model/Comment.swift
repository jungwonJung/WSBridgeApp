import Foundation

struct Comment: Identifiable {
    let id = UUID()
    let author: String
    let content: String
    let timestamp: Date
}
