import Foundation

struct Post: Identifiable {
    let id: UUID
    let title: String
    let author: String
    let content: String
    let date: Date
    let comments: [Comment]

    var formattedDate: String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter.string(from: date)
    }
}
