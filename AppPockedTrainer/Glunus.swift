import SwiftUI
import AVKit
import WebKit





// Пример данных для кнопок слайдера
let Glutusbuttons = [
    SliderButton(
        title: "Жим ногам.",
        description: "Описание кнопки 1",
        videoURL: URL(string: ""), // Прямой URL видеофайла
        previewImageName: "66", // Имя изображения из ассетов (опционально).
        progressValues: [1, 1, 0.8, 0],
        progressTexts: ["  Ягодицы: Большая ягодичная мышца..", "  Бедра квадрицепс.", "  Бедра бицепс .",  ""]
        ,progressColors: [.red, .red, .yellow, .yellow,]  // Цвета для шкалы прогресса
    ),
    SliderButton(
        title: "Руминська тяга.",
        description: "Описание кнопки 1",
        videoURL: URL(string: "https://www.youtube.com/embed/Sg-1ks5XMYI?si=Zx06syMUIdJO5ctI"), // Прямой URL видеофайла
        previewImageName: "72", // Имя изображения из ассетов (опционально).
        progressValues: [1, 1, 1, 0],
        progressTexts: ["  Сідниці: Великий сідничний м'яз.", "  Стегна біцепс.", "  Спина.",  ""]
        ,progressColors: [.red, .red, .red, .yellow,]  // Цвета для шкалы прогресса
    ),
    SliderButton(
        title: "Станова тяга.",
        description: "Описание кнопки 1",
        videoURL: URL(string: "https://www.youtube.com/embed/gYI-ItE8al0?si=I8aETwN0hNJnqKTs"), // Прямой URL видеофайла
        previewImageName: "60", // Имя изображения из ассетов (опционально).
        progressValues: [1, 1, 0.8, 0.8],
        progressTexts: ["  Сідниці: Великий сідничний м'яз.", "  Бедра квадрицепс.", "   Стегна біцепс.",  "Спина"]
        ,progressColors: [.red, .red, .yellow, .yellow,]  // Цвета для шкалы прогресса
    ),
    SliderButton(
        title: "Гіперестензія.",
        description: "Описание кнопки 1",
        videoURL: URL(string: ""), // Прямой URL видеофайла
        previewImageName: "73", // Имя изображения из ассетов (опционально).
        progressValues: [1, 1, 0.8, 0.8],
        progressTexts: ["  Сідниці: Великий сідничний м'яз.", "  Стегна біцепс.", "  Спина: Розгинач хребта.",  "Гомілка: Ікроніжна."]
        ,progressColors: [.red, .red, .yellow, .yellow,]  // Цвета для шкалы прогресса
    ),
    SliderButton(
        title: "Випади із гантелями.",
        description: "Опис кнопки 1",
        videoURL: URL(string: "https://www.youtube.com/embed/Uga41iTHXzc?si=bzjeHGNDoky-_vQK"), // Прямой URL видеофайла
        previewImageName: "85", // Имя изображения из ассетов (опционально).
        progressValues: [1, 1, 0.8, 0.3],
        progressTexts: ["  Сідниці: Великий сідничний м'яз.", "  Стегна квадрицепс.", "  Стегна біцепс.",  "  Спина: Розгинач хребта"]
        ,progressColors: [.red, .red, .yellow, .green,]  // Цвета для шкалы прогресса
    ),
    
    SliderButton(
        title: "Присідання.",
        description: "Опис кнопки 1",
        videoURL: URL(string: "https://www.youtube.com/embed/OKh6bbwDo7M?si=NsiUS1iWA9Fa5qfw"), // Прямой URL видеофайла
        previewImageName: "62", // Имя изображения из ассетов (опционально).
        progressValues: [1, 1, 0.8, 0.8],
        progressTexts: ["  Сідниці : Великий сідничний м'яз.", "  Стегна квадрицепс.", "  Спина: Розгинач хребта.",  "  Стегна біцепс"]
        ,progressColors: [.red, .red, .red, .yellow,]  // Цвета для шкалы прогресса
    ),
    SliderButton(
        title: "Сіндничний місток.",
        description: "Опис кнопки 1",
        videoURL: URL(string: "https://www.youtube.com/embed/0Cm8dOLjQs4?si=Baw5J5bVDTesUfc8"), // Прямой URL видеофайла
        previewImageName: "199", // Имя изображения из ассетов (опционально).
        progressValues: [1, 1, 1, 0.7],
        progressTexts: ["  Сідниці: Великий сідничний м'яз.", "  Стегна біцепс.", "  М'язи кору.",  "  Стегна квадрицепс."]
        ,progressColors: [.red, .red, .red, .yellow,]  // Цвета для шкалы прогресса
    ),




]


// Основное представление, содержащее горизонтальный слайдер и кнопки слайдера.
struct Glutus: View {
    @Environment(\.presentationMode) var presentationMode

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
                                ForEach(Glutusbuttons.indices, id: \.self) { index in
                                    NavigationLink(destination: DetailView(button: Glutusbuttons[index])) {
                                        SliderButtonView(button: Glutusbuttons[index], selectedIndex: $selectedIndex, index: index, geometry: geometry)
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
struct GlutusDetailView_Previews: PreviewProvider {
    static var previews: some View {
        Glutus()
    }
}
