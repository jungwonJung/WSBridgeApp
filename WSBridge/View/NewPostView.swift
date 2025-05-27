import SwiftUI

struct NewPostView: View {
    @Environment(\.dismiss) var dismiss
    @ObservedObject var viewModel: PostViewModel

    @State private var title = ""
    @State private var author = ""
    @State private var content = ""

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Title")) {
                    TextField("Enter title", text: $title)
                }

                Section(header: Text("Author")) {
                    TextField("Enter your name", text: $author)
                }

                Section(header: Text("Content")) {
                    TextEditor(text: $content)
                        .frame(minHeight: 150)
                }
            }
            .navigationTitle("New Post")
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Post") {
                        viewModel.addPost(title: title, author: author, content: content)
                        dismiss()
                    }
                    .disabled(title.isEmpty || author.isEmpty || content.isEmpty)
                }

                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
            }
        }
    }
}
