# encoding: utf-8

module QnaEngine
  class Question < ActiveRecord::Base
    attr_accessible :title, :body, :secret, :category_id
    belongs_to :user
    belongs_to :category
    has_many	 :answers, :dependent => :destroy
    
    validates_presence_of :title, :body, :category_id

    def self.in_category_id(category_id)
	    if category_id.present?
	    	where(:category_id => category_id)
	    else
	    	where(:category_id => Category.first.id) rescue scoped
	    end
	  end

    # helper
    def authorized_to(user)
      if !self.secret?
        true
      elsif self.secret? && self.user == user
        true
      elsif self.secret? && user.try(:admin?)
        true
      else
        false
      end
    end
  end
end
