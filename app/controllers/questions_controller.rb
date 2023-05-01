class QuestionsController < ApplicationController
  before_action :ensure_current_user, only: %i[update destroy edit]
  before_action :set_question_for_current_user, only: %i[update destroy edit hide]
  rescue_from ActiveRecord::RecordNotFound, with: :render_404

  def hide
    @question.update(hidden: true)

    redirect_to user_path(@question.user), notice: 'Вопрос скрыт!'
  end

  def create
    question_params = params.require(:question).permit(:body, :user_id)

    @question = Question.new(question_params)
    @question.author = current_user
    if @question.save
      redirect_to user_path(@question.user), notice: "Новый вопрос создан!"
    else
      redirect_to user_path(params[:question][:user_id]), alert: "Вопрос пустой или слишком большой"
    end
  end

  def update
    question_params = params.require(:question).permit(:body, :answer)

    @question.update(question_params)

    redirect_to user_path(@question.user), notice: 'Сохранили вопрос!'
  end

  def destroy
    @user = @question.user
    @question.destroy

    redirect_to user_path(@user), notice: 'Вопрос удалён!'
  end

  def show
    @question = Question.find(params[:id])
  end

  def index
    @questions = Question.order(created_at: :desc).last(10)
    @users = User.order(created_at: :desc).last(10)
    @tags = Tag.all
  end

  def new
    @user = User.find_by!(nickname: params[:nickname])
    @question = Question.new(user: @user)
  end

  def edit
  end

  def hashtags
    @tag = Tag.find_by!(name: params[:name].downcase)
    @questions = @tag.questions
  end

  private

  def ensure_current_user
    redirect_with_alert unless current_user.present?
  end

  def set_question_for_current_user
    @question = current_user.questions.find(params[:id])
  end

  def render_404
    render file: "#{Rails.root}/public/404.html", status: 404, layout: false
  end
end
