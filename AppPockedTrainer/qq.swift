import SwiftUI
import AVKit

struct DetailView: View {
    let button: SliderButton

    var body: some View {
        VStack {
            Text(button.title)
                .font(.largeTitle)
                .padding()

            Text(button.description)
                .padding()

            // Пример отображения видео, если есть URL
            if let videoURL = button.videoURL {
                VideoPlayer(player: AVPlayer(url: videoURL))
                    .aspectRatio(contentMode: .fit)
                    .padding()
            } else {
                Text("Видео недоступно")
                    .padding()
            }

            Spacer()

            Button(action: {
                // Закрыть DetailView
            }) {
                Text("Закрыть")
                    .font(.title)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
        }
        .padding()
        .navigationTitle("Детали упражнения") // Заголовок для DetailView
        .navigationBarBackButtonHidden(false) // Показать кнопку "Назад"
    }
}

// Провайдер предварительного просмотра для DetailView
struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(button: DetlVievvbuttons[0]) // Предпросмотр с первой кнопкой
    }
}
