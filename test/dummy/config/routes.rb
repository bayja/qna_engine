Rails.application.routes.draw do

  mount QnaEngine::Engine => "/qna_engine"
end
