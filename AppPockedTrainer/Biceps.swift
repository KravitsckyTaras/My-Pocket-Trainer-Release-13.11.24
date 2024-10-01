
import SwiftUI
import AVKit
import WebKit


// Пример данных для кнопок слайдера
let Bibuttons = [
    SliderButton(
        title: "Підом штанги.",
        description: "Описание кнопки 1",
        videoURL: URL(string: ""), // Прямой URL видеофайла
        previewImageName: "13", // Имя изображения из ассетов (опционально).
        progressValues: [1, 1, 1, 0.8],
        progressTexts: ["  Біцепс: Плечева.", "  Біцепс: Довга головка.", "  Біцепс: Коротка головка.",  "  Передплічча."]
        ,progressColors: [.red, .red, .red, .yellow,]  // Цвета для шкалы прогресса
    ),
    SliderButton(
        title: "Молотки.",
        description: "Описание кнопки 3",
        videoURL: URL(string: ""), // Прямой URL видеофайла
        previewImageName: "14", // Имя изображения из ассетов (опционально).
        progressValues: [1, 1, 0.9, 0.9],
        progressTexts: ["Передплічча.", "  Біцепс: Довга головка.", "  Біцепс: Коротка головка.", "  Біцепс: Плечева."],
        progressColors: [.red, .red, .orange, .orange]  // Цвета для шкалы прогресса
    ),
    SliderButton(
        title: "Підйом гантель сидячі.",
        description: "Описание кнопки 4",
        videoURL: URL(string: ""), // Прямой URL видеофайла
        previewImageName: "21", // Имя изображения из ассетов (опционально).
        progressValues: [1, 1, 1, 0.8],
        progressTexts: ["  Біцепс: Плечева.", "  Біцепс: Довга головка.", "  Біцепс: Коротка головка.",  "  Передплічча."],
        progressColors: [.red, .red, .red, .yellow,]  // Цвета для шкалы прогресса
    ),

    SliderButton(
        title: "Біцепс в блоці.",
        description: "Описание кнопки 3",
        videoURL: URL(string: ""), // Прямой URL видеофайла
        previewImageName: "16", // Имя изображения из ассетов (опционально).
        progressValues: [1, 1, 1, 0.8],
        progressTexts: ["  Біцепс: Плечева.", "  Біцепс: Довга головка.", "  Біцепс: Коротка головка.",  "  Передплічча."],
        progressColors: [.red, .red, .red, .orange]  // Цвета для шкалы прогресса
    ),
    SliderButton(
        title: "Біцепс у кроссовері.",
        description: "Описание кнопки 4",
        videoURL: URL(string: ""), // Прямой URL видеофайла
        previewImageName: "17", // Имя изображения из ассетов (опционально).
        progressValues: [1, 1, 1, 0.9],
        progressTexts: ["  Біцепс: Плечева.", "  Біцепс: Довга головка.", "  Біцепс: Коротка головка.",  "  Передплічча."]
        ,progressColors: [.red, .red, .red, .orange,]  // Цвета для шкалы прогресса
    ),
    SliderButton(
        title: "Підйом з упором в коліно.",
        description: "Описание кнопки 3",
        videoURL: URL(string: ""),
        previewImageName: "18",
        progressValues: [1, 1, 1, 0.9],
        progressTexts: ["  Біцепс: Плечева.", "  Біцепс: Довга головка.", "  Біцепс: Коротка головка.",  "  Передплічча."],
        progressColors: [.red, .red, .red, .orange,] // Цвета для шкалы прогресса
    ),
    SliderButton(
        title: "Підйом з супінаціею.",
        description: "Описание кнопки 4",
        videoURL: URL(string: ""), // Прямой URL видеофайла
        previewImageName: "89", // Имя изображения из ассетов (опционально).
        progressValues: [1, 1, 1, 0.9],
        progressTexts: ["  Біцепс: Плечева.", "  Біцепс: Довга головка.", "  Біцепс: Коротка головка.",  "  Передплічча."],
        progressColors: [.red, .red, .red, .orange,]  // Цвета для шкалы прогресса
    ),
   
    SliderButton(
        title: "Біцепс зі штангою на лавці скотта.",
        description: "Описание кнопки 4",
        videoURL: URL(string: ""), // Прямой URL видеофайла
        previewImageName: "95", // Имя изображения из ассетов (опционально).
        progressValues: [1, 1, 1, 0.8],
        progressTexts: ["  Біцепс: Плечева.", "  Біцепс: Довга головка.", "  Біцепс: Коротка головка.",  "  Передплічча."],
        progressColors: [.red, .red, .red, .orange,]  // Цвета для шкалы прогресса
    ),
    SliderButton(
        title: "Підйом гантель супінація.",
        description: "2",
        videoURL: URL(string: ""),
        previewImageName: "20",
        progressValues: [1, 1, 1, 0.9],
        progressTexts: ["  Біцепс: Плечева.", "  Біцепс: Довга головка.", "  Біцепс: Коротка головка.",  "  Передплічча."],
        progressColors: [.red, .red, .red, .orange,] // Цвета для шкалы прогресса
    ),
    
    SliderButton(
        title: "Підйом зворотнім хватом.",
        description: "Описание кнопки 4",
        videoURL: URL(string: ""), // Прямой URL видеофайла
        previewImageName: "N19", // Имя изображения из ассетов (опционально).
        progressValues: [1, 1, 0.8, 0.8],
        progressTexts: ["  Передплічча.", "  Біцепс: Плечева.", "  Біцепс: Довга головка.", "  Біцепс: Коротка головка.",  ],
        progressColors: [.red, .red, .red, .yellow,]  // Цвета для шкалы прогресса
    ),
    



]


// Основное представление, содержащее горизонтальный слайдер и кнопки слайдера.
struct Biceps: View {
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
                                ForEach(Bibuttons.indices, id: \.self) { index in
                                    NavigationLink(destination: DetailView(button: Bibuttons[index])) {
                                        SliderButtonView(button: Bibuttons[index], selectedIndex: $selectedIndex, index: index, geometry: geometry)
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
struct BiMuscleDetailView_Previews: PreviewProvider {
    static var previews: some View {
        Biceps()
    }
}
