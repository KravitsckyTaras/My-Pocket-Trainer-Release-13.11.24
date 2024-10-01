import SwiftUI
import AVKit
import WebKit

// Модель для кнопки слайдера
struct SliderButton {
    let title: String
    let description: String
    let videoURL: URL?
    let previewImageName: String?
    let progressValues: [Double]
    let progressTexts: [String]
    let progressColors: [Color]
}

// Пример данных для кнопок слайдера
let buttons = [
    SliderButton(
        title: "Жим гантель під кутом 40.",
        description: "Жим гантель під кутом 40 градусів – це чудова вправа для тренування верхньої частини грудних м'язів. Він націлений на верхню частину грудей і передні дельти.",
        videoURL: URL(string: "https://www.youtube.com/embed/nmLsDtd53_c"),
        previewImageName: "35",
        progressValues: [1, 1, 0.7, 0.6],
        progressTexts: [" Верх грудних м'язів.", "  Середина грудних м'язів.", "  Плечі.", "  Низ грудних м'язів."]
        ,progressColors: [.red, .red, .orange, .orange,] // Цвета для шкалы прогресса
    ),
    SliderButton(
        title: "Розведення гантель під кутом 40.",
        description: "Описание кнопки 3",
        videoURL: URL(string: "https://youtube.com/embed/3G0vNehLU34?si=IR158-_62xEjHToV"), // Прямой URL видеофайла
        previewImageName: "39", // Имя изображения из ассетов (опционально).
        progressValues: [1, 0.8, 0.7, 0.7],
        progressTexts: [" Верх грудних м'язів.", "  Середина грудних м'язів.", "  Низ грудних м'язів.", "  Плечі."],
        progressColors: [.red, .red, .orange, .yellow,]  // Цвета для шкалы прогресса
    ),
    SliderButton(
        title: "Зведення у кроссовері в низ.",
        description: "Описание кнопки 4",
        videoURL: URL(string: "https://youtube.com/embed/6az4gdr6-PU?si=kWMtvSG6w_rgKowz"), // Прямой URL видеофайла
        previewImageName: "41", // Имя изображения из ассетов (опционально).
        progressValues: [1, 1, 0.7, 0.7],
        progressTexts: ["  Низ грудних м'язів.", "  Середина грудних м'язів.", "  Плечі.",  "  Біцепс."]
        ,progressColors: [.red, .red, .yellow, .yellow,]  // Цвета для шкалы прогресса
    ),
    SliderButton(
        title: "Зведення у кроссовері на верх.",
        description: "Описание кнопки 5",
        videoURL: URL(string: "https://youtube.com/embed/k4txTY6ssPM?si=fc_OWOUeZPE0lHxR"), // Прямой URL видеофайла
        previewImageName: "42", // Имя изображения из ассетов (опционально).
        progressValues: [1, 1, 1, 0.7],
        progressTexts: ["  Верх грудних м'язів.", "  Середина грудних м'язів.", "  Плечі.", "  Біцепс.",]
        ,progressColors: [.red, .red, .red, .yellow,]  // Цвета для шкалы прогресса
    ),
    SliderButton(
        title: "Віджимання на брусях.",
        description: "Описание кнопки 6",
        videoURL: URL(string: "https://youtube.com/embed/ut9eQknSXeY?si=gAMF4D30010eTuCS"), // Прямой URL видеофайла
        previewImageName: "dips", // Имя изображения из ассетов (опционально).
        progressValues: [1, 1, 0.8, 0.7],
        progressTexts: ["  Середина грудних м'язів.", "  Низ грудних м'язів.", "  Трицепс.", "  Плечі.",]
        ,progressColors: [.red, .red, .orange, .yellow,]  // Цвета для шкалы прогресса
    ),
    SliderButton(
        title: "Жим штанги лежачі.",
        description: "Описание кнопки 5",
        videoURL: URL(string: "https://youtube.com/embed/h8eWV6NYb7c?si=PyPgPLeFy7xA22S2"), // Прямой URL видеофайла
        previewImageName: "31", // Имя изображения из ассетов (опционально).
        progressValues: [1, 0.9, 0.8, 0.8],
        progressTexts: ["  Низ грудних м'язів.", "  Середина гридних м'язів.", "  Тріцепс.",  "  Плечі.",]
        ,progressColors: [.red, .orange, .orange, .orange,]  // Цвета для шкалы прогресса
    ),
    SliderButton(
        title: "Віджимання від підлоги.",
        description: "Описание кнопки 6",
        videoURL: URL(string: "https://youtube.com/embed/NL14ajaShjw?si=48GwJVTa04eT7ONp"), // Прямой URL видеофайла
        previewImageName: "96", // Имя изображения из ассетов (опционально).
        progressValues: [1, 1, 0.8, 0.8],
        progressTexts: ["  Низ груднмх м'язів.", "  Середина грудних м'язів.", "  Трицепс.", "  Плечі.",]
        ,progressColors: [.red, .red, .orange, .orange,]  // Цвета для шкалы прогресса
    ),
    SliderButton(
        title: "Жим штанги під кутом 40.",
        description: "Описание кнопки 6",
        videoURL: URL(string: "https://youtube.com/embed/gHs2E4zqoZA?si=sAB1vuH2pSv-I3zg"), // Прямой URL видеофайла
        previewImageName: "32", // Имя изображения из ассетов (опционально).
        progressValues: [1, 1, 0.9, 0.7],
        progressTexts: ["  Верх грудних м'язів.", "  Середина грудних м'язів.", "  Плечі.", "  Тріцепс.",]
        ,progressColors: [.red, .red, .red, .yellow,] // Цвета для шкалы прогресса
    ),
    SliderButton(
        title: "Зведення у кросовері під кутом.",
        description: "Описание кнопки 6",
        videoURL: URL(string: "https://youtube.com/embed/xphmkszLe7w?si=RXf-u2uTm9tIA5SX"), // Прямой URL видеофайла
        previewImageName: "97", // Имя изображения из ассетов (опционально).
        progressValues: [1, 1, 0.8, 0.8],
        progressTexts: ["  Верх грудних м'язів.", "  Середина грудних м'язів.", "  Плечі.", "  Бісепс.",]
        ,progressColors: [.red, .red, .orange, .orange,]  // Цвета для шкалы прогресса
    ),
    SliderButton(
        title: "Жим в хамері ",
        description: "Описание кнопки 6",
        videoURL: URL(string: "https://youtube.com/embed/HoBdaZwL2QY?si=QjTMRAIy5WMUk3H6"), // Прямой URL видеофайла
        previewImageName: "98", // Имя изображения из ассетов (опционально).
        progressValues: [1, 1, 0.6, 0.6],
        progressTexts: ["  Верх грудних м'язів.", "  Середина грудних м'язів.", "  Плечі.", "  Бісепс.",]
        ,progressColors: [.red, .red, .yellow, .yellow,]  // Цвета для шкалы прогресса
    ),

]

// Представление для полноэкранного видео
struct FullScreenVideoView: View {
    let videoURL: URL
    @Environment(\.presentationMode) var presentationMode
    
    @State private var dragOffset: CGFloat = 0.0
    private let threshold: CGFloat = -100.0 // Порог для свайпа вверх

    var body: some View {
        ZStack {
            VStack {
                if videoURL.absoluteString.contains("youtube.com") {
                    WebView(url: videoURL)
                        .edgesIgnoringSafeArea(.all)
                } else {
                    VideoPlayer(player: AVPlayer(url: videoURL))
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
                        dragOffset = 0.0
                    }
            )
            .onTapGesture {
                presentationMode.wrappedValue.dismiss() // Закрытие на тап
            }
            
            // Кнопка выхода вверху
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    Button(action: {
                        presentationMode.wrappedValue.dismiss() // Закрытие на нажатие кнопки
                    }) {
                        Image(systemName: "xmark.circle.fill")
                            .resizable()
                            .frame(width: 60, height: 60)
                            .foregroundColor(.white)
                            .padding()
                            .offset(y: -250)
                    }
                    Spacer()
                }
                Spacer()
            }
        }
    }
}

// Представление кнопки слайдера
struct SliderButtonView: View {
    let button: SliderButton
    @Binding var selectedIndex: Int
    let index: Int
    let geometry: GeometryProxy
    
    @State private var isShowingFullScreenVideo: Bool = false
    
    var body: some View {
        VStack {
            Button(action: {
                selectedIndex = index
                if button.videoURL != nil {
                    isShowingFullScreenVideo = true
                }
            }) {
                VStack {
                    // Отображение заголовка над изображением
                    Text(button.title)
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding(.top, 5)
                    
                    if let previewImageName = button.previewImageName,
                       let previewImage = UIImage(named: previewImageName) {
                        Image(uiImage: previewImage)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: geometry.size.width * 0.8, height: geometry.size.height * 0.5)
                            .clipped()
                            .overlay(
                                VStack {
                                    Spacer()
                                    HStack {
                                        Spacer()
                                        Image(systemName: "play.circle.fill")
                                            .resizable()
                                            .frame(width: 50, height: 50)
                                            .foregroundColor(.white)
                                            .padding()
                                    }
                                }
                            )
                    } else {
                        Text("Видео не доступно")
                            .frame(width: geometry.size.width * 0.8, height: geometry.size.height * 0.5)
                            .background(Color.gray)
                            .foregroundColor(.white)
                            .multilineTextAlignment(.center)
                            .padding()
                    }
                    
                    VStack(alignment: .leading, spacing: 8) {
                        // Защита от выхода за пределы массива
                        ForEach(0..<min(button.progressValues.count, button.progressTexts.count, button.progressColors.count), id: \.self) { i in
                            VStack(alignment: .leading) {
                                Text(button.progressTexts[i])
                                    .font(.caption)
                                    .bold()
                                    .foregroundColor(.black)
                                
                                ProgressView(value: min(max(button.progressValues[i], 0), 1), total: 1)
                                    .progressViewStyle(LinearProgressViewStyle(tint: button.progressColors[i]))
                                    .frame(width: geometry.size.width * 0.75, height: 10)
                                    .padding(4)
                            }
                        }
                        .padding(.top, 5)
                    }
                    .padding(.top, 5)
                }
                .frame(width: geometry.size.width * 0.8, height: geometry.size.height * 0.9)
                .background(Color.black.opacity(0.4))
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .shadow(radius: 10)
            }
        }
        .fullScreenCover(isPresented: $isShowingFullScreenVideo) {
            if let videoURL = button.videoURL {
                FullScreenVideoView(videoURL: videoURL)
            }
        }
    }
}

// Детализированное представление, показывающее больше информации при нажатии кнопки.
struct DetailView: View {
    let button: SliderButton
    
    var body: some View {
        VStack {
            Text(button.title)
                .font(.largeTitle)
                .padding()
            
            Text(button.description)
                .padding()
        }
        .navigationTitle("Детали упражнения")
    }
}

// Основное представление, содержащее горизонтальный слайдер и кнопки слайдера.
struct Chest: View {
    @State private var selectedIndex = 0
    
    var body: some View {
        NavigationView {
            GeometryReader { geometry in
                ZStack {
                    Image("listBumagy")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .edgesIgnoringSafeArea(.all)
                    
                    VStack {
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 20) {
                                ForEach(buttons.indices, id: \.self) { index in
                                    NavigationLink(destination: DetailView(button: buttons[index])) {
                                        SliderButtonView(button: buttons[index], selectedIndex: $selectedIndex, index: index, geometry: geometry)
                                    }
                                }
                            }
                            .padding()
                        }
                    }
                }
            }
        }
        .navigationBarBackButtonHidden(true) // Скрыть кнопку «Назад»
    }
}

// Провайдер предварительного просмотра для SwiftUI.
struct MuscleDetailView_Previews: PreviewProvider {
    static var previews: some View {
        Chest()
    }
}
