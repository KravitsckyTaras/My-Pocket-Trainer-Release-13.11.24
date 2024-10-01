import SwiftUI

struct ExerciseSelectionView: View {
    @Environment(\.presentationMode) var presentationMode
    var selectedExerciseIndex: Int
    var onSelect: (String) -> Void

    var body: some View {
        ZStack {
            Image("listBumagy")
                .resizable()
                .edgesIgnoringSafeArea(.all)

            ScrollView {
                VStack {
                    ForEach(sectionData, id: \.title) { section in
                        VStack {
                            Text(section.title)
                                .font(.headline)
                                .foregroundColor(.white)
                                .padding(.vertical, 6)
                                .frame(maxWidth: .infinity)
                                .background(Color.black.opacity(0.8))
                                .cornerRadius(8)

                            ScrollView(.horizontal) {
                                HStack(spacing: 20) {
                                    ForEach(section.images, id: \.name) { exerciseImage in
                                        VStack {
                                            Image(exerciseImage.name)
                                                .resizable()
                                                .scaledToFill()
                                                .frame(width: 120, height: 120)
                                                .clipped()
                                                .cornerRadius(8)
                                                .shadow(radius: 4)
                                                .onTapGesture {
                                                    onSelect(exerciseImage.title)
                                                    presentationMode.wrappedValue.dismiss()
                                                }
                                            Text(exerciseImage.title)
                                                .font(.caption)
                                                .foregroundColor(.white)
                                                .frame(maxWidth: .infinity)
                                                .background(Color.black.opacity(0.6))
                                                .cornerRadius(5)
                                                .multilineTextAlignment(.center)
                                                .lineLimit(1)
                                                .truncationMode(.tail)
                                                .padding(.horizontal, 2)
                                                .frame(width: 120)
                                        }
                                    }
                                }
                                .padding()
                            }
                        }
                        .padding(.horizontal)
                    }
                }
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button(action: {
                            presentationMode.wrappedValue.dismiss()
                        }) {
                            HStack {
                                Image(systemName: "chevron.left")
                                    .foregroundColor(.black)
                                Text("Назад")
                                    .foregroundColor(.black)
                            }
                        }
                    }
                }
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct ExerciseImage {
    let name: String
    let title: String
}

struct ExerciseSection {
    let title: String
    let images: [ExerciseImage]
}

// Объявляем массив с названиями секций и индивидуальными изображениями
let sectionData: [ExerciseSection] = [
    ExerciseSection(title: "Вправи для: Спини", images: [
        ExerciseImage(name: "51", title: "Підтягування класичні"),
        ExerciseImage(name: "52", title: "Тяга штанги у нахилі"),
        ExerciseImage(name: "53", title: "Тяга зворотнім хватом"),
        ExerciseImage(name: "54", title: "Тяга Т-Грифа"),
        ExerciseImage(name: "55", title: "Тяга гантелі"),
        ExerciseImage(name: "93", title: "Пулловер гантеллю"),
        ExerciseImage(name: "56", title: "Тяга верхнього блоку"),
        ExerciseImage(name: "57", title: "Тяга зворотнім хватом"),
        ExerciseImage(name: "58", title: "Горизогтальна тяга"),
        ExerciseImage(name: "59", title: "Пуловер з блоку"),
        ExerciseImage(name: "60", title: "Станова тяга"),
    ]),
    ExerciseSection(title: "Вправи для: Грудної", images: [
        ExerciseImage(name: "31", title: "Жим штанги"),
        ExerciseImage(name: "32", title: "Жим штанги кут 40"),
        ExerciseImage(name: "33", title: "Жим штанги кут -20"),
        ExerciseImage(name: "34", title: "Жим гантель"),
        ExerciseImage(name: "35", title: "Жим гантель кут 40"),
        ExerciseImage(name: "36", title: "Жим гантель -20"),
        ExerciseImage(name: "37", title: "Жим в тренажері"),
        ExerciseImage(name: "38", title: "Зведення гантель"),
        ExerciseImage(name: "39", title: "Зведення під кутом"),
        ExerciseImage(name: "40", title: "Зведення в тренажері"),
        ExerciseImage(name: "41", title: "Кросовер низ"),
        ExerciseImage(name: "42", title: "Кросовер верх"),
        ExerciseImage(name: "96", title: "Віджимання"),
        ExerciseImage(name: "97", title: "Кросовер у нахилі"),
        ExerciseImage(name: "98", title: "Жим у хамері"),
        ExerciseImage(name: "93", title: "Пулловер з гантеллю"),
       
    ]),
    ExerciseSection(title: "Вправи для: Двохголовий м'яз рук", images: [
        ExerciseImage(name: "13", title: "Підйом штанги"),
        ExerciseImage(name: "14", title: "Молотки"),
        ExerciseImage(name: "15", title: "Скамья Скотта"),
        ExerciseImage(name: "16", title: "Біцепс у блоці"),
        ExerciseImage(name: "17", title: "Біцепс з верхнього блоку"),
        ExerciseImage(name: "18", title: "Концентрований підйом"),
        ExerciseImage(name: "20", title: "Підйом гантель"),
        ExerciseImage(name: "21", title: "Супінація сидячі"),

    ]),
    ExerciseSection(title: "Вправи для: Трьохголовий м'яз рук", images: [
        ExerciseImage(name: "22", title: "Жим вузьким хватои"),
        ExerciseImage(name: "23", title: "Віджимання від лавки"),
        ExerciseImage(name: "24", title: "Французкий зі штангою"),
        ExerciseImage(name: "25", title: "Підйом за голови"),
        ExerciseImage(name: "26", title: "За голови в блоці"),
        ExerciseImage(name: "27", title: "З мотузками в блоці"),
        ExerciseImage(name: "28", title: "Розгинаня поочередно"),
        ExerciseImage(name: "29", title: "За голови поочередно"),
        ExerciseImage(name: "30", title: "У нахилі поочереднор"),
    ]),
    ExerciseSection(title: "Вправи для: Плечей",images: [
        ExerciseImage(name: "3", title: "Протяжка"),
        ExerciseImage(name: "4", title: "Армейский жим"),
        ExerciseImage(name: "5", title: "Жим штанги сидячі"),
        ExerciseImage(name: "6", title: "Жим гантель сидячі"),
        ExerciseImage(name: "7", title: "Жим арнольда"),
        ExerciseImage(name: "8", title: "Махи перед собою"),
        ExerciseImage(name: "10", title: "Махи у нахилі"),
        ExerciseImage(name: "11", title: "Зворотні зведеня"),
        ExerciseImage(name: "12", title: "Зворотні махи"),
        ExerciseImage(name: "86", title: "Розведення у кросовері"),

    ]),
    ExerciseSection(title: "Вправи для: Трапеціподібної", images: [
        ExerciseImage(name: "1", title: "Шраги зі штангою"),
        ExerciseImage(name: "2", title: "Шраги з заспини"),
        ExerciseImage(name: "3", title: "Протяжка"),
        ExerciseImage(name: "94", title: "Шраги з гантелями"),
    ]),
    ExerciseSection(title: "Вправи для: Двоголовий м'яз стегна", images: [
        ExerciseImage(name: "61", title: "Гудморнінг"),
        ExerciseImage(name: "60", title: "Станова тяга"),
        ExerciseImage(name: "66", title: "Жим ногами"),
        ExerciseImage(name: "71", title: "Румунська тяга"),
        ExerciseImage(name: "72", title: "Мертва тяга"),
        ExerciseImage(name: "73", title: "Гіперєстензія"),
        ExerciseImage(name: "74", title: "Згинання ніг"),
        ExerciseImage(name: "75", title: "Згинання ніг2"),
        ExerciseImage(name: "76", title: "Згинання ніг3"),

    ]),
    ExerciseSection(title: "Вправи для: Чотириголовий м'яз стегна", images: [
        ExerciseImage(name: "62", title: "Присідання"),
        ExerciseImage(name: "63", title: "Присідання у Смітті"),
        ExerciseImage(name: "64", title: "Фронтальні арисідання"),
        ExerciseImage(name: "65", title: "Присідання у Гаку"),
        ExerciseImage(name: "70", title: "Сумо"),
        ExerciseImage(name: "66", title: "Жим ногами"),
        ExerciseImage(name: "67", title: "Виподи зі штфнгою"),
        ExerciseImage(name: "68", title: "Підйом на платформу"),
        
    ]),
    ExerciseSection(title: "Вправи для: Сідниць", images: [
        ExerciseImage(name: "62", title: "Присідання"),
        ExerciseImage(name: "63", title: "Присідання у Смітті"),
        ExerciseImage(name: "66", title: "Жим ногами"),
        ExerciseImage(name: "68", title: "Платформа"),
        ExerciseImage(name: "70", title: "Сумо"),
        ExerciseImage(name: "71", title: "Румунська тяга"),
        ExerciseImage(name: "72", title: "Мертва тяга"),
        ExerciseImage(name: "85", title: "Виподи з гантелями"),
        ExerciseImage(name: "", title: "Сидничний місток"),
        ExerciseImage(name: "", title: "Розведення ніг"),

    ]),
    ExerciseSection(title: "Вправи для: Брюшного преса", images: [
        ExerciseImage(name: "43", title: "Скручування 1"),
        ExerciseImage(name: "44", title: "Скручування 1"),
        ExerciseImage(name: "45", title: "Скручування кут -20"),
        ExerciseImage(name: "46", title: "Мольба"),
        ExerciseImage(name: "47", title: "Підйом ног з лавки"),
        ExerciseImage(name: "48", title: "Підйом ног висячі"),
        ExerciseImage(name: "49", title: "Підйом ног висячі"),
        ExerciseImage(name: "50", title: "Бокові скручування"),
        ExerciseImage(name: "87", title: "Підйм ног у иренажері"),
        

    ]),
    ExerciseSection(title: "Вправи для: Гомілок", images: [
        ExerciseImage(name: "77", title: "Підйом стоячі в тренажері"),
        ExerciseImage(name: "78", title: "Відтискання в тренажері"),
        ExerciseImage(name: "79", title: "Відтискання сидячі"),
        ExerciseImage(name: "80", title: "Підйои пальців в гору"),

    ]),
    ExerciseSection(title: "Вправи для: Передпліч", images: [
        ExerciseImage(name: "81", title: "Згинання зап'ястка"),
      

    
])
    ]

struct ExerciseSelectionView_Previews: PreviewProvider {
    static var previews: some View {
        ExerciseSelectionView(selectedExerciseIndex: 0, onSelect: { selectedExercise in
            print("Selected Exercise: \(selectedExercise)")
        })
    }
}
