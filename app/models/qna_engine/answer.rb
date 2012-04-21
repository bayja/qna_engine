# encoding: utf-8

module QnaEngine
  class Answer < ActiveRecord::Base
    attr_accessible :body, :user_id, :question_id
    belongs_to :answer

    validates_presence_of :body, :user_id

  end
end
