import SwiftUI

struct ContentView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var showContactTrainer = false
    let images = ["Arny2", "KayG", "Kevin", "Khris", "Ohern"] // Замените на ваши реальные имена изображений

    var body: some View {
        NavigationView { // Добавляем NavigationView для корректной работы навигации
            ZStack {
                // Фоновое изображение
                Image("listBumagy") // Замените "listBumagy" на название вашего фонового изображения
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all) // Убирает границы для изображения, чтобы оно охватывало весь экран

                VStack {
                    // Верхняя строка с тремя кнопками
                    HStack {
                        VStack {
                            NavigationLink(destination: Muscules()) {
                                Image("worckaut")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 80, height: 80)
                                    .padding(10)
                                    .background(Color.black.opacity(0.4))
                                    .cornerRadius(10)
                            }
                            Text("Вправи.")
                                .padding(1)
                                .background(Color.black.opacity(0.2))
                                .font(.system(size: 15))
                                .foregroundColor(.black)
                                .fontWeight(.bold)
                                .cornerRadius(4)
                                .padding(5)
                                .fontWeight(.bold)
                        }
                        .frame(maxWidth: .infinity)

                        VStack {
                            NavigationLink(destination: MyData2()) {
                                Image("biceps")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 80, height: 80)
                                    .padding(10)
                                    .background(Color.black.opacity(0.4))
                                    .cornerRadius(10)
                            }
                            Text("Заміри.")
                                .padding(1)
                                .background(Color.black.opacity(0.2))
                                .font(.system(size: 15))
                                .foregroundColor(.black)
                                .fontWeight(.bold)
                                .cornerRadius(4)
                                .padding(5)
                                .fontWeight(.bold)
                        }
                        .frame(maxWidth: .infinity)

                        VStack {
                            NavigationLink(destination: NewTrainingWindow()) {
                                Image("blaknot")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 80, height: 80)
                                    .padding(10)
                                    .background(Color.black.opacity(0.4))
                                    .cornerRadius(10)
                            }
                            Text("Тренування.")
                                .padding(1)
                                .background(Color.black.opacity(0.2))
                                .font(.system(size: 15))
                                .foregroundColor(.black)
                                .fontWeight(.bold)
                                .cornerRadius(4)
                                .padding(5)
                                .fontWeight(.bold)
                        }
                        .frame(maxWidth: .infinity)
                    }
                    .padding(.horizontal, 20)

                    // Горизонтальный слайдер изображений
                    GeometryReader { geometry in
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 20) {
                                ForEach(images, id: \.self) { imageName in
                                    Image(imageName)
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: geometry.size.width * imageWidthMultiplier(for: geometry.size.width),
                                               height: imageHeight(for: geometry.size.width)) // Вызов функции для высоты
                                        .background(Color.black.opacity(0.4))
                                        .cornerRadius(10)
                                        .shadow(radius: 5)
                                }
                            }
                            .padding(.horizontal, 20)
                        }
                        .frame(height: imageHeight(for: geometry.size.width)) // Используем функцию для высоты
                        .padding(.vertical, 20)
                    }
                    .frame(height: imageHeight(for: UIScreen.main.bounds.width)) // Используем функцию для высоты

                    Spacer()
                        .padding()

                    // Нижняя кнопка
                    Button(action: {
                        showContactTrainer.toggle()
                    }) {
                        Text("Зв'язок з тренером")
                            .font(.system(size: 24))
                            .foregroundColor(.black)
                            .font(.headline)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.black.opacity(0.4))
                            .cornerRadius(10)
                            .shadow(radius: 5)
                            .fontWeight(.bold)
                    }
                    .padding(.horizontal, 20)
                    .padding(.bottom, 10)
                }
                
                .padding()
                .sheet(isPresented: $showContactTrainer) {
                    ByContactTrainer()
                }
                

            }

        }
        .navigationBarBackButtonHidden(true) // Скрыть кнопку «Назад»
        
    }

    // Функция для расчета множителя ширины изображения
    private func imageWidthMultiplier(for screenWidth: CGFloat) -> CGFloat {
        return 0.9 // Вы можете настроить это значение по необходимости
    }

    // Функция для расчета высоты слайдера на основе ширины экрана
    private func imageHeight(for screenWidth: CGFloat) -> CGFloat {
        switch screenWidth {
        case ..<375: // iPhone SE и другие маленькие экраны
            return 350 // Высота для маленьких экранов
        case 376...414: // iPhone 12, iPhone 13 mini и другие экраны средней ширины
            return 450 // Высота для средних экранов
        case 415...: // iPhone Plus, Max и другие большие экраны
            return 550 // Высота для больших экранов
        default:
            return 250 // Значение по умолчанию для средней ширины
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
