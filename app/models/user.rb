class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         has_many :books, dependent: :destroy
         has_one_attached :profile_image

         def get_image
          unless image.attached?
            file_path = Rails.root.join('app/assets/images/default-image.jpg')
            image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
          end
          image
         end

    validates :name, presence: true
    
    

end

