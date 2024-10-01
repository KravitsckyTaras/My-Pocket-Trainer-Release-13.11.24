//
//  Exercise.swift
//  AppPockedTrainer
//
//  Created by  MacBook  on 25.10.2024.
//


import SwiftUI

// Структура для представлення вправ
struct Exercise: Identifiable {
    let id = UUID()
    let name: String
    let imageName: String
}

// Структура для представлення груп м'язів
struct MuscleGroup: Identifiable {
    let id = UUID()
    let name: String
    let exercises: [Exercise]
}

struct DDetailView: View {
    @Binding var selectedExerciseName: String?
    @Binding var selectedImage: String?

    @Environment(\.presentationMode) var presentationMode

    // Групи м'язів з вправами
    let muscleGroups: [MuscleGroup] = [
        MuscleGroup(name: "Ноги", exercises: [
            Exercise(name: "Станова тяга.", imageName: "60"),
            Exercise(name: "Гуд морнинг.", imageName: "61"),
            Exercise(name: "Присідання зі штангою.", imageName: "62"),
            Exercise(name: "Присідання у Сміті.", imageName: "63"),
            Exercise(name: "Фронтальні Присідання у сміті.", imageName: "64"),
            Exercise(name: "Присідання у гаку.", imageName: "65"),
            Exercise(name: "Жим ногами.", imageName: "66"),
            Exercise(name: "Виподи зі штангою.", imageName: "67"),
            Exercise(name: "Підйом на платформу.", imageName: "68"),
            Exercise(name: "Розгинання ніг.", imageName: "69"),
            Exercise(name: "Тяга сумо.", imageName: "70"),
            Exercise(name: "Румунська тяга.", imageName: "71"),
            Exercise(name: "Мертва Тяга.", imageName: "72"),
            Exercise(name: "Гіперєстензія.", imageName: "73"),
            Exercise(name: "Згинання ніг лежачі.", imageName: "74"),
            Exercise(name: "Згинання ніг поочередна.", imageName: "75"),
            Exercise(name: "Згинання ніг сидячф у тренажері.", imageName: "76"),
            Exercise(name: "Підйом на носки у тренажері.", imageName: "77"),
            Exercise(name: "Відштовхування платформи носками.", imageName: "78"),
            Exercise(name: "Підйом стопи вгору.", imageName: "80"),
            
         
           
        ]),
        MuscleGroup(name: "Спина", exercises: [
            Exercise(name: "Пвдтягування широким хватом.", imageName: "51"),
            Exercise(name: "Тяга штанги у нахилі.", imageName: "52"),
            Exercise(name: "Тяга штанги зворотнім хватом у нахилі.", imageName: "53"),
            Exercise(name: "Т-тяга", imageName: "54"),
            Exercise(name: "Тяга гантелі поочередно з упром.", imageName: "55"),
            Exercise(name: "Тяга вертікольного блоку широким хватом.", imageName: "56"),
            Exercise(name: "Тяга зворотнім хватом вертікольного блоку.", imageName: "57"),
            Exercise(name: "Тяга горізонтального блоку.", imageName: "58"),
            Exercise(name: "Пуловер з верхнього блоку.", imageName: "59"),
            Exercise(name: "Станова тяга.", imageName: "60"),
            Exercise(name: "Шраги штангою перед собою.", imageName: "1"),
            Exercise(name: "Шраги штангою за спиною.", imageName: "2"),
            Exercise(name: "Шраги з гантельями.", imageName: "94")
        ]),
        MuscleGroup(name: "Груди", exercises: [
            Exercise(name: "Жим штанги лежачі на лавці.", imageName: "31"),
            Exercise(name: "Жим штанги на лавці під позетивним кутом.", imageName: "32"),
            Exercise(name: "Жим штанги на лавці під негативним кутом.", imageName: "33"),
            Exercise(name: "Жим гантель", imageName: "34"),
            Exercise(name: "Жим гантель під позетивним кутом.", imageName: "35"),
            Exercise(name: "Жим гантель під негативним кутом", imageName: "36"),
            Exercise(name: "Жим сидячі в тренажері.", imageName: "37"),
            Exercise(name: "Зведення гантель лежачі", imageName: "38"),
            Exercise(name: "Зведення гантель лежачі під позетивним кутом", imageName: "39"),
            Exercise(name: "Зведення у тренажері", imageName: "40"),
            Exercise(name: "Зведення кроссовера з верхніх блоків.", imageName: "41"),
            Exercise(name: "Зведення кроссовера з нижніх блоків.", imageName: "42"),
            Exercise(name: "Вітжимання від підлоги.", imageName: "96"),
            Exercise(name: "Зведення кроссовера на лавці під позетивним кутом.", imageName: "97"),
            Exercise(name: "Жим у тренажері хамер.", imageName: "98"),
            Exercise(name: "Віджимання на брусях.", imageName: "dips"),
        ]),
        MuscleGroup(name: "Руки", exercises: [
            Exercise(name: "Протяжка штанги до пітборіддя.", imageName: "3"),
            Exercise(name: "Армійский жим.", imageName: "4"),
            Exercise(name: "Жим штанги над головою сидячі.", imageName: "5"),
            Exercise(name: "Жим гантель над головою сидячі.", imageName: "6"),
            Exercise(name: "Жим Арнольда.", imageName: "7"),
            Exercise(name: "Розведення гантель через боки.", imageName: "8"),
            Exercise(name: "Відведення руки перед собою.", imageName: "9"),
            Exercise(name: "Розведення гантель у нахилі.", imageName: "10"),
            Exercise(name: "Зворотні зведеня у тренажері.", imageName: "11"),
            Exercise(name: "Зведеня гантель над головою стоячі.", imageName: "12"),
            Exercise(name: "Згинання рук зі штангою стоячи.", imageName: "13"),
            Exercise(name: "Молотки", imageName: "14"),
            Exercise(name: "Згинання рук з гантелямі н скамьі Скота.", imageName: "15"),
            Exercise(name: "Згинання руку з нижнього блоку.", imageName: "16"),
            Exercise(name: "Біцепс в кросовері.", imageName: "17"),
            Exercise(name: "Згинання руки з упором в коліно.", imageName: "18"),
            Exercise(name: "Згинання рук з гантелями стоячі.", imageName: "20"),
            Exercise(name: "Згинання рук з гантелями сидячі.", imageName: "21"),
            Exercise(name: "Жим штанги вузьким хватом.", imageName: "22"),
            Exercise(name: "Віджимання від лавки.", imageName: "23"),
            Exercise(name: "Французький жим лежачі зі штангою..", imageName: "24"),
            Exercise(name: "Французький жим сидячі зі штангою.", imageName: "25"),
            Exercise(name: "Фрвнцузький жим сидячі з нижнього блоку.", imageName: "26"),
            Exercise(name: "Розгинання рук в блоці.", imageName: "27"),
            Exercise(name: "Розгинання руки з верхнього блоку.", imageName: "28"),
            Exercise(name: "Розгинання руки над головою сидячі.", imageName: "29"),
            Exercise(name: "Розгинання руки назад з упором у нахилі.", imageName: "30"),

        ]),
        MuscleGroup(name: "Прес", exercises: [
            Exercise(name: "Скручування.", imageName: "43"),
            Exercise(name: "Скручування на римському стульці.", imageName: "44"),
            Exercise(name: "Скручування на лаві з нахилом вниз.", imageName: "45"),
            Exercise(name: "Скручування на колінах у блоці.", imageName: "46"),
            Exercise(name: "Зворотні скручуванн.", imageName: "47"),
            Exercise(name: "Підйом колін висячі.", imageName: "48"),
            Exercise(name: "Підйом ніг вмсячі.", imageName: "49"),
            Exercise(name: "Косі скручування.", imageName: "50"),

        ]),
    ]

    var body: some View {
           ZStack {
               // Фонове зображення
               Image("listBumagy") // Замените "listBumagy" на имя вашего изображения
                   .resizable()
                   .scaledToFill()
                   .edgesIgnoringSafeArea(.all) // Изображение будет занимать весь экран
               
               ScrollView {
                   VStack(alignment: .leading, spacing: 20) {
                       ForEach(muscleGroups) { group in
                           VStack(alignment: .leading) {
                               Text(group.name)
                                   .frame(maxWidth: .infinity)
                                   .frame(height: 50)
                                   .background(Color.black.opacity(0.2))
                                   .cornerRadius(8)
                                   .shadow(radius: 5)

                               ScrollView(.horizontal, showsIndicators: false) {
                                   HStack(spacing: 15) {
                                       ForEach(group.exercises) { exercise in
                                           VStack {
                                               Button(action: {
                                                   selectedExerciseName = exercise.name
                                                   selectedImage = exercise.imageName
                                                   presentationMode.wrappedValue.dismiss()
                                               }) {
                                                   Image(exercise.imageName)
                                                       .resizable()
                                                       .frame(width: 100, height: 100)
                                                       .background(Color.gray.opacity(0.2))
                                                       .cornerRadius(8)
                                                       .shadow(radius: 5)
                                               }
                                               Text(exercise.name)
                                                   .font(.caption)
                                                   .multilineTextAlignment(.center)
                                                   .padding(5)
                                                   .frame(width: 100) // Обмежуємо ширину тексту
                                                   .background(Color.gray.opacity(0.2))
                                                   .cornerRadius(8)
                                                   .lineLimit(1) // Обмежуємо до одного рядка
                                                   .truncationMode(.tail) // Додаємо три крапки, якщо текст перевищує ширину
                                           }
                                       }
                                   }
                                   
                               }
                               
                               
                           }
                           .padding(.horizontal, 20) // Відступи з боків
                           .padding(.vertical, 10) // Відступи зверху і знизу
                           .cornerRadius(10) // Заокруглення кутів
                           .shadow(radius: 5) // Тінь для секції

                           
                       }
                   }
                   .padding(.top, 30)
                   .navigationBarBackButtonHidden(true) // Скрыть кнопку «Назад»

                   .navigationBarTitleDisplayMode(.inline)
                   .tint(.red)
                   .navigationBarItems(leading: HStack {
                                       Button(action: {
                                           // Переход назад
                                           presentationMode.wrappedValue.dismiss()
                                       }) {
                                           Image(systemName: "figure.strengthtraining.traditional")
                                               .font(.headline)
                                               .foregroundColor(.black)
                                       }
                                   })
                   
                       

               }
           }
       }
   }

   // Превью для DDetailView
   struct DDetailView_Previews: PreviewProvider {
       static var previews: some View {
           DDetailView(selectedExerciseName: .constant(nil), selectedImage: .constant(nil))
       }
   }
