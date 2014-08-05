class Product < ActiveRecord::Base
  belongs_to :buyer, class_name: 'User'
  belongs_to :seller, class_name: 'User', foreign_key: 'user_id'

  mount_uploader :pic1, Pic1Uploader
  mount_uploader :pic2, Pic2Uploader
  mount_uploader :pic3, Pic3Uploader
  mount_uploader :pic4, Pic4Uploader

  validates_presence_of :title, :description, :pic1, :price

  def popular
  end




end
