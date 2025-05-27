import SwiftUI

struct ContentView: View {
    @State private var isMenuOpen = false
    @State private var selectedScreen = "board"
    @StateObject private var viewModel = PostViewModel()

    var body: some View {
        ZStack(alignment: .leading) {
            LoadingView(viewModel: viewModel, selectedScreen: $selectedScreen)

            if isMenuOpen {
                Color.black.opacity(0.3)
                    .ignoresSafeArea()
                    .onTapGesture {
                        withAnimation {
                            isMenuOpen.toggle()
                        }
                    }
            }

            SideMenuView { screen in
                selectedScreen = screen
                withAnimation {
                    isMenuOpen = false
                }
            }
            .frame(width: UIScreen.main.bounds.width * 0.5)
            .offset(x: isMenuOpen ? 0 : -UIScreen.main.bounds.width * 0.5)
            .animation(.easeInOut(duration: 0.3), value: isMenuOpen)

            VStack {
                HStack {
                    Spacer()
                    Button(action: {
                        withAnimation {
                            isMenuOpen.toggle()
                        }
                    }) {
                        Image(systemName: "line.horizontal.3")
                            .resizable()
                            .frame(width: 24, height: 18)
                            .padding()
                            .foregroundColor(.black)
                    }
                }
                Spacer()
            }
        }
    }
}
