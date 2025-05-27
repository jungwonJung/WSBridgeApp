

  <h1>📱 WSBridgeApp</h1>
  <p><strong>WSBridgeApp</strong> is a SwiftUI-based prototype app built for WSB University students. It offers a message board, a Pomodoro-style study timer, and a friend-finder with swipe UI interactions.</p>

  <hr>

  <h2>🚀 Features</h2>
  <ul>
    <li><strong>📰 Community Board</strong>
      <ul>
        <li>Create and read posts</li>
        <li>Add and view comments (non-persistent)</li>
      </ul>
    </li>
    <li><strong>⏱️ Study Timer</strong>
      <ul>
        <li>40/20 Pomodoro focus and break cycle</li>
        <li>Start/Pause toggle</li>
        <li>Motivational message below the timer</li>
      </ul>
    </li>
    <li><strong>💞 Find Friends</strong>
      <ul>
        <li>Swipe left to skip, swipe right to like</li>
        <li>Visual heart animation for likes</li>
        <li>Each card shows image, name, age (20–25), and bio</li>
        <li>After all 6 profiles: "Please wait for more friends!"</li>
      </ul>
    </li>
  </ul>

  <hr>

  <h2>🧱 Tech Stack</h2>
  <ul>
    <li><strong>Language:</strong> Swift</li>
    <li><strong>UI:</strong> SwiftUI</li>
    <li><strong>Architecture:</strong> MVVM</li>
    <li><strong>Persistence:</strong> Mock data only</li>
    <li><strong>Assets:</strong> Local images</li>
  </ul>

  <hr>

  <h2>📂 Project Structure</h2>
  <pre><code>
WSBridgeApp/
├── Model/
│   ├── Post.swift
│   └── Comment.swift
├── View/
│   ├── PostListView.swift
│   ├── PostDetailView.swift
│   ├── NewPostView.swift
│   ├── StudyTimerView.swift
│   ├── DatingCardView.swift
│   └── LoadingView.swift
├── ViewModel/
│   └── PostViewModel.swift
├── Utils/
│   └── Color+Extensions.swift
├── Assets/
│   ├── boardHeaderImage
│   ├── men1, men2
│   └── women1~4
  </code></pre>

  <hr>

  <h2>📹 Demo Videos</h2>
  <ul>
    <li>🔁 <strong>Full App Demo</strong>: <em>[Insert link here]</em></li>
    <li>✍️ <strong>Posts & Comments</strong>: <em>[Insert link here]</em></li>
    <li>⏰ <strong>Study Timer</strong>: <em>[Insert link here]</em></li>
    <li>💘 <strong>Find Friends (Swipe)</strong>: <em>[Insert link here]</em></li>
  </ul>

  <hr>

  <h2>✅ Getting Started</h2>
  <pre><code>
git clone https://github.com/your-username/WSBridgeApp.git
cd WSBridgeApp
open WSBridge.xcodeproj
  </code></pre>
  <p><strong>No CocoaPods or dependencies required.</strong> Everything is native SwiftUI.</p>

  <hr>

  <h2>⚠️ Disclaimer</h2>
  <p>This is a functional prototype. No backend, login, or persistent storage is currently implemented.</p>

  <hr>

  <h2>📬 Contact</h2>
  <p>Built by <a href="https://github.com/jungwonJung">Jungwon Jung</a>. For inquiries, DM me or open an issue on GitHub.</p>

</body>
</html>
