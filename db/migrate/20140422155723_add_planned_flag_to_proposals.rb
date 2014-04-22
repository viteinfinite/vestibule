class AddPlannedFlagToProposals < ActiveRecord::Migration
  def change
    add_column :proposals, :planned, :boolean, default: false, null: false
  end
end
