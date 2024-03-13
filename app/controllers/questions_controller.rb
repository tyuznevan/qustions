class QuestionsController < ApplicationController

  before_action :set_question, only: %i[update show destroy edit]

  def create

    @question=Question.create(question_params)
    #body: params[:question][:body],
    #user_id: params[:question][:user_id]
    #flash[:notice] = 'Новый вопрос создан! '
    redirect_to question_path(@question), notice: 'Новый вопрос создан! '
    #либо
    #render text: "Ваш запрос обработан!"
  end

  def update

    @question.update(question_params)
    redirect_to question_path(@question), notice: "Вопрос отредактирован! "
  end

  def destroy

    @question.destroy

    redirect_to questions_path, notice: "Вопрос удален!"
  end

  def show

  end

  def index
    @question = Question.new
    @questions = Question.all

  end

  def new
    @question = Question.new
  end

  def edit

  end

  private

  def question_params
    params.require(:question).permit(:body, :user_id)
  end

  def set_question
    @question=Question.find(params[:id])
  end
end
