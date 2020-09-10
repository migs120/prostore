class MainCategoryPic < ActiveRecord::Base
  belongs_to :main_category
  mount_uploader :pic_url, PicUploader
    serialize :description
  
  #rescue ActiveMerchant::ActiveMerchantError => e
  #self.description        = {}
  
end
