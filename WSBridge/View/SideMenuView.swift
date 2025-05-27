import SwiftUI

struct SideMenuView: View {
    var onSelect: (String) -> Void

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            HStack {
                Image(systemName: "graduationcap.fill")
                    .font(.title2)
                Text("WSB")
                    .font(.title)
                    .bold()
            }
            .foregroundColor(Color(hex: "#CE0F69"))
            .padding(.top, 60)
            .padding(.bottom, 30)
            .padding(.horizontal, 20)

            Group {
                Button(action: {
                    onSelect("board")
                }) {
                    Text("📋 Board")
                        .foregroundColor(.blue)
                        .padding(.vertical, 14)
                        .padding(.horizontal, 20)
                }

                Divider()

                Button(action: {
                    onSelect("timer")
                }) {
                    Text("⏱️ Study Timer")
                        .foregroundColor(.blue)
                        .padding(.vertical, 14)
                        .padding(.horizontal, 20)
                }

                Divider()

                Button(action: {
                    onSelect("dating")
                }) {
                    Text("💘 Find Your Match")
                        .foregroundColor(.blue)
                        .padding(.vertical, 14)
                        .padding(.horizontal, 20)
                }
            }

            Spacer()
        }
        .frame(width: UIScreen.main.bounds.width * 0.5, alignment: .leading)
        .background(Color.white)
        .edgesIgnoringSafeArea(.all)
    }
}
