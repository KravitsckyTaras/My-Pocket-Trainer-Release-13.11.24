import SwiftUI
import AVKit
import WebKit





// Пример данных для кнопок слайдера
let Bbuttons = [
    SliderButton(
        title: "Підтягування широким хватом.",
        description: "Описание кнопки 1",
        videoURL: URL(string: "https://www.youtube.com/embed/uNmEHKZn6n0?si=K3RQcE3k0fsfqBvA"), // Прямой URL видеофайла
        previewImageName: "51", // Имя изображения из ассетов (опционально).
        progressValues: [1, 1, 1, 0.7],
        progressTexts: ["  Велика кругла.", "  Ромбоподібна.", "  Найширша.",  "  Біцепс"]
        ,progressColors: [.red, .red, .red, .yellow,]  // Цвета для шкалы прогресса
    ),

    SliderButton(
        title: "Тяга штанги під нахилом.",
        description: "Описание кнопки 2",
        videoURL: URL(string: "https://www.youtube.com/embed/1sRsWno1tF4?si=MsGnVQEZrekg8eif"),
        previewImageName: "52",
        progressValues: [1, 1, 0.8, 0.8],
        progressTexts: [" Трапецеподібна.","  Велика кругла.", "  Найширша", "  Ромбоподібна.", ]
        ,progressColors: [.red, .red, .orange, .orange] // Цвета для шкалы прогресса
    ),
    SliderButton(
        title: "Тяга штанги зворотнім хваьом.",
        description: "Описание кнопки 3",
        videoURL: URL(string: ""),
        previewImageName: "53",
        progressValues: [1, 0.9, 0.8, 0.7],
        progressTexts: [ "Найширша"," Трапецеподібна.", "  Ромбоподібна.","  Велика кругла." ],
        progressColors: [.red, .orange, .orange, .yellow]
    ),
  
    SliderButton(
        title: "Тяга Т-Штанги.",
        description: "Описание кнопки 4",
        videoURL: URL(string: "https://www.youtube.com/embed/PYBU8IPxdKk?si=0jXVfFs8Wu_EJ2CL"), // Прямой URL видеофайла
        previewImageName: "54", // Имя изображения из ассетов (опционально).
        progressValues: [1, 1, 0.8, 0.8],
        progressTexts: ["  Трапеціподібна.", "  Найширшиа.", "  Ромбоподібна.",  "  Велика кругла."]
        ,progressColors: [.red, .red, .yellow, .yellow,]  // Цвета для шкалы прогресса
    ),
    SliderButton(
        title: "Тяга гантелі однією рукою.",
        description: "Описание кнопки 5",
        videoURL: URL(string: "https://www.youtube.com/embed/dik0Bf6l-KI?si=k7L1_QhJ6YfIrfXa"), // Прямой URL видеофайла
        previewImageName: "55", // Имя изображения из ассетов (опционально).
        progressValues: [1, 9, 0.8, 0.6],
        progressTexts: ["  Найшириа","  Трапеціподібна.", "  Мала та велика кругла.", "  Ромбоподібна."  ]
        ,progressColors: [.red, .orange, .yellow, .green,]  // Цвета для шкалы прогресса
    ),

    SliderButton(
        title: "Тяга верхнього блоку.",
        description: "Описание кнопки  6.",
        videoURL: URL(string: ""),
        previewImageName: "56",
        progressValues: [1, 9, 0.8, 0.6],
        progressTexts: [" Велика кругла.", "  Ромбоподібна.","  Наширша.", "  Біцепс."]
        ,progressColors: [.red, .orange, .yellow, .green,] // Цвета для шкалы прогресса
    ),
    SliderButton(
        title: "Вертикальна тяга зворотнім хватом.",
        description: "Описание кнопки 7",
        videoURL: URL(string: "https://www.youtube.com/embed/1sRsWno1tF4?si=rwZf114Q9Rteeq_S"), // Прямой URL видеофайла
        previewImageName: "57", // Имя изображения из ассетов (опционально).
        progressValues: [1, 0.9, 0.9, 6],
        progressTexts: [" Найширша.",  "  Велика кругла.", "  Ромбоподібна.", "Біцепс"],
        progressColors: [.red, .orange, .orange, .green]  // Цвета для шкалы прогресса
    ),
    SliderButton(
        title: "Тяга нижнього блоку.",
        description: "Описание кнопки 8",
        videoURL: URL(string: "https://www.youtube.com/embed/_AmvOkmmFZA?si=EbwUoYJKBPrgicGF"), // Прямой URL видеофайла
        previewImageName: "58", // Имя изображения из ассетов (опционально).
        progressValues: [1, 8, 0.8, 0.7],
        progressTexts: ["  Найширша.", "  Ромбоподібна.", "  Велика кругла.",  "  Трапеціподібна."]
        ,progressColors: [.red, .orange, .orange, .yellow,]  // Цвета для шкалы прогресса
    ),
    SliderButton(
        title: "Пулловер в блоці.",
        description: "Описание кнопки 7",
        videoURL: URL(string: "https://www.youtube.com/embed/1tROmT-tOko?si=fzVZKBYkMhL6s_as"), // Прямой URL видеофайла
        previewImageName: "59", // Имя изображения из ассетов (опционально).
        progressValues: [1, 1, 1, 0.6],
        progressTexts: [" Велика кругла.",  "  Ромбоподібна.", "  Найширша.", " Грудні м'язи"],
        progressColors: [.red, .red, .red, .green]  // Цвета для шкалы прогресса
    ),
   

]


// Основное представление, содержащее горизонтальный слайдер и кнопки слайдера.
struct Back: View {
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
                                ForEach(Bbuttons.indices, id: \.self) { index in
                                    NavigationLink(destination: DetailView(button: Bbuttons[index])) {
                                        SliderButtonView(button: Bbuttons[index], selectedIndex: $selectedIndex, index: index, geometry: geometry)
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
struct BMuscleDetailView_Previews: PreviewProvider {
    static var previews: some View {
        Back()
    }
}
