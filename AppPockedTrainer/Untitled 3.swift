import SwiftUI

struct AdaptiveSliderView: View {
    let buttonData: [ButtonData] // Ваш масив даних для кнопок
    
    var body: some View {
        GeometryReader { geometry in
            ScrollViewReader { proxy in
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 20) { // Простір між кнопками
                        ForEach(buttonData.indices, id: \.self) { index in
                            NavigationLink(destination: NextView(imageName: buttonData[index].imageName)) { // Переход на нове вікно
                                Image(buttonData[index].imageName) // Використання користувацького зображення
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: min(geometry.size.width * 0.8, 350), height: buttonData[index].size) // Ширина кнопок адаптується до ширини екрана
                                    .padding(.horizontal, 5) // Відступи зліва і справа для кнопок
                                    .background(Color.black.opacity(0.4)) // Опціонально: фон для кнопки
                                    .cornerRadius(10) // Скруглення кутів
                                    .id(index) // Унікальний ідентифікатор для прокрутки
                            }
                        }
                    }
                    .frame(height: 500) // Висота ScrollView
                    .padding(.horizontal) // Відступи по горизонталі для ScrollView
                }
                .frame(width: geometry.size.width) // Ширина ScrollView адаптується до ширини екрана
            }
        }
        .frame(height: 500) // Висота контейнера
    }
}

// Приклад даних для кнопок
struct ButtonData {
    let imageName: String
    let size: CGFloat
}

struct NextView: View {
    let imageName: String
    
    var body: some View {
        Text("Selected image: \(imageName)")
    }
}
