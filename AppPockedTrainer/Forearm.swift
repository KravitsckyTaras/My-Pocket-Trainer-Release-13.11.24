import SwiftUI
import AVKit
import WebKit





// Пример данных для кнопок слайдера
let Fbuttons = [
    SliderButton(
        title: "Згинання запьястка.",
        description: "Описание кнопки 1",
        videoURL: URL(string: "https://www.youtube.com/embed/U7DReKMtKz0?si=WZTxgK5x3UWBO-LV"), // Прямой URL видеофайла
        previewImageName: "81", // Имя изображения из ассетов (опционально).
        progressValues: [1, 1, 1, 0],
        progressTexts: ["  Довга долонна.", "  Розгинач зап'ястя.", "  Ліктьовий згинач зап'ястя.",  ""]
        ,progressColors: [.red, .red, .red, .yellow,]  // Цвета для шкалы прогресса
    ),
    SliderButton(
        title: "Згинання запьястка з верх. блоку.",
        description: "Описание кнопки 1",
        videoURL: URL(string: "https://www.youtube.com/embed/F6emEG2Ow_g?si=pAgVyowy2AK6I0qp"), // Прямой URL видеофайла
        previewImageName: "19", // Имя изображения из ассетов (опционально).
        progressValues: [1, 1, 1, 0],
        progressTexts: ["  Довга долонна.", "  Розгинач зап'ястя.", "  Ліктьовий згинач зап'ястя.",  ""]
        ,progressColors: [.red, .red, .red, .yellow,]  // Цвета для шкалы прогресса
    ),
    SliderButton(
        title: "Згинання запьястка низ. блоку.",
        description: "Описание кнопки 1",
        videoURL: URL(string: "https://www.youtube.com/embed/Rggxw-j4aw8?si=o3T2cMl0qLBBa3_T"), // Прямой URL видеофайла
        previewImageName: "forearm99", // Имя изображения из ассетов (опционально).
        progressValues: [1, 1, 1, 0],
        progressTexts: ["  Довга долонна.", "  Розгинач зап'ястя.", "  Ліктьовий згинач зап'ястя.",  ""]
        ,progressColors: [.red, .red, .red, .yellow,]  // Цвета для шкалы прогресса
    ),




]


// Основное представление, содержащее горизонтальный слайдер и кнопки слайдера.
struct Forearm: View {
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
                                ForEach(Fbuttons.indices, id: \.self) { index in
                                    NavigationLink(destination: DetailView(button: Fbuttons[index])) {
                                        SliderButtonView(button: Fbuttons[index], selectedIndex: $selectedIndex, index: index, geometry: geometry)
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
struct FMuscleDetailView_Previews: PreviewProvider {
    static var previews: some View {
        Forearm()
    }
}
