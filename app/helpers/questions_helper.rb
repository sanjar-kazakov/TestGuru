module QuestionsHelper

  def question_header(question)
    if question.persisted?
      "Edit '#{@question.test.title}' question"
    else
      "Create new '#{@question.test.title}' question"
    end
  end

  def current_year
    Time.zone.now.year
  end

  def github_url(author, repo)
    link_to 'Test Guru', "https://github.com/#{author}/#{repo}", target: :blank
  end
end
