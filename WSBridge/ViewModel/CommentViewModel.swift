import Foundation

class CommentViewModel: ObservableObject {
    @Published var comments: [Comment] = []

    init() {
        loadMockComments()
    }

    func loadMockComments() {
        comments = [
            Comment(author: "Alice", content: "Totally agree with this post!", timestamp: Date().addingTimeInterval(-3600)),
            Comment(author: "Bob", content: "Interesting perspective.", timestamp: Date().addingTimeInterval(-7200)),
            Comment(author: "Carol", content: "Can someone explain this more?", timestamp: Date().addingTimeInterval(-10800))
        ]
    }

    func addComment(author: String, content: String) {
        let newComment = Comment(author: author, content: content, timestamp: Date())
        comments.append(newComment)
    }
}
