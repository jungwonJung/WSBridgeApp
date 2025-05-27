import SwiftUI

struct MainView: View {
    @Binding var selectedScreen: String
    @ObservedObject var viewModel: PostViewModel
    @State private var showMenu = false

    var body: some View {
        ZStack(alignment: .topTrailing) {
            Group {
                switch selectedScreen {
                case "board":
                    PostListView(viewModel: PostViewModel())
                case "timer":
                    StudyTimerView()
                case "dating":
                    DatingCardView()
                default:
                    EmptyView()
                }
            }
            .disabled(showMenu)
            .blur(radius: showMenu ? 5 : 0)

            if showMenu {
                SideMenuView { screen in
                    selectedScreen = screen
                    withAnimation {
                        showMenu = false
                    }
                }
                .frame(width: 250)
                .transition(.move(edge: .trailing))
                .zIndex(1)
            }
        }
    }
}
