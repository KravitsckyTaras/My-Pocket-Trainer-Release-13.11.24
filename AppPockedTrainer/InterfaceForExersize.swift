import SwiftUI
import AVKit
import WebKit

// Дополнительное представление с подробным описанием кнопки
struct DetailView: View {
    let button: SliderButton // Принимает данные о кнопке слайдера
    
    var body: some View {
        VStack {
            Text(button.title) // Заголовок кнопки, отображается крупным шрифтом
                .font(.largeTitle)
                .padding()
            
            Text(button.description) // Описание кнопки
                .padding()
        }
    }
}

// Представление для полноэкранного видео
struct FullScreenVideoView: View {
    let videoURL: URL // URL видео для загрузки в представлении
    @Environment(\.presentationMode) var presentationMode // Управление представлением для закрытия полноэкранного режима
    
    var body: some View {
        ZStack {
            if let videoID = videoURL.absoluteString.split(separator: "/").last { // Извлекаем ID видео из URL
                WebView(html: """
                <html>
                    <body style="margin:0; padding:0;">
                        <iframe width="100%" height="100%" src="https://www.youtube.com/embed/\(videoID)" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>
                    </body>
                </html>
                """) // Встраиваем видео через HTML-код для веб-представления
                .edgesIgnoringSafeArea(.all) // Устанавливаем представление на весь экран
            } else {
                Text("Видео не доступно") // Сообщение при отсутствии доступного видео
                    .foregroundColor(.white)
            }
            
            VStack {
                Spacer()
                Button(action: {
                    presentationMode.wrappedValue.dismiss() // Закрытие представления по нажатию на кнопку
                }) {
                    Image(systemName: "xmark.circle.fill") // Иконка для закрытия
                        .resizable()
                        .frame(width: 60, height: 60)
                        .foregroundColor(.white)
                        .padding()
                }
            }
        }
    }
}

// Представление кнопки слайдера
struct SliderButtonView: View {
    let button: SliderButton // Кнопка слайдера с параметрами
    @Binding var selectedIndex: Int // Индекс выбранной кнопки
    let index: Int // Индекс текущей кнопки в списке
    let geometry: GeometryProxy // Используемый для получения размеров и позиционирования
    
    @State private var isShowingFullScreenVideo: Bool = false // Состояние для отображения полноэкранного видео
    
    var body: some View {
        VStack {
            Button(action: {
                selectedIndex = index // Устанавливаем индекс выбранной кнопки
                if button.videoURL != nil { // Проверка наличия видео URL
                    isShowingFullScreenVideo = true // Отображаем видео, если URL доступен
                }
            }) {
                VStack {
                    Text(button.title) // Заголовок кнопки
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding(.top, 5)
                    
                    if let previewImageName = button.previewImageName,
                       let previewImage = UIImage(named: previewImageName) { // Проверка и отображение изображения предпросмотра
                        Image(uiImage: previewImage)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: geometry.size.width * 0.8, height: geometry.size.height * 0.5)
                            .clipped()
                            .overlay( // Наложение иконки воспроизведения поверх изображения
                                VStack {
                                    Spacer()
                                    HStack {
                                        Spacer()
                                        Image(systemName: "play.circle.fill") // Иконка для проигрывания видео
                                            .resizable()
                                            .frame(width: 50, height: 50)
                                            .foregroundColor(.white)
                                            .padding()
                                    }
                                }
                            )
                    } else {
                        Text("Видео не доступно") // Сообщение, если предпросмотр недоступен
                            .frame(width: geometry.size.width * 0.8, height: geometry.size.height * 0.5)
                            .background(Color.gray)
                            .foregroundColor(.white)
                            .multilineTextAlignment(.center)
                            .padding()
                    }
                    
                    VStack(alignment: .leading, spacing: 8) {
                        ForEach(0..<min(button.progressValues.count, button.progressTexts.count, button.progressColors.count), id: \.self) { i in
                            VStack(alignment: .leading) {
                                Text(button.progressTexts[i]) // Текст описания прогресса
                                    .font(.caption)
                                    .bold()
                                    .foregroundColor(.black)
                                
                                ProgressView(value: min(max(button.progressValues[i], 0), 1), total: 1) // Прогресс бар с ограничением от 0 до 1
                                    .progressViewStyle(LinearProgressViewStyle(tint: button.progressColors[i])) // Цвет прогресса
                                    .frame(width: geometry.size.width * 0.75, height: 10)
                                    .padding(4)
                            }
                        }
                        .padding(.top, 5)
                    }
                    .padding(.top, 5)
                }
                .frame(width: geometry.size.width * 0.8, height: geometry.size.height * 0.9)
                .background(Color.black.opacity(0.4)) // Фон кнопки слайдера
                .clipShape(RoundedRectangle(cornerRadius: 10)) // Обрезка углов
                .shadow(radius: 10) // Тень
            }
        }
        .fullScreenCover(isPresented: $isShowingFullScreenVideo) { // Полноэкранное представление для видео
            if let videoURL = button.videoURL { // Проверка наличия URL перед показом видео
                FullScreenVideoView(videoURL: videoURL)
            }
        }
    }
}
