class Admin::GistsController < Admin::BaseController

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index
    @gists = Gist.all
  end

end
