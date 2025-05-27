import SwiftUI

struct DatingProfile: Identifiable {
    let id = UUID()
    let imageName: String
    let name: String
    let age: Int
    let bio: String
}

struct DatingCardView: View {
    @State private var profiles: [DatingProfile] = [
        DatingProfile(imageName: "women1", name: "Natalie", age: 25, bio: "Always up for bubble tea 🧋"),
        DatingProfile(imageName: "women2", name: "Sophie", age: 22, bio: "Love hiking and coding ⛰️💻"),
        DatingProfile(imageName: "women3", name: "Emily", age: 21, bio: "Let's explore new cafes ☕️"),
        DatingProfile(imageName: "women4", name: "Rachel", age: 23, bio: "Photography & travel lover 📸✈️"),
        DatingProfile(imageName: "men1", name: "Daniel", age: 24, bio: "Basketball and ramen enthusiast 🍜🏀"),
        DatingProfile(imageName: "men2", name: "Liam", age: 20, bio: "Tech nerd & karaoke king 🎤")
    ]
    
    @State private var currentIndex = 0
    @State private var dragOffset: CGSize = .zero
    @State private var showHeart = false

    var body: some View {
        ZStack {
            if currentIndex < profiles.count {
                let profile = profiles[currentIndex]
                VStack(spacing: 20) {
                    Spacer()

                    ZStack {
                        Image(profile.imageName)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 280, height: 360)
                            .clipped()
                            .cornerRadius(24)
                            .offset(x: dragOffset.width)
                            .rotationEffect(.degrees(Double(dragOffset.width / 20)))
                            .gesture(
                                DragGesture()
                                    .onChanged { value in
                                        dragOffset = value.translation
                                    }
                                    .onEnded { value in
                                        if value.translation.width > 100 {
                                            withAnimation {
                                                showHeart = true
                                            }
                                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                                                nextProfile()
                                            }
                                        } else if value.translation.width < -100 {
                                            nextProfile()
                                        } else {
                                            dragOffset = .zero
                                        }
                                    }
                            )

                        if showHeart {
                            Image(systemName: "heart.fill")
                                .resizable()
                                .frame(width: 100, height: 90)
                                .foregroundColor(Color(hex: "#CE0F69"))
                                .transition(.scale)
                                .zIndex(1)
                        }
                    }
                    .animation(.spring(), value: dragOffset)

                    Text("\(profile.name), \(profile.age)")
                        .font(.title2)
                        .fontWeight(.semibold)

                    Text(profile.bio)
                        .foregroundColor(.gray)
                        .font(.body)

                    Button(action: {
                        withAnimation {
                            showHeart = true
                        }
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                            nextProfile()
                        }
                    }) {
                        Image(systemName: "heart.circle.fill")
                            .resizable()
                            .frame(width: 64, height: 64)
                            .foregroundColor(Color(hex: "#CE0F69"))
                    }

                    Spacer()
                }
                .padding()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color.white)
                .ignoresSafeArea()
            } else {
                VStack(spacing: 20) {
                    Spacer()
                    Text("Please wait for new friends!!")
                        .font(.title2)
                        .fontWeight(.medium)
                        .multilineTextAlignment(.center)
                        .foregroundColor(.gray)
                    Spacer()
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color.white)
                .ignoresSafeArea()
            }
        }
    }

    private func nextProfile() {
        withAnimation {
            currentIndex += 1
            dragOffset = .zero
            showHeart = false
        }
    }
}
