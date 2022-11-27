class Book < ApplicationRecord

   belongs_to :user

   validates :title, presence: true
   validates :body, length: { minimum: 0, maximum: 200 },presence: true


end
