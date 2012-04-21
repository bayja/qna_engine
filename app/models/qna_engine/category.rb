# encoding: utf-8

module QnaEngine
  class Category < ActiveRecord::Base
    attr_accessible :name, :position
    has_many :questions

    validates_presence_of :name

  end
end
