class Plugin < ApplicationRecord
  validates_presence_of :name
  validates_uniqueness_of :name
  validates_uniqueness_of :s3_ref
end
