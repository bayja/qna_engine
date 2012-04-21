# encoding: utf-8

module QnaEngine
  class Question < ActiveRecord::Base
    attr_accessible :title, :body, :secret

    belongs_to :user

  end
end
