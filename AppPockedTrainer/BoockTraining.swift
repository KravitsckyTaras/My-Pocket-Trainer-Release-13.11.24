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
                                                        }
                                                    ))
                                                    .frame(width: 60, height: 40)
                                                    .background(Color.gray.opacity(0.1))
                                                    .cornerRadius(8)
                                                    .keyboardType(.decimalPad)
                                                    .shadow(radius: 5)
                                                }
                                            }
                                            HStack(spacing: 10) {
                                                ForEach(0..<4, id: \.self) { index in
                                                    TextField("Повтореня", text: Binding(
                                                        get: { section.fields.indices.count > (index + 4) ? section.fields[index + 4] : "" },
                                                        set: { newValue in
                                                            if section.fields.indices.count > (index + 4) {
                                                                section.fields[index + 4] = newValue
                                                            } else {
                                                                section.fields.append(newValue)
                                                            }
                                                        }
                                                    ))
                                                    .frame(width: 60, height: 40)
                                                    .background(Color.gray.opacity(0.1))
                                                    .cornerRadius(8)
                                                    .keyboardType(.decimalPad)
                                                    .shadow(radius: 5)
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
                                        inputFields.append(InputFieldSection(fields: Array(repeating: "", count: 8), selectedExerciseName: nil, selectedImage: nil))
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
                    ToolbarItemGroup(placement: .navigationBarLeading) {
                        ZStack(alignment: .leading) {
                            Rectangle()
                                .foregroundColor(.gray.opacity(0.2))
                                .frame(width: UIScreen.main.bounds.width + 100, height: 44)
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
                                        .font(.headline)
                                        .foregroundColor(.black)
                                }
                                .alert("Виберіть день для збереження", isPresented: $showingSaveAlert) {
                                    Button("День 1") { saveData(for: "День 1") }
                                    Button("День 2") { saveData(for: "День 2") }
                                    Button("День 3") { saveData(for: "День 3") }
                                    Button("День 4") { saveData(for: "День 4") }
                                    Button("День 5") { saveData(for: "День 5") }
                                    Button("День 6") { saveData(for: "День 6") }
                                    Button("День 7") { saveData(for: "День 7") }
                                    Button("Скасувати", role: .cancel) {}
                                }
                                
                                Button(action: {
                                    showingLoadAlert = true
                                }) {
                                    Image(systemName: "arrow.down.circle")
                                        .font(.headline)
                                        .foregroundColor(.black)
                                }
                                .alert("Виберіть день для завантаження", isPresented: $showingLoadAlert) {
                                    Button("День 1") { loadData(for: "День 1") }
                                    Button("День 2") { loadData(for: "День 2") }
                                    Button("День 3") { loadData(for: "День 3") }
                                    Button("День 4") { loadData(for: "День 4") }
                                    Button("День 5") { loadData(for: "День 5") }
                                    Button("День 6") { loadData(for: "День 6") }
                                    Button("День 7") { loadData(for: "День 7") }
                                    Button("Скасувати", role: .cancel) {}
                                }
                            }
                            .padding(.leading, 60)
                        }
                    }
                }
            }
        }
        
    }


    func saveData(for day: String) {
        if let encoded = try? JSONEncoder().encode(inputFields) {
            UserDefaults.standard.set(encoded, forKey: day)
        }
    }

    func loadData(for day: String) {
        if let data = UserDefaults.standard.data(forKey: day),
           let decoded = try? JSONDecoder().decode([InputFieldSection].self, from: data) {
            inputFields = decoded
        }
    }
}

struct BoockTraining_Previews: PreviewProvider {
    static var previews: some View {
        BoockTraining()
    }
}
