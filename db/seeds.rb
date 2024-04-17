# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

users = User.create([
  {name: "Stas", email: "stas@gmail.com", password: "stas1"},
  {name: "Anna", email: "anna@example.com", password: "anna123"},
  {name: "Max", email: "max@hotmail.com", password: "max456"},
  {name: "Elena", email: "elena@yahoo.com", password: "elena789"},
  {name: "Alex", email: "alex@outlook.com", password: "alex2023"}
])

categories = Category.create([
  {title: "Сериалы"},
  {title: "Мультфильмы"},
  {title: "Фентези"}
])

tests = Test.create([
  {title: "Актеры сериалов", level: 1, category_id: categories[0].id, author_id: users[1].id},
  {title: "Герои мультфильмов", level: 0, category_id: categories[1].id, author_id: users[1].id},
  {title: "Фильмы фэнтези", level: 3, category_id: categories[2].id, author_id: users[2].id},
  {title: "Советские мультфильмы", level: 5, category_id: categories[1].id, author_id: users[3].id}
])

questions = Question.create([
  {body: "Какой мультфильм рассказывает историю о юном льве?", test_id: tests[1].id},
  {body: "Как называется мультфильм, в котором заяц противостоял волку?", test_id: tests[3].id},
  {body: "В каком известном фильме главную роль сыграл актер Элайджа Вуд", test_id: tests[2].id},
  {body: "В каком сериале про наркотики снимался Джесси Пинкман", test_id: tests[0].id}
])

answers = Answer.create([
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
  {body: "Наркос", correct: false, question_id: questions[3].id}
])

user_answers = UserAnswer.create([
  {user_id: users[0].id, test_id: tests[0].id},
  {user_id: users[1].id, test_id: tests[1].id},
  {user_id: users[2].id, test_id: tests[1].id},
  {user_id: users[2].id, test_id: tests[3].id}
])
