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


// Основное представление, содержащее горизонтальный слайдер и кнопки слайдера
struct Chest: View {
    @State private var selectedIndex = 0
    @Environment(\.presentationMode) var presentationMode

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
                        .padding(.top, -90)
                    }
                }
                
                VStack {
                    Spacer()
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }) {
                        Image(systemName: "house.fill")
                            .font(.largeTitle)
                            .foregroundColor(.black)
                            .padding(.vertical, 10)
                    }
                    .frame(maxWidth: .infinity)
                    .background(Color.gray.opacity(0.2))
                }
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

// Провайдер предварительного просмотра для SwiftUI
struct MuscleDetailView_Previews: PreviewProvider {
    static var previews: some View {
        Chest()
    }
}


