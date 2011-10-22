# == Schema Information
#
# Table name: advices
#
#  id         :integer         not null, primary key
#  titre      :string(255)
#  texte      :text
#  Image      :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Advice < ActiveRecord::Base
  attr_accessible :titre, :texte, :image, :image_file_name, :image_content_type, :image_file_size, :image_updated_at
  
  default_scope :order => 'advices.created_at DESC'
  
  has_attached_file :image, :styles => { :medium => "150x150>"},
                    :storage => :s3,
                    :s3_credentials => "#{RAILS_ROOT}/config/s3.yml",
                    :path => ":attachment/:id/:style.:extension",
                    :bucket => 'brosseau'
end
