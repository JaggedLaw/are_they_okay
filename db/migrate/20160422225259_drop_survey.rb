class DropSurvey < ActiveRecord::Migration
  def change
    drop_table :surveys
  end
end
