class AddTemplateToMainCategory < ActiveRecord::Migration
  def change
    add_column :main_categories, :template, :boolean, :default => false
  end
end
