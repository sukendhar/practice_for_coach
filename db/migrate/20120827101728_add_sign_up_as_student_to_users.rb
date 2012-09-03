class AddSignUpAsStudentToUsers < ActiveRecord::Migration
  def change
    add_column :users, :sign_up_as_student, :string
    add_column :users, :sign_up_as_credentialled_coach, :string
  end
end
