import SwiftUI

struct PostDetailView: View {
    let post: Post
    @State private var newCommentText: String = ""
    @State private var comments: [Comment] = []
    @FocusState private var isInputFocused: Bool

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            VStack(alignment: .leading, spacing: 8) {
                Text(post.title)
                    .font(.title)
                    .fontWeight(.bold)
                HStack {
                    Text("by \(post.author)")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                    Spacer()
                    Text(post.formattedDate)
                        .font(.caption)
                        .foregroundColor(.gray)
                }
                Text(post.content)
                    .font(.body)
            }

            Divider()

            Text("Comments")
                .font(.headline)

            ScrollView {
                VStack(spacing: 12) {
                    ForEach(comments, id: \ .id) { comment in
                        VStack(alignment: .leading, spacing: 4) {
                            HStack {
                                Text(comment.author)
                                    .font(.subheadline)
                                    .fontWeight(.semibold)
                                Spacer()
                                Text(comment.timestamp.formatted(date: .numeric, time: .shortened))
                                    .font(.caption)
                                    .foregroundColor(.gray)
                            }
                            Text(comment.content)
                                .font(.body)
                        }
                        .padding()
                        .background(Color.gray.opacity(0.1))
                        .cornerRadius(10)
                    }
                }
            }

            Spacer()

            HStack {
                TextField("Add a comment...", text: $newCommentText)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .focused($isInputFocused)
                Button(action: {
                    if !newCommentText.trimmingCharacters(in: .whitespaces).isEmpty {
                        let newComment = Comment(author: "You", content: newCommentText, timestamp: Date())
                        comments.append(newComment)
                        newCommentText = ""
                        isInputFocused = false
                    }
                }) {
                    Image(systemName: "paperplane.fill")
                        .foregroundColor(Color(hex: "#CE0F69"))
                }
                .disabled(newCommentText.trimmingCharacters(in: .whitespaces).isEmpty)
            }
            .padding(.horizontal)
            .padding(.bottom, 12)
        }
        .padding()
        .onAppear {
            comments = post.comments
        }
        .navigationTitle("Post Details")
        .navigationBarTitleDisplayMode(.inline)
    }
}
