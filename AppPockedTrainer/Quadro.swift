import SwiftUI
import AVKit
import WebKit





// Пример данных для кнопок слайдера
let Quadrobuttons = [
    SliderButton(
        title: "Присідання.",
        description: "Опис кнопки 1",
        videoURL: URL(string: "https://www.youtube.com/embed/OKh6bbwDo7M?si=NsiUS1iWA9Fa5qfw"), // Прямой URL видеофайла
        previewImageName: "62", // Имя изображения из ассетов (опционально).
        progressValues: [1, 1, 0.8, 0.8],
        progressTexts: ["  Сідниці.", "  Стегна квадрицепс.", "  Спина .",  "Стегна біцепс"]
        ,progressColors: [.red, .red, .yellow, .yellow,]  // Цвета для шкалы прогресса
    ),
    SliderButton(
        title: "Присідання у Сміті.",
        description: "Опис кнопки  1",
        videoURL: URL(string: ""), // Прямой URL видеофайла
        previewImageName: "63", // Имя изображения из ассетов (опционально).
        progressValues: [1, 1, 0.8, 0.8],
        progressTexts: ["  Сідниці.", "  Стегна квадрицепс.", "  Стегна біцепс",  ""]
        ,progressColors: [.red, .red, .yellow, .yellow,]  // Цвета для шкалы прогресса
    ),
    SliderButton(
        title: "Фронтальні присідання у Сміті.",
        description: "Опис кнопки  1",
        videoURL: URL(string: "https://www.youtube.com/embed/siBvG_gKhfU?si=2ilP72GxKVfxcHNm"), // Прямой URL видеофайла
        previewImageName: "64", // Имя изображения из ассетов (опционально).
        progressValues: [1, 1, 0.8, 0.8],
        progressTexts: ["  Сідниці.", "  Стегна квадрицепс.", "  Стегна біцепс",  ""]
        ,progressColors: [.red, .red, .yellow, .yellow,]  // Цвета для шкалы прогресса
    ),
    SliderButton(
        title: "Гак-присідання.",
        description: "Опис кнопки  1",
        videoURL: URL(string: ""), // Прямой URL видеофайла
        previewImageName: "65", // Имя изображения из ассетов (опционально).
        progressValues: [1, 1, 0.8, 0.8],
        progressTexts: ["  Сідниці.", "  Стегна квадрицепс.", "  Спина .",  "Стегна біцепс"]
        ,progressColors: [.red, .red, .yellow, .yellow,]  // Цвета для шкалы прогресса
    ),
    SliderButton(
        title: "Виподи зі штангою.",
        description: "Опис кнопки  1",
        videoURL: URL(string: "https://www.youtube.com/embed/PiVE_Ulh_F0?si=1FSokkVbEEhxk34p"), // Прямой URL видеофайла
        previewImageName: "67", // Имя изображения из ассетов (опционально).
        progressValues: [1, 1, 0.8, 0.8],
        progressTexts: ["  Сідниці.", "  Стегна квадрицепс.", "  Спина .",  "Стегна біцепс"]
        ,progressColors: [.red, .red, .yellow, .yellow,]  // Цвета для шкалы прогресса
    ),
    SliderButton(
        title: "Підйом на платформу.",
        description: "Опис кнопки  1",
        videoURL: URL(string: ""), // Прямой URL видеофайла
        previewImageName: "68", // Имя изображения из ассетов (опционально).
        progressValues: [1, 1, 0.8, 0.8],
        progressTexts: ["  Сідниці.", "  Стегна квадрицепс.", "  Стегна біцепс",  ""]
        ,progressColors: [.red, .red, .yellow, .yellow,]  // Цвета для шкалы прогресса
    ),
    SliderButton(
        title: "Розгинання ніг сидячі.",
        description: "Опис кнопки  1",
        videoURL: URL(string: "https://www.youtube.com/embed/VBrRYOI-jfM?si=xtZ6LS8i0ujVIRFz"), // Прямой URL видеофайла
        previewImageName: "69", // Имя изображения из ассетов (опционально).
        progressValues: [1, 1, 1, 0],
        progressTexts: ["  Стегна квадрицепс: Широка медіальна.", "  Стегна квадрицепс: Широка латеральна.", "  Стегна квадрицепс: Прямий м'яз стегна.",  ""]
        ,progressColors: [.red, .red, .red, .yellow,]  // Цвета для шкалы прогресса
    ),
    
    SliderButton(
        title: "Ривок штанги на груди.",
        description: "Опис кнопки  1",
        videoURL: URL(string: ""), // Прямой URL видеофайла
        previewImageName: "70", // Имя изображения из ассетов (опционально).
        progressValues: [1, 1, 1, 0.8],
        progressTexts: ["  Плечі.", "  Сідниці.", "  Стегна квадрицепс.",  "  Стегна біцепс"]
        ,progressColors: [.red, .red, .red, .yellow,]  // Цвета для шкалы прогресса
    ),
    
    




]


// Основное представление, содержащее горизонтальный слайдер и кнопки слайдера.
struct Quadro: View {
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
                                ForEach(Quadrobuttons.indices, id: \.self) { index in
                                    NavigationLink(destination: DetailView(button: Quadrobuttons[index])) {
                                        SliderButtonView(button: Quadrobuttons[index], selectedIndex: $selectedIndex, index: index, geometry: geometry)
                                    }
                                }
                            }
                            .padding()
                        }
                        .padding(.top, -90)
                        
                    }
                }
                VStack {
                    // Ваш основной контент здесь
                    
                    Spacer() // Отодвигает содержимое вверх

                    // Иконка "Назад" внизу
                    Button(action: {
                        // Возврат на предыдущий экран
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
        .navigationBarBackButtonHidden(true) // Скрыть кнопку «Назад»
    }
}

// Провайдер предварительного просмотра для SwiftUI.
struct QuadroDetailView_Previews: PreviewProvider {
    static var previews: some View {
        Quadro()
    }
}
