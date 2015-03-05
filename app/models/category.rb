class Category < ActiveRecord::Base
  has_many :documents
  belongs_to :user
  
end
