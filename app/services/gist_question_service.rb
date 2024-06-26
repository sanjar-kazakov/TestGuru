class GistQuestionService

  def initialize(question, client: nil)
    @question = question
    @test = @question.test
    @client = client || GitHubClient.new
  end

  def call
    @client.create_gist(gist_params)
  end

  def success?
    @client.response_status
  end

  private

  def gist_params
    {
      description: I18n.t('services.gist_question_service.description', test_title: @test.title ),
      files: {
        "#{I18n.t('services.gist_question_service.file')}.txt" => {
          content: gist_content
        }
      }
    }
  end

  def gist_content
    content = [@question.body]
    content += @question.answers.pluck(:body)
    content.join("\n")
  end

end
