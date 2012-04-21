# encoding: utf-8

module QnaEngine
  class Question < ActiveRecord::Base
    attr_accessible :title, :body, :secret, :category_id
    belongs_to :user
    belongs_to :category
    validates_presence_of :title, :body, :category_id

  end
end
