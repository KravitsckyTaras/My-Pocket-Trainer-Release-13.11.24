import SwiftUI
import AVKit
import WebKit





// Пример данных для кнопок слайдера
let TRIbuttons = [
    SliderButton(
        title: "Жим вузьким хватом.",
        description: "Описание кнопки 1",
        videoURL: URL(string: ""), // Прямой URL видеофайла
        previewImageName: "22", // Имя изображения из ассетов (опционально).
        progressValues: [1, 0.8, 0.8, 0],
        progressTexts: [" Тріцепс.", "  Передня дельа.", "  Велика грудна.",  ""]
        ,progressColors: [.red, .yellow, .yellow, .yellow,]  // Цвета для шкалы прогресса
    ),
    SliderButton(
        title: "Віджимання від лавки.",
        description: "Описание кнопки 1",
        videoURL: URL(string: ""), // Прямой URL видеофайла
        previewImageName: "23", // Имя изображения из ассетов (опционально).
        progressValues: [1, 0.9, 0.9, 0],
        progressTexts: [" Тріцепс.", "  Передня дельа.", "  Велика грудна.",  ""]
        ,progressColors: [.red, .orange, .orange, .yellow,]  // Цвета для шкалы прогресса
    ),
    SliderButton(
        title: "Французкий жим.",
        description: "Описание кнопки 1",
        videoURL: URL(string: ""), // Прямой URL видеофайла
        previewImageName: "24", // Имя изображения из ассетов (опционально).
        progressValues: [1, 1, 0.9, 0],
        progressTexts: [" Тріцепс: Довга головка.", "  Тріцепс: Середня головка.", "  Тріцепс: Бокова головка.",  ""]
        ,progressColors: [.red, .red, .orange, .yellow,]  // Цвета для шкалы прогресса
    ),
   
    SliderButton(
        title: "Тріцепс в блоці.",
        description: "Описание кнопки 1",
        videoURL: URL(string: ""), // Прямой URL видеофайла
        previewImageName: "27", // Имя изображения из ассетов (опционально).
        progressValues: [1, 1, 0.8, 0],
        progressTexts: ["  Довга долонна.", "  Розгинач зап'ястя.", "  Ліктьовий згинач зап'ястя.",  ""]
        ,progressColors: [.red, .red, .yellow, .yellow,]  // Цвета для шкалы прогресса
    ),
    SliderButton(
        title: "Однією рукою в блоці.",
        description: "Описание кнопки 1",
        videoURL: URL(string: ""), // Прямой URL видеофайла
        previewImageName: "28", // Имя изображения из ассетов (опционально).
        progressValues: [1, 1, 1, 0],
        progressTexts: [" Тріцепс: Довга головка.", "  Тріцепс: Середня головка.", "  Тріцепс: Бокова головка.",  ""]
        ,progressColors: [.red, .red, .red, .yellow,]  // Цвета для шкалы прогресса
    ),
    SliderButton(
        title: "Розгинання руки над головою.",
        description: "Описание кнопки 1",
        videoURL: URL(string: ""), // Прямой URL видеофайла
        previewImageName: "29", // Имя изображения из ассетов (опционально).
        progressValues: [1, 1, 0.8, 0],
        progressTexts: [" Тріцепс: Довга головка.", "  Тріцепс: Середня головка.", "  Тріцепс: Бокова головка.",  ""]
        ,progressColors: [.red, .red, .yellow, .yellow,]  // Цвета для шкалы прогресса
    ),SliderButton(
        title: "Розгинання рукм в нахилі.",
        description: "Описание кнопки 1",
        videoURL: URL(string: ""), // Прямой URL видеофайла
        previewImageName: "30", // Имя изображения из ассетов (опционально).
        progressValues: [1, 1, 0.9, 0.8],
        progressTexts: ["  Довга долонна.", "  Розгинач зап'ястя.",  "  Задня дельта", "  Ліктьовий згинач зап'ястя.", ]
        ,progressColors: [.red, .red, .orange, .yellow,]  // Цвета для шкалы прогресса
    ),
    SliderButton(
        title: "Розгинання за голови.",
        description: "Описание кнопки 1",
        videoURL: URL(string: ""), // Прямой URL видеофайла
        previewImageName: "25", // Имя изображения из ассетов (опционально).
        progressValues: [1, 1, 1, 0],
        progressTexts: [" Тріцепс: Довга головка.", "  Тріцепс: Середня головка.", "  Тріцепс: Бокова головка.",  ""],
        progressColors: [.red, .red, .red, .yellow,]  // Цвета для шкалы прогресса
    ),
    
    SliderButton(
        title: "Французький жим сидячі з блоку.",
        description: "Описание кнопки 1",
        videoURL: URL(string: ""), // Прямой URL видеофайла
        previewImageName: "26", // Имя изображения из ассетов (опционально).
        progressValues: [1, 1, 1, 0],
        progressTexts: [" Тріцепс: Довга головка.", "  Тріцепс: Середня головка.", "  Тріцепс: Бокова головка.",  ""],
        progressColors: [.red, .red, .red, .yellow,]  // Цвета для шкалы прогресса
    ),




]


// Основное представление, содержащее горизонтальный слайдер и кнопки слайдера.
struct Triceps: View {
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
                                ForEach(TRIbuttons.indices, id: \.self) { index in
                                    NavigationLink(destination: DetailView(button: TRIbuttons[index])) {
                                        SliderButtonView(button: TRIbuttons[index], selectedIndex: $selectedIndex, index: index, geometry: geometry)
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
struct TRYMuscleDetailView_Previews: PreviewProvider {
    static var previews: some View {
        Triceps()
    }
}
