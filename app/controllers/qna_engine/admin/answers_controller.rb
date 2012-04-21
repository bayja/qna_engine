# encoding: utf-8

class QnaEngine::Admin::AnswersController < Admin::AdminsController
	before_filter :is_from_engine
	before_filter :find_question

	def new
		@answer = @question.answers.build
	end

	def create
		@answer = @question.answers.build params[:answer]
		@answer.user_id = current_user.id
		if @answer.save
			redirect_to [:admin, @question], notice: '답변을 등록했습니다.'
		else
			render action: 'new'
		end
	end

	def edit
		@answer = @question.answers.find params[:id]
	end

	def update
		@answer = @question.answers.find params[:id]
	
		if @answer.update_attributes params[:answer]
			redirect_to [:admin, @question], notice: '답변을 수정했습니다.'
		else
			render action: 'edit'
		end
	end

	def destroy
		@answer = @question.answers.find params[:id]
		@answer.destroy
		redirect_to [:admin, @question], notice: '답변을 삭제했습니다.'
	end

	private

	def find_question
		@question = QnaEngine::Question.find params[:question_id]
	end

	def is_from_engine
		@is_from_engine = true
	end
end

