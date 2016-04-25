class Answer < ActiveRecord::Base
  #make association that answer belongs to a question
  belongs_to :user
end
