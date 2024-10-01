import SwiftUI

// Структура для представлення секції з полями
struct InputFieldSection: Identifiable, Codable {
    var id = UUID() // Генеруємо новий UUID при ініціалізації
    var fields: [String]
    var selectedExerciseName: String?
    var selectedImage: String?
}

struct BoockTraining: View {
    @State private var inputFields: [InputFieldSection] = []
    @State private var showingSaveAlert = false
    @State private var showingLoadAlert = false
    @FocusState private var currentFieldIndex: Int? // Змінено на FocusState
    @State private var enteredText: String = "" // Додаємо стан для текстового поля

    var body: some View {
        NavigationView {
            ZStack {
                Image("listBumagy")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
                VStack {
                    ScrollView {
                        VStack {
                            ForEach($inputFields) { $section in
                                VStack {
                                    Text(section.selectedExerciseName ?? "Вправа")
                                        .frame(maxWidth: .infinity)
                                        .frame(height: 50)
                                        .background(Color.black.opacity(0.2))
                                        .shadow(radius: 5)

                                    HStack {
                                        VStack(spacing: 10) {
                                            HStack(spacing: 10) {
                                                ForEach(0..<4, id: \.self) { index in
                                                    TextField("Вага", text: Binding(
                                                        get: { section.fields.indices.count > index ? section.fields[index] : "" },
                                                        set: { newValue in
                                                            if section.fields.indices.count > index {
                                                                section.fields[index] = newValue
                                                            } else {
                                                                section.fields.append(newValue)
                                                            }
                                                            // Дублюємо текст у текстове поле
                                                            enteredText = newValue
                                                        }
                                                    ))
                                                    .frame(width: 60, height: 40)
                                                    .background(Color.gray.opacity(0.1))
                                                    .cornerRadius(8)
                                                    .keyboardType(.decimalPad)
                                                    .shadow(radius: 5)
                                                    .focused($currentFieldIndex, equals: index) // Додаємо фокус
                                                }
                                            }
                                            HStack(spacing: 10) {
                                                ForEach(0..<4, id: \.self) { index in
                                                    TextField("Повторення", text: Binding(
                                                        get: { section.fields.indices.count > (index + 4) ? section.fields[index + 4] : "" },
                                                        set: { newValue in
                                                            if section.fields.indices.count > (index + 4) {
                                                                section.fields[index + 4] = newValue
                                                            } else {
                                                                section.fields.append(newValue)
                                                            }
                                                            // Дублюємо текст у текстове поле
                                                            enteredText = newValue
                                                        }
                                                    ))
                                                    .frame(width: 60, height: 40)
                                                    .background(Color.gray.opacity(0.1))
                                                    .cornerRadius(8)
                                                    .keyboardType(.decimalPad)
                                                    .shadow(radius: 5)
                                                    .focused($currentFieldIndex, equals: index + 4) // Додаємо фокус
                                                }
                                            }
                                        }
                                        NavigationLink(destination: DDetailView(selectedExerciseName: $section.selectedExerciseName, selectedImage: $section.selectedImage)) {
                                            if let imageName = section.selectedImage {
                                                Image(imageName)
                                                    .resizable()
                                                    .frame(width: 100, height: 100)
                                                    .background(Color.gray.opacity(0.2))
                                                    .cornerRadius(8)
                                                    .shadow(radius: 5)
                                            } else {
                                                Image("0")
                                                    .resizable()
                                                    .frame(width: 100, height: 100)
                                                    .background(Color.gray.opacity(0.2))
                                                    .cornerRadius(8)
                                                    .shadow(radius: 5)
                                            }
                                        }
                                    }
                                }
                            }

                            HStack {
                                Image(systemName: "plus.circle")
                                    .resizable()
                                    .frame(width: 60, height: 60)
                                    .foregroundColor(.black)
                                    .padding(.top, 50)
                                    .onTapGesture {
                                        // Перевіряємо, чи всі поля заповнені перед додаванням нової секції
                                        let allFieldsFilled = inputFields.allSatisfy { section in
                                            section.fields.count >= 8 && !section.fields.contains(where: { $0.isEmpty })
                                        }
                                        if allFieldsFilled {
                                            inputFields.append(InputFieldSection(fields: Array(repeating: "", count: 8), selectedExerciseName: nil, selectedImage: nil))
                                        }
                                    }

                                Image(systemName: "xmark.circle")
                                    .resizable()
                                    .frame(width: 60, height: 60)
                                    .foregroundColor(.red)
                                    .padding(.top, 50)
                                    .onTapGesture {
                                        if !inputFields.isEmpty {
                                            inputFields.removeLast()
                                        }
                                    }
                            }
                        }
                    }
                }
                .toolbar {
                    ToolbarItemGroup(placement: .keyboard) {
                        Button("Готово") {
                            // Закриваємо клавіатуру
                            UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                        }
                        .padding()

                        // Додаємо лейбл між кнопками з перевіркою на порожній текст
                        Text(enteredText.isEmpty ? currentFieldPlaceholder : enteredText)
                            .frame(width: 150) // Задайте ширину лейблу за потреби


                        Button("Наступне") {
                            // Змінюємо фокус на наступне поле
                            if let currentIndex = currentFieldIndex {
                                if currentIndex < 7 { // Якщо це не останнє поле
                                    currentFieldIndex = currentIndex + 1
                                } else {
                                    currentFieldIndex = nil // Скидаємо фокус, якщо це останнє поле
                                    // Перевіряємо, чи всі поля заповнені перед додаванням нової секції
                                    let allFieldsFilled = inputFields.allSatisfy { section in
                                        section.fields.count >= 8 && !section.fields.contains(where: { $0.isEmpty })
                                    }
                                    if allFieldsFilled {
                                        inputFields.append(InputFieldSection(fields: Array(repeating: "", count: 8), selectedExerciseName: nil, selectedImage: nil))
                                    }
                                }
                            } else {
                                currentFieldIndex = 0 // Якщо немає активного поля, починаємо з першого
                            }
                        }
                        .padding()
                    }
                }
                .toolbar {
                    ToolbarItemGroup(placement: .navigationBarLeading) {
                        ZStack(alignment: .leading) {
                            Rectangle()
                                .foregroundColor(.gray.opacity(0.0))
                                .frame(width: UIScreen.main.bounds.width  - 10, height: 44)
                                .edgesIgnoringSafeArea(.top)

                            HStack(spacing: 15) {
                                NavigationLink(destination: ContentView()) {
                                    Image(systemName: "house")
                                        .font(.headline)
                                        .foregroundColor(.black)
                                }
                                Button(action: {
                                    showingSaveAlert = true
                                }) {
                                    Image(systemName: "square.and.arrow.down")
                                        .rotationEffect(.degrees(180))
                                        .font(.headline)
                                        .foregroundColor(.black)
                                        .offset(y: 3)
                                }
                                .alert("Виберіть день для збережеення данних.", isPresented: $showingSaveAlert) {
                                    Button("Зберегти понеділок.") { saveData(for: "Понеділок.") }
                                    Button("Зберегти вівторок") { saveData(for: "Вівторок") }
                                    Button("Зберегти середа") { saveData(for: "Середа") }
                                    Button("Зберегти четвер") { saveData(for: "Четвер") }
                                    Button("Зберегти п'ятниця") { saveData(for: "П'ятниця") }
                                    Button("Зберегти субота") { saveData(for: "Субота") }
                                    Button("Зберегти неділя") { saveData(for: "Неділя") }
                                    Button("Скасувати", role: .cancel) {}
                                }

                                Button(action: {
                                    showingLoadAlert = true
                                }) {
                                    Image(systemName: "arrow.down.circle")
                                        
                                           .foregroundColor(.black)
                                           .font(.headline)
                                }
                                .alert("Виберіть день для завантаження", isPresented: $showingLoadAlert) {
                                    Button("Згадати понеділок") { loadData(for: "Понеділок.") }
                                    Button("Згадати вівторок") { loadData(for: "Вівторок") }
                                    Button("Згадати середа") { loadData(for: "Середа") }
                                    Button("Згадати четвер") { loadData(for: "Четвер") }
                                    Button("Згадати п'ятниця") { loadData(for: "П'ятниця") }
                                    Button("Згадати субота") { loadData(for: "Субота") }
                                    Button("Згадати неділя") { loadData(for: "Неділя") }
                                    Button("Скасувати", role: .cancel) {}
                                }
                            }
                            
                        }
                        
                    }
                    
                }
                
            }

            
        }
        .navigationBarBackButtonHidden(true) // Скрыть кнопку «Назад»

    }
    

    // Зберігаємо дані для вибраного дня
    private func saveData(for day: String) {
        if let encoded = try? JSONEncoder().encode(inputFields) {
            UserDefaults.standard.set(encoded, forKey: day)
        }
    }

    // Завантажуємо дані для вибраного дня
    private func loadData(for day: String) {
        if let data = UserDefaults.standard.data(forKey: day),
           let decoded = try? JSONDecoder().decode([InputFieldSection].self, from: data) {
            inputFields = decoded
        }
    }


    private var currentFieldPlaceholder: String {
        // Повертає відповідний текст залежно від активного поля
        guard let index = currentFieldIndex else { return "" }
        return index < 4 ? "Вага" : "Повторення"
    }
}

struct BoockTraining_Previews: PreviewProvider {
    static var previews: some View {
        BoockTraining()
    }
}
