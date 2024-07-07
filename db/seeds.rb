# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

users = User.create!([
  {first_name: "Sanjar 4", email: "sanjar.kazakov.test+4@gmail.com", password: "test1234", last_name: "Last", confirmed_at: Time.now},
  {first_name: "Sanjar 8", email: "sanjar.kazakov.test+8@gmail.com", password: "test1234", last_name: "Last", confirmed_at: Time.now},
  {first_name: "Admin 1", email: "admin@gmail.com", password: "test1234", type: "Admin", last_name: "Last", confirmed_at: Time.now},
  {first_name: "Admin 2", email: "admin2@gmail.com", password: "test1234", type: "Admin", last_name: "Last", confirmed_at: Time.now},
  {first_name: "Alex", email: "alex@outlook.com", password: "test1234", last_name: "Last", confirmed_at: Time.now}
])

categories = Category.create!([
  {title: "Сериалы"},
  {title: "Мультфильмы"},
  {title: "Фентези"}
])

tests = Test.create!([
  {title: "Актеры сериалов", level: 1, category_id: categories[0].id, author_id: users[1].id},
  {title: "Герои мультфильмов", level: 0, category_id: categories[1].id, author_id: users[1].id},
  {title: "Фильмы фэнтези", level: 3, category_id: categories[2].id, author_id: users[2].id},
  {title: "Советские мультфильмы", level: 5, category_id: categories[1].id, author_id: users[3].id}
])

questions = Question.create!([
  {body: "Какой мультфильм рассказывает историю о юном льве?", test_id: tests[1].id},
  {body: "Как называется мультфильм, в котором заяц противостоял волку?", test_id: tests[3].id},
  {body: "В каком известном фильме главную роль сыграл актер Элайджа Вуд?", test_id: tests[2].id},
  {body: "В каком сериале про наркотики снимался Джесси Пинкман?", test_id: tests[0].id},

  # Дополнительные вопросы для первого теста
  {body: "Кто сыграл главную роль в фильме 'Матрица'?", test_id: tests[0].id},
  {body: "Как звали главного героя фильма 'Титаник'?", test_id: tests[0].id},
  {body: "Какой актер сыграл в фильме 'Звездные войны' роль Люка Скайуокера?", test_id: tests[0].id},

  # Дополнительные вопросы для второго теста
  {body: "Какой мультфильм снял Вуди Аллен?", test_id: tests[1].id},
  {body: "Как называется мультфильм про семью супергероев?", test_id: tests[1].id},

  # Дополнительный вопрос для третьего теста
  {body: "Какой актер сыграл главную роль в 'Гарри Поттере'?", test_id: tests[2].id}
])

answers = Answer.create!([
  {body: "Король лев", correct: true, question_id: questions[0].id},
  {body: "Коля лев", correct: false, question_id: questions[0].id},
  {body: "Джунгли зовут", correct: false, question_id: questions[0].id},

  {body: "Колобок и волк", correct: false, question_id: questions[1].id},
  {body: "Ну погоди!", correct: true, question_id: questions[1].id},
  {body: "Том и Джерри", correct: false, question_id: questions[1].id},

  {body: "Властелин сердец", correct: false, question_id: questions[2].id},
  {body: "Властелин конец", correct: false, question_id: questions[2].id},
  {body: "Властелин колец", correct: true, question_id: questions[2].id},

  {body: "Белый нос", correct: false, question_id: questions[3].id},
  {body: "Во все тяжкие", correct: true, question_id: questions[3].id},
  {body: "Наркос", correct: false, question_id: questions[3].id},

  {body: "Киану Ривз", correct: true, question_id: questions[4].id},
  {body: "Брэд Питт", correct: false, question_id: questions[4].id},
  {body: "Том Круз", correct: false, question_id: questions[4].id},

  {body: "Джек", correct: false, question_id: questions[5].id},
  {body: "Джеймс", correct: false, question_id: questions[5].id},
  {body: "Леонардо ДиКаприо", correct: true, question_id: questions[5].id},

  {body: "Марк Хэмилл", correct: true, question_id: questions[6].id},
  {body: "Харрисон Форд", correct: false, question_id: questions[6].id},
  {body: "Мел Гибсон", correct: false, question_id: questions[6].id},

  {body: "Художественные мультики", correct: false, question_id: questions[7].id},
  {body: "История игрушек", correct: false, question_id: questions[7].id},
  {body: "Магия Льва", correct: true, question_id: questions[7].id},

  {body: "Суперсемейка", correct: true, question_id: questions[8].id},
  {body: "Спайдермен", correct: false, question_id: questions[8].id},

  {body: "Дэниел Рэдклифф", correct: true, question_id: questions[9].id},
  {body: "Джонни Депп", correct: false, question_id: questions[9].id},
  {body: "Роберт Паттинсон", correct: false, question_id: questions[9].id}
])

user_answers = UserAnswer.create!([
  {user_id: users[0].id, test_id: tests[0].id, correct_questions: 0, current_question_id: nil},
  {user_id: users[1].id, test_id: tests[1].id, correct_questions: 0, current_question_id: nil},
  {user_id: users[2].id, test_id: tests[1].id, correct_questions: 0, current_question_id: nil},
  {user_id: users[2].id, test_id: tests[3].id, correct_questions: 0, current_question_id: nil}
])
