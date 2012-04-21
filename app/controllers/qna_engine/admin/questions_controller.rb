# encoding: utf-8

class QnaEngine::Admin::QuestionsController < Admin::AdminsController
	before_filter :is_from_engine

	def index
		@questions = QnaEngine::Question.order("created_at DESC").page(params[:page]).per(20)
	end

	def show
		@question = QnaEngine::Question.find params[:id]
	end

	def new
		@question = QnaEngine::Question.new
	end

	def create
		@question = QnaEngine::Question.new params[:question]
		@question.user_id = current_user.id
		if @question.save
			redirect_to admin_question_path(@question), notice: '질문을 등록했습니다.'
		else
			render :action => "new"
		end
	end

	def edit
		@question = QnaEngine::Question.find params[:id]
	end

	def update
		@question = QnaEngine::Question.find params[:id]
		if @question.update_attributes params[:question]
			redirect_to [:admin, @question], notice: '질문을 수정하였습니다.'
		else
			render action: 'edit'
		end
	end

	def destroy
		@question = QnaEngine::Question.find params[:id]
		@question.destroy
		redirect_to [:admin, :questions], notice: '질문을 삭제했습니다.'
	end

	private

	def is_from_engine
		@is_from_engine = true
	end
end