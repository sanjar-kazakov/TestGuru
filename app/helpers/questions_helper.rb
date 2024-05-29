module QuestionsHelper
  def question_header(question)
    if question.persisted?
      I18n.t('questions_helper.question_header.edit', header: @question.test.title)
    else
      I18n.t('questions_helper.question_header.create', header: @question.test.title)
    end
  end
end
