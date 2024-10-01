import SwiftUI

// Структура данных для хранения информации об имени и URL
struct TrainerInfo {
    let imageName: String
    let name: String
    let telegramURL: String
    let instagramURL: String
}

struct ByContactTrainer: View {
    @Environment(\.openURL) var openURL  // Экземпляр для открытия URL
    
    // Массив с данными тренеров с индивидуальными URL
    let trainerData: [TrainerInfo] = [
        TrainerInfo(imageName: "Sasha", name: "Саша", telegramURL: "https://t.me/Sash88FRDM", instagramURL: "https://www.instagram.com/trener_taras"),
        TrainerInfo(imageName: "Taras", name: "Тарас", telegramURL: "https://t.me/trener_taras", instagramURL: "https://www.instagram.com/trener_taras"),
        TrainerInfo(imageName: "Dobrinia", name: "Добриня", telegramURL: "https://t.me/trener_alexey", instagramURL: "https://www.instagram.com/trener_alexey"),
        TrainerInfo(imageName: "Chel", name: "Аркадій", telegramURL: "https://t.me/trener_olga", instagramURL: "https://www.instagram.com/trener_olga"),
        TrainerInfo(imageName: "Taras1", name: "Максім", telegramURL: "https://t.me/trener_elena", instagramURL: "https://www.instagram.com/trener_elena"),
        TrainerInfo(imageName: "pngwing", name: "???", telegramURL: "https://t.me/trener_dmitriy", instagramURL: "https://www.instagram.com/trener_dmitriy"),
    ]
    
    @State private var showCustomAlert = false
    @State private var selectedTrainer: TrainerInfo?

    var body: some View {
        ZStack { // Используем ZStack для наложения элементов
            // Фоновое изображение
            Image("listBumagy") // Замените на имя вашего изображения
                .resizable()
                .scaledToFill()
                .ignoresSafeArea() // Заполняем весь экран
            
            VStack {
                Text("Обери тренера.")
                    .font(.title)
                    .padding()
                
                // ScrollView для вертикальной прокрутки
                ScrollView {
                    LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 20) {
                        ForEach(trainerData, id: \.name) { trainer in
                            VStack { // Изменено на VStack, чтобы разместить имя над изображением
                                
                                // Изображение тренера
                                Button(action: {
                                    selectedTrainer = trainer
                                    showCustomAlert = true  // Показываем кастомный алерт
                                }) {
                                    Image(trainer.imageName)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 180, height: 180)
                                        .cornerRadius(10)
                                        .shadow(color: .gray, radius: 5, x: 0, y: 5)
                                }
                                
                                // Черный фон с прозрачностью под текстом имени
                                ZStack {
                                    Color.black.opacity(0.5)
                                        .cornerRadius(10)

                                    Text("Тренер \(trainer.name)") // Имя тренера с приставкой
                                        .font(.headline)
                                        .foregroundColor(.white)
                                        .padding(5) // Отступ для текста
                                }
                                .frame(width: 150) // Устанавливаем ширину, равную ширине изображения
                            }
                            .padding(.vertical, 5)  // Вертикальные отступы между элементами
                        }
                    }
                    .padding()
                }
            }
            .overlay(
                VStack {
                    if showCustomAlert {
                        VStack(spacing: 20) {
                            HStack {
                                VStack(alignment: .leading, spacing: 10) {
                                    Text("Тренер \(selectedTrainer?.name ?? "Тренер")") // Добавляем "Тренер" перед именем
                                        .font(.system(size: 18, weight: .bold))
                                }
                                .frame(maxWidth: .infinity, alignment: .leading)

                                Image(selectedTrainer?.imageName ?? "")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 110, height: 110)
                            }
                            .padding(.horizontal)

                            HStack(spacing: 20) {
                                Button("Telegram") {
                                    if let url = URL(string: selectedTrainer?.telegramURL ?? "") {
                                        openURL(url)
                                    }
                                }
                                .padding(.horizontal, 20)
                                .padding(.vertical, 10)
                                .background(Color.blue)
                                .foregroundColor(.white)
                                .cornerRadius(8)
                                
                                Button("Instagram") {
                                    if let url = URL(string: selectedTrainer?.instagramURL ?? "") {
                                        openURL(url)
                                    }
                                }
                                .padding(.horizontal, 20)
                                .padding(.vertical, 10)
                                .background(Color.pink)
                                .foregroundColor(.white)
                                .cornerRadius(8)
                            }
                            .padding(.top, 10)
                        }
                        .frame(width: 280, height: 220)
                        .background(Color.white)
                        .cornerRadius(12)
                        .shadow(radius: 20)
                        .overlay(
                            Button(action: {
                                showCustomAlert = false
                            }) {
                                Image(systemName: "xmark.circle")
                                    .foregroundColor(.red)
                                    .font(.system(size: 30))
                                    .padding(.top, 10)
                            }
                            .padding(.trailing, 130)
                            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
                        )
                    }
                }
            )

        }
    }
}

struct ByContactTrainer_Previews: PreviewProvider {
    static var previews: some View {
        ByContactTrainer()
    }
}
