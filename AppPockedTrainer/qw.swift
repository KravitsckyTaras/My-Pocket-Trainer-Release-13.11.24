struct FullScreenVideoView: View {
    let videoURL: URL
    @Environment(\.presentationMode) var presentationMode
    
    @State private var dragOffset: CGFloat = 0.0
    @State private var isLoading = true // Состояние загрузки
    private let threshold: CGFloat = -100.0 // Порог для свайпа вверх

    var body: some View {
        ZStack {
            VStack {
                if videoURL.absoluteString.contains("youtube.com") {
                    WebView(url: videoURL)
                        .edgesIgnoringSafeArea(.all)
                        .onAppear {
                            isLoading = false // Устанавливаем состояние загрузки в false
                        }
                } else {
                    VideoPlayer(player: AVPlayer(url: videoURL))
                        .onAppear {
                            isLoading = false // Устанавливаем состояние загрузки в false
                        }
                        .edgesIgnoringSafeArea(.all)
                }
            }
            .gesture(
                DragGesture()
                    .onChanged { value in
                        if value.translation.height < 0 {
                            dragOffset = value.translation.height
                        }
                    }
                    .onEnded { _ in
                        if dragOffset < threshold {
                            presentationMode.wrappedValue.dismiss() // Закрытие на свайп вверх
                        }
                        dragOffset = 0
                    }
            )
            
            // Индикатор загрузки
            if isLoading {
                ProgressView("Загрузка видео...")
                    .progressViewStyle(CircularProgressViewStyle())
                    .padding()
                    .background(Color.black.opacity(0.5))
                    .cornerRadius(10)
            }
        }
    }
}
