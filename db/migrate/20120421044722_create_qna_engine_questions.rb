class CreateQnaEngineQuestions < ActiveRecord::Migration
  def change
    create_table :qna_engine_categories do |t|
    	t.string		:name
    	t.integer		:position

      t.timestamps
    end

    create_table :qna_engine_questions do |t|
    	t.integer 	:user_id
    	t.string		:title
    	t.text			:body
    	t.boolean		:secret, :default => false

      t.timestamps
    end

    create_table :qna_engine_answers do |t|
    	t.integer 	:user_id
    	t.integer		:question_id
    	t.text			:body
    	
      t.timestamps
    end
  end
end
