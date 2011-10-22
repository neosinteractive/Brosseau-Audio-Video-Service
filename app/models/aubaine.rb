# == Schema Information
#
# Table name: aubaines
#
#  id         :integer         not null, primary key
#  titre      :string(255)
#  texte      :text
#  image      :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Aubaine < ActiveRecord::Base
  attr_accessible :titre, :texte, :image, :image_file_name, :image_content_type, :image_file_size, :image_updated_at
  
  default_scope :order => 'aubaines.created_at DESC'
  
  has_attached_file :image, :styles => { :medium => "250x250>"},
                    :storage => :s3,
                    :s3_credentials => "#{RAILS_ROOT}/config/s3.yml",
                    :path => ":attachment/:id/:style.:extension",
                    :bucket => 'brosseau'
end
