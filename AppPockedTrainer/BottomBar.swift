import SwiftUI
import AVKit
import WebKit





// Пример данных для кнопок слайдера
let CalfMusculesbuttons = [
    SliderButton(
        title: "Підйом на носки стоячі.",
        description: "Опис кнопки",
        videoURL: URL(string: ""), // Прямой URL видеофайла
        previewImageName: "77", // Имя изображения из ассетов (опционально).
        progressValues: [1, 1, 1, 0],
        progressTexts: ["   Ікроніжна.", "  Камболоподібна.", "  Довга малогомілкова.",  ""]
        ,progressColors: [.red, .red, .red, .yellow,]  // Цвета для шкалы прогресса
    ),
    SliderButton(
        title: "Підйом платформи у тренажері.",
        description: "Опис кнопки",
        videoURL: URL(string: "https://www.youtube.com/embed/lpdvUgM1VDY?si=XyP9laQ_LQHQtgSI"), // Прямой URL видеофайла
        previewImageName: "78", // Имя изображения из ассетов (опционально).
        progressValues: [1, 1, 0, 0],
        progressTexts: ["  Ікроніжна.", "  Камболоподібна.", "",  ""]
        ,progressColors: [.red, .red, .red, .yellow,]  // Цвета для шкалы прогресса
    ),
    SliderButton(
        title: "Підйом на носки сидячі.",
        description: "Опис кнопки",
        videoURL: URL(string: ""), // Прямой URL видеофайла
        previewImageName: "79", // Имя изображения из ассетов (опционально).
        progressValues: [1, 1, 0, 0],
        progressTexts: ["  Ікроніжна.", "  Камболоподібна.", "",  ""]
        ,progressColors: [.red, .red, .red, .yellow,]  // Цвета для шкалы прогресса
    ),
    SliderButton(
        title: "Підйоми носки в гору.",
        description: "Опис кнопки",
        videoURL: URL(string: ""), // Прямой URL видеофайла
        previewImageName: "80", // Имя изображения из ассетов (опционально).
        progressValues: [1, 1, 0, 0],
        progressTexts: ["  Передня великогомілкова.", "  Довгий розгинач пальців стопи.", "  ",  ""]
        ,progressColors: [.red, .red, .red, .yellow,]  // Цвета для шкалы прогресса
    ),




]


// Основное представление, содержащее горизонтальный слайдер и кнопки слайдера.
struct BottomBar: View {
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
                                ForEach(CalfMusculesbuttons.indices, id: \.self) { index in
                                    NavigationLink(destination: DetailView(button: CalfMusculesbuttons[index])) {
                                        SliderButtonView(button: CalfMusculesbuttons[index], selectedIndex: $selectedIndex, index: index, geometry: geometry)
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
struct BottomBar_Previews: PreviewProvider {
    static var previews: some View {
        BottomBar()
    }
}
