class MainCategory < ActiveRecord::Base
  has_many :main_category_pics, dependent: :destroy

  has_many :items, dependent: :destroy
  

end
