class RemoveSurveyIdFromTransactions < ActiveRecord::Migration
  def change
    remove_column :questions, :survey_id, :integer
  end
end
