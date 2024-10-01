//
//  File 2.swift
//  AppPockedTrainer
//
//  Created by Imac Taras on 11.10.2024.
//


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
                                    .padding(.top, 300)
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
                                    .padding(.top, 300)
                                    .onTapGesture {
                                        if !inputFields.isEmpty {
                                            inputFields.removeLast()
                                        }
                                    }
                            }
                        }
                        
                    }
                }