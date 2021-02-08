class Listing<ActiveRecord::Base
has_many :comments
belongs_to :users
validates :title, :description, :price, :condition, presence: true

end