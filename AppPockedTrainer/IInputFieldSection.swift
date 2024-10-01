//
//  IInputFieldSection.swift
//  AppPockedTrainer
//
//  Created by Imac Taras on 11.10.2024.
//


import SwiftUI

// Структура для представлення секції з полями
struct IInputFieldSection: Identifiable, Codable {
    var id = UUID() // Генеруємо новий UUID при ініціалізації
    var fields: [String]
    var selectedExerciseName: String?
    var selectedImage: String?
}

// Функція для збереження даних
func saveData(for day: String, inputFields: [IInputFieldSection]) {
    let encoder = JSONEncoder()
    if let encoded = try? encoder.encode(inputFields) {
        UserDefaults.standard.set(encoded, forKey: day)
    }
}

// Функція для завантаження даних
func loadData(for day: String) -> [IInputFieldSection]? {
    if let savedData = UserDefaults.standard.object(forKey: day) as? Data {
        let decoder = JSONDecoder()
        if let loaded = try? decoder.decode([IInputFieldSection].self, from: savedData) {
            return loaded
        }
    }
    return nil
}

struct ScrolWeuve: View {
    @State private var keyboardHeight: CGFloat = 0
    @State private var inputFields: [IInputFieldSection] = []
    @FocusState private var currentFieldIndex: Int?
    @State private var enteredText: String = ""
    
    // Стан для представлення діалогу з днями тижня
    @State private var showingDaysOfWeek = false
    @State private var showingDownloadDays = false

    var body: some View {
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
                                                enteredText = newValue
                                            }
                                        ))
                                        .frame(width: 60, height: 40)
                                        .background(Color.gray.opacity(0.1))
                                        .cornerRadius(8)
                                        .keyboardType(.decimalPad)
                                        .shadow(radius: 5)
                                        .focused($currentFieldIndex, equals: index)
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
                                                enteredText = newValue
                                            }
                                        ))
                                        .frame(width: 60, height: 40)
                                        .background(Color.gray.opacity(0.1))
                                        .cornerRadius(8)
                                        .keyboardType(.decimalPad)
                                        .shadow(radius: 5)
                                        .focused($currentFieldIndex, equals: index + 4)
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
                                    Image("dumble")
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
                            inputFields.append(IInputFieldSection(fields: Array(repeating: "", count: 8), selectedExerciseName: nil, selectedImage: nil))
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
            .padding(.bottom, keyboardHeight)
        }
        
        .background(
                    Image("listBumagy") // Замените на имя вашего изображения
                        .resizable()
                        .scaledToFill()
                        .ignoresSafeArea()
                )
        
        .onAppear {
            NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillShowNotification, object: nil, queue: .main) { notification in
                if let userInfo = notification.userInfo,
                   let frame = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect {
                    keyboardHeight = frame.height
                }
            }
            NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillHideNotification, object: nil, queue: .main) { _ in
                keyboardHeight = 0
            }
        }
        .onDisappear {
            NotificationCenter.default.removeObserver(self)
        }
        .toolbar {
            ToolbarItemGroup(placement: .keyboard) {
                Button("Готово") {
                    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                }
                
                Text(enteredText.isEmpty ? currentFieldPlaceholder : enteredText)
                    .frame(width: 150)

                Button("Наступне") {
                    if let currentIndex = currentFieldIndex {
                        if currentIndex < 7 {
                            currentFieldIndex = currentIndex + 1
                        } else {
                            currentFieldIndex = nil
                        }
                    } else {
                        currentFieldIndex = 0
                    }
                }
            }
        }
        .toolbar {
            ToolbarItemGroup(placement: .navigationBarLeading) {
                NavigationLink(destination: ContentView()) { // Додано NavigationLink для повернення до ContentView
                    Image(systemName: "house")
                        .foregroundColor(Color.black)
                }
                Button(action: {
                    showingDownloadDays.toggle()
                }) {
                    Image(systemName: "chevron.down")
                        .foregroundColor(Color.black)
                }
                Button(action: {
                    showingDaysOfWeek.toggle()
                }) {
                    Image(systemName: "chevron.up")
                        .foregroundColor(Color.black)
                }

            }
            ToolbarItemGroup(placement: .navigationBarTrailing) {
                 Button(action: {
                     inputFields.removeAll() // Очистить все упражнения с экрана
                 }) {
                     Image(systemName: "trash")
                         .foregroundColor(Color.black)
                 }
             }
        }
        .navigationBarBackButtonHidden(true)
        .sheet(isPresented: $showingDaysOfWeek) {
            DaysOfWeekView(inputFields: $inputFields, showingDaysOfWeek: $showingDaysOfWeek) // Передайте inputFields і showingDaysOfWeek
        }
        .sheet(isPresented: $showingDownloadDays) {
            DownloadDaysView(inputFields: $inputFields, showingDownloadDays: $showingDownloadDays) // Передайте inputFields і showingDownloadDays
        }
    }

    private var currentFieldPlaceholder: String {
        guard let index = currentFieldIndex else { return "" }
        return index < 4 ? "Вага" : "Повторення"
    }
}

// Новый вид для отображения дней недели
struct DaysOfWeekView: View {
    @Binding var inputFields: [IInputFieldSection] // Прив'язка до inputFields
    @Binding var showingDaysOfWeek: Bool // Прив'язка до стану відображення
    var days: [String] = ["Понеділок", "Вівторок", "Середа", "Четвер", "П'ятниця", "Субота", "Неділя"]

    var body: some View {
        NavigationView {
            VStack {
                Text("Оберіть день для зберігання ваших данних!")
                    .font(.system(size: 24))
                    .padding()

                List(days, id: \.self) { day in
                    Button(action: {
                        // Збереження даних при натисканні на день
                        saveData(for: day, inputFields: inputFields)
                        print("Selected day for saving: \(day)")
                        showingDaysOfWeek = false // Закриття вікна після збереження
                    }) {
                        Text(day)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .foregroundColor(.black)
                            .padding()
                    }
                }
            }
            .navigationTitle("Зберегти")
        }
    }
}

// Новый вид для загрузки дней
struct DownloadDaysView: View {
    @Binding var inputFields: [IInputFieldSection] // Прив'язка до inputFields
    @Binding var showingDownloadDays: Bool // Прив'язка до стану відображення
    var days: [String] = ["Понеділок", "Вівторок", "Середа", "Четвер", "П'ятниця", "Субота", "Неділя"]

    var body: some View {
        NavigationView {
            VStack {
                Text("Оберіть день для завантаження ваших данних!")
                    .font(.system(size: 24))
                    .padding()

                List(days, id: \.self) { day in
                    Button(action: {
                        if let loadedData = loadData(for: day) {
                            inputFields = loadedData // Завантаження даних
                            print("Loaded data for day: \(day)")
                        }
                        showingDownloadDays = false // Закриття вікна після завантаження
                    }) {
                        Text(day)
                            .frame(maxWidth: .infinity, alignment:
                                    .leading)
                            .foregroundColor(.black)                            .padding()
                    }
                }
            }
            .navigationTitle("Завантажити")
        }
    }
}

struct ScrolWeuve_Previews: PreviewProvider {
    static var previews: some View {
        ScrolWeuve()
    }
}
