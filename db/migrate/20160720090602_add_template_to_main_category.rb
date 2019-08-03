class AddTemplateToMainCategory < ActiveRecord::Migration[5.1]
  def change
    add_column :main_categories, :template, :boolean, :default => false
  end
end
