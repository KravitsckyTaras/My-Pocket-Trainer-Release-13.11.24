import SwiftUI
import AVKit
import WebKit





// Пример данных для кнопок слайдера
let Fbuttons = [
    SliderButton(
        title: "Згинання запьястка.",
        description: "Описание кнопки 1",
        videoURL: URL(string: ""), // Прямой URL видеофайла
        previewImageName: "81", // Имя изображения из ассетов (опционально).
        progressValues: [1, 1, 1, 0],
        progressTexts: ["  Довга долонна.", "  Розгинач зап'ястя.", "  Ліктьовий згинач зап'ястя.",  ""]
        ,progressColors: [.red, .red, .red, .yellow,]  // Цвета для шкалы прогресса
    ),
    SliderButton(
        title: "Згинання запьястка.",
        description: "Описание кнопки 1",
        videoURL: URL(string: ""), // Прямой URL видеофайла
        previewImageName: "19", // Имя изображения из ассетов (опционально).
        progressValues: [1, 1, 1, 0],
        progressTexts: ["  Довга долонна.", "  Розгинач зап'ястя.", "  Ліктьовий згинач зап'ястя.",  ""]
        ,progressColors: [.red, .red, .red, .yellow,]  // Цвета для шкалы прогресса
    ),




]


// Основное представление, содержащее горизонтальный слайдер и кнопки слайдера.
struct Forearm: View {
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
                                ForEach(Fbuttons.indices, id: \.self) { index in
                                    NavigationLink(destination: DetailView(button: Fbuttons[index])) {
                                        SliderButtonView(button: Fbuttons[index], selectedIndex: $selectedIndex, index: index, geometry: geometry)
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
struct FMuscleDetailView_Previews: PreviewProvider {
    static var previews: some View {
        Forearm()
    }
}
