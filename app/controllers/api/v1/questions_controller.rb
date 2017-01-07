class Api::V1::QuestionsController < Api::V1::BaseController
  def index
    questions = Question.includes(:answers).order(:order_by, 'answers.order_by')
    questions = questions.joins(:responses) if params[:only_answered]
    render json: questions
  end
end
