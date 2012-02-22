class AddReconfirmableToDevise < ActiveRecord::Migration
  def change
    change_table(:users) do |t| 
      t.reconfirmable
    end
  end
end
