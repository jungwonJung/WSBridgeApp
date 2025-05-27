import SwiftUI

struct PostListView: View {
    @ObservedObject var viewModel: PostViewModel
    @State private var isPresentingNewPost = false

    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                Image("boardHeaderImage")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(height: 180)
                    .clipped()

                HStack {
                    Text("Add Post")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding(.vertical, 10)
                        .padding(.horizontal, 24)
                        .background(Color(hex: "#CE0F69"))
                        .cornerRadius(12)
                        .onTapGesture {
                            isPresentingNewPost = true
                        }

                    Spacer()
                }
                .padding(.horizontal)
                .padding(.top, 12)

                List(viewModel.posts) { post in
                    NavigationLink(destination: PostDetailView(post: post)) {
                        VStack(alignment: .leading, spacing: 4) {
                            Text(post.title)
                                .font(.headline)
                                .foregroundColor(Color(hex: "#CE0F69"))
                            HStack {
                                Text("by \(post.author)")
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                                Spacer()
                                Text(post.formattedDate)
                                    .font(.caption)
                                    .foregroundColor(.gray)
                            }
                        }
                        .padding(.vertical, 8)
                    }
                }
                .listStyle(PlainListStyle())
            }
            .navigationBarTitle("WSB Board", displayMode: .inline)
            .sheet(isPresented: $isPresentingNewPost) {
                NewPostView(viewModel: viewModel)
            }
        }
    }
}
