import Foundation

class PostViewModel: ObservableObject {
    @Published var posts: [Post] = []

    init() {
        loadMockData()
    }
    
    func addPost(title: String, author: String, content: String) {
            let newPost = Post(
                id: UUID(),
                title: title,
                author: author,
                content: content,
                date: Date(),
                comments: []
            )
            posts.insert(newPost, at: 0)
        }

    private func loadMockData() {
        posts = [
            Post(
                id: UUID(),
                title: "Welcome to WSB Bridge 🎉",
                author: "Alice K.",
                content: "Let's build a strong community for WSB students! Leave your thoughts below 👇",
                date: Date().addingTimeInterval(-3600 * 4),
                comments: [
                    Comment(author: "David", content: "Great idea! Happy to be here!", timestamp: Date().addingTimeInterval(-3600 * 3)),
                    Comment(author: "Eva", content: "Can’t wait to connect with everyone 🥳", timestamp: Date().addingTimeInterval(-3600 * 2))
                ]
            ),
            Post(
                id: UUID(),
                title: "Anyone up for Pomodoro study sessions?",
                author: "Brian L.",
                content: "I've been using the Pomodoro technique recently. Want to start a study group using it?",
                date: Date().addingTimeInterval(-3600 * 12),
                comments: [
                    Comment(author: "Sophie", content: "I'm in! When do we start?", timestamp: Date().addingTimeInterval(-3600 * 10))
                ]
            ),
            Post(
                id: UUID(),
                title: "Looking for project teammates 🚀",
                author: "Carla M.",
                content: "I'm working on an AI project for our CS class. If anyone's interested, let me know!",
                date: Date().addingTimeInterval(-3600 * 24),
                comments: []
            ),
            Post(
                id: UUID(),
                title: "Roommate needed near campus 🏠",
                author: "Tom Y.",
                content: "Looking for a roommate to share a 2-bedroom apartment starting next month. DM if interested!",
                date: Date().addingTimeInterval(-3600 * 48),
                comments: []
            ),
            Post(
                id: UUID(),
                title: "📚 Selling used textbooks",
                author: "Linda G.",
                content: "Selling books for Microeconomics, Psychology 101, and Intro to Marketing. Cheap prices!",
                date: Date().addingTimeInterval(-3600 * 53),
                comments: [
                    Comment(author: "Mike", content: "Interested in Psych book. Is it still available?", timestamp: Date().addingTimeInterval(-3600 * 27))
                ]
            ),
            Post(
                id: UUID(),
                title: "Internship Opportunities at Google 💼",
                author: "Kevin R.",
                content: "Google is opening summer internships for international students. Sharing the link here!",
                date: Date().addingTimeInterval(-3600 * 72),
                comments: []
            ),
            Post(
                id: UUID(),
                title: "Anyone know good Korean food in Wrocław?",
                author: "Jisu P.",
                content: "I'm craving kimchi jjigae... recommendations please 🇰🇷",
                date: Date().addingTimeInterval(-3600 * 96),
                comments: [
                    Comment(author: "Daria", content: "Try Miss Kimchi near city center!", timestamp: Date().addingTimeInterval(-3600 * 72))
                ]
            ),
            Post(
                id: UUID(),
                title: "Part-time job suggestions?",
                author: "Mateusz B.",
                content: "Where do international students usually work part-time? Any advice for flexible jobs?",
                date: Date().addingTimeInterval(-3600 * 120),
                comments: []
            ),
            Post(
                id: UUID(),
                title: "Visa extension tips 🇵🇱",
                author: "Aisha N.",
                content: "Has anyone recently extended their TRC? Any documents I should prepare in advance?",
                date: Date().addingTimeInterval(-3600 * 144),
                comments: []
            ),
            Post(
                id: UUID(),
                title: "Weekend trip to Kraków 🧳",
                author: "Lucas V.",
                content: "Planning a short trip to Kraków this weekend. Anyone wants to join?",
                date: Date().addingTimeInterval(-3600 * 168),
                comments: [
                    Comment(author: "Mina", content: "I’d love to! DM me 😊", timestamp: Date().addingTimeInterval(-3600 * 144))
                ]
            )
        ]
    }

}
