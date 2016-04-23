class IllnessQuestion < ActiveRecord::Base
  belongs_to :illness
  belongs_to :question
end
