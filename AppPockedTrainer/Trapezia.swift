import SwiftUI
import AVKit
import WebKit





// Пример данных для кнопок слайдера
let Tbuttons = [
    SliderButton(
        title: "Тяга штанги до підборіддя.",
        description: "Описание кнопки 1",
        videoURL: URL(string: "https://www.youtube.com/embed/Cz3BIJ71m6U?si=qghbg5KZ1se5nzCh"), // Прямой URL видеофайла
        previewImageName: "94", // Имя изображения из ассетов (опционально).
        progressValues: [1, 1, 0.8, 0],
        progressTexts: ["  Трапеціподібна.", "  Ромбодібна.", "  Шия.",  ""]
        ,progressColors: [.red, .red, .orange, .yellow,]  // Цвета для шкалы прогресса
    ),

    SliderButton(
        title: "Шрагі зі штангою перед собою.",
        description: "2",
        videoURL: URL(string: "https://www.youtube.com/embed/MPDdhA4sqcY?si=NqZXMgEsm4u_qnVv"),
        previewImageName: "1",
        progressValues: [1, 1, 0.7, 0.6],
        progressTexts: [" Верх Трапецібодібноі.", "  Середина Трапецібодібноі.","  Шия.", "  Ромбоподібна."]
        ,progressColors: [.red, .red, .orange, .yellow,] // Цвета для шкалы прогресса
    ),
    SliderButton(
        title: "Шраги зі штангою за спиною.",
        description: "Описание кнопки 3",
        videoURL: URL(string: ""), // Прямой URL видеофайла
        previewImageName: "2", // Имя изображения из ассетов (опционально).
        progressValues: [1, 0.7, 0.7, 0],
        progressTexts: [" Верх трапеціподібноі.",  "  Ромбоподібна.", "  Шия.", ""],
        progressColors: [.red, .orange, .orange, .yellow]  // Цвета для шкалы прогресса
    ),
    SliderButton(
        title: "Тяга штанги до підборіддя.",
        description: "Описание кнопки 4",
        videoURL: URL(string: ""), // Прямой URL видеофайла
        previewImageName: "3", // Имя изображения из ассетов (опционально).
        progressValues: [1, 1, 0.8, 0.4],
        progressTexts: ["  Трапеціподібна.", "  Середня дельта.", "  Передня дельта.",  "  Біцепс."]
        ,progressColors: [.red, .red, .orange, .yellow,]  // Цвета для шкалы прогресса
    ),

]


// Основное представление, содержащее горизонтальный слайдер и кнопки слайдера.
struct Trapezia: View {
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
                                ForEach(Tbuttons.indices, id: \.self) { index in
                                    NavigationLink(destination: DetailView(button: Tbuttons[index])) {
                                        SliderButtonView(button: Tbuttons[index], selectedIndex: $selectedIndex, index: index, geometry: geometry)
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
struct TMuscleDetailView_Previews: PreviewProvider {
    static var previews: some View {
        Trapezia()
    }
}
