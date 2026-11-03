import SwiftUI

@main
struct KnowMeNotApp: App {
    var body: some Scene {
        WindowGroup { ContentView() }
    }
}

struct ContentView: View {
    @State private var licenseKey = ""
    @State private var isActivated = false
    @State private var status = "Not Activated"
    @State private var showError = false

    private let telegramURL = URL(string: "https://t.me/knowme_sllv")!

    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            ScrollView(showsIndicators: false) {
                VStack(spacing: 16) {
                    Image("AngelBackground")
                        .resizable().scaledToFill()
                        .frame(height: 310).clipped()
                        .overlay(alignment: .bottom) {
                            LinearGradient(colors: [.clear, .black], startPoint: .center, endPoint: .bottom)
                                .frame(height: 110)
                        }

                    if !isActivated {
                        activationCard
                    } else {
                        dashboard
                    }
                    Spacer(minLength: 24)
                }
            }
            .ignoresSafeArea(edges: .top)
        }
        .preferredColorScheme(.dark)
        .alert("Activation failed", isPresented: $showError) {
            Button("OK", role: .cancel) { }
        } message: {
            Text("This key could not be verified. Please check it and try again.")
        }
    }

    private var activationCard: some View {
        VStack(alignment: .leading, spacing: 18) {
            HStack(spacing: 16) {
                Image(systemName: "lock.fill").font(.system(size: 42)).foregroundStyle(.red)
                VStack(alignment: .leading, spacing: 4) {
                    Text("License Key").font(.title2.bold()).foregroundStyle(.white)
                    Text("Enter your license key to unlock all features")
                        .font(.subheadline).foregroundStyle(.gray)
                }
            }
            TextField("Paste Key Here...", text: $licenseKey)
                .textInputAutocapitalization(.characters)
                .autocorrectionDisabled()
                .padding(18)
                .background(Color.white.opacity(0.06))
                .overlay(RoundedRectangle(cornerRadius: 18).stroke(Color.red.opacity(0.65), lineWidth: 1))
            Button(action: activate) {
                Label("ACTIVATE KEY", systemImage: "checkmark.circle.fill")
                    .font(.headline.bold()).frame(maxWidth: .infinity).padding(19)
                    .background(LinearGradient(colors: [.red, Color(red: 0.55, green: 0, blue: 0)], startPoint: .top, endPoint: .bottom))
                    .clipShape(RoundedRectangle(cornerRadius: 18))
            }
            HStack {
                Label("Status:", systemImage: "checkmark.shield.fill").foregroundStyle(.gray)
                Text(status).foregroundStyle(.red).bold()
                Spacer()
                Text("Version: 1.0.0").foregroundStyle(.gray)
            }.font(.caption.bold())
        }
        .padding(20)
        .background(Color.black.opacity(0.94))
        .overlay(RoundedRectangle(cornerRadius: 28).stroke(Color.red, lineWidth: 1.5))
        .clipShape(RoundedRectangle(cornerRadius: 28))
        .padding(.horizontal, 18)
    }

    private var dashboard: some View {
        VStack(spacing: 16) {
            HStack {
                Label("Status:", systemImage: "checkmark.shield.fill").foregroundStyle(.gray)
                Text("Activated").foregroundStyle(.green).bold()
                Spacer()
                Text("Version: 1.0.0").foregroundStyle(.gray)
            }.padding(.horizontal, 22)

            LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 14) {
                tool("Game Booster", "Boost Your Game", "rocket.fill")
                tool("Sensitivity", "Best Settings", "scope")
                tool("HUD Settings", "Customize HUD", "gamecontroller.fill")
                tool("FPS Monitor", "Device performance", "chart.bar.fill")
                tool("Network Monitor", "Check connection", "wifi")
                tool("More Tools", "Extra Features", "gearshape.fill")
            }.padding(.horizontal, 18)

            Button {
                UIApplication.shared.open(telegramURL)
            } label: {
                HStack(spacing: 14) {
                    Image(systemName: "paperplane.fill").font(.largeTitle)
                    VStack(alignment: .leading) {
                        Text("Join Our Telegram Channel").font(.headline)
                        Text("@knowme_sllv").font(.title2.bold()).foregroundStyle(.red)
                    }
                    Spacer()
                    Image(systemName: "chevron.right")
                }
                .foregroundStyle(.white).padding(20)
                .background(Color.white.opacity(0.05))
                .overlay(RoundedRectangle(cornerRadius: 22).stroke(Color.red, lineWidth: 1.5))
                .clipShape(RoundedRectangle(cornerRadius: 22))
            }.padding(.horizontal, 18)
        }
    }

    private func tool(_ title: String, _ subtitle: String, _ symbol: String) -> some View {
        VStack(alignment: .leading, spacing: 10) {
            Image(systemName: symbol).font(.system(size: 30, weight: .bold)).foregroundStyle(.red)
            Text(title).font(.headline).foregroundStyle(.white)
            Text(subtitle).font(.caption).foregroundStyle(.gray)
        }
        .frame(maxWidth: .infinity, minHeight: 105, alignment: .leading)
        .padding(16)
        .background(Color.white.opacity(0.045))
        .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.red.opacity(0.8), lineWidth: 1.2))
        .clipShape(RoundedRectangle(cornerRadius: 20))
    }

    private func activate() {
        // Server-side license validation is intentionally a backend integration point.
        // Do not ship a production app with a hard-coded key in the client.
        guard !licenseKey.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else {
            showError = true
            return
        }
        // Demo UI state only. Replace with an HTTPS API request before release.
        status = "Server Check Required"
        showError = true
    }
}
