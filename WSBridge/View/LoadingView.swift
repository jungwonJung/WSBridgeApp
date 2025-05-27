import SwiftUI

struct LoadingView: View {
    @State private var isActive = false
    let viewModel: PostViewModel
    @Binding var selectedScreen: String

    var body: some View {
        ZStack {
            if isActive {
                MainView(selectedScreen: $selectedScreen, viewModel: viewModel)
            } else {
                GeometryReader { geometry in
                    VStack(spacing: 12) {
                        Text("WSB")
                            .font(.system(size: 48, weight: .bold))
                            .minimumScaleFactor(0.5)
                            .lineLimit(1)
                            .frame(maxWidth: geometry.size.width - 60)

                        Text("Bridge")
                            .font(.system(size: 32, weight: .medium))
                            .minimumScaleFactor(0.5)
                            .lineLimit(1)
                            .frame(maxWidth: geometry.size.width - 60)
                    }
                    .frame(width: geometry.size.width, height: geometry.size.height)
                    .foregroundColor(Color(hex: "#CE0F69"))
                    .background(Color.white)
                    .ignoresSafeArea()
                }
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                        withAnimation {
                            isActive = true
                        }
                    }
                }
            }
        }
    }
}
