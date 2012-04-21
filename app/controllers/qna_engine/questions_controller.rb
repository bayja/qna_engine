# encoding: utf-8

class QnaEngine::QuestionsController < ApplicationController
	before_filter :is_from_engine
	before_filter :require_user, :only => [:new, :edit, :create, :update, :destroy]
	before_filter(:only => [:update, :destroy]) do |c|
		@question = QnaEngine::Question.find params[:id]
		c.send(:require_owner, @question)
	end

	def index
		@cates = QnaEngine::Category.order("position ASC").all
		@questions = QnaEngine::Question.in_category_id(params[:category_id]).order("created_at DESC").page(params[:page]).per(20)
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
			redirect_to questions_path(category_id: @question.category_id), notice: '질문을 등록했습니다.'
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
			redirect_to questions_path(category_id: @question.category_id), notice: '질문을 수정하였습니다.'
		else
			render action: 'edit'
		end
	end

	def destroy
		@question = QnaEngine::Question.find params[:id]
		@question.destroy
		redirect_to :questions, notice: '질문을 삭제했습니다.'
	end

	private

	def is_from_engine
		@is_from_engine = true
	end

end