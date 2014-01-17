class User < ActiveRecord::Base

  validates :login, :presence => true, :uniqueness => true, :length => {minimum: 5}
  validates :password, :presence => true, :length => {minimum: 5}
  validates :email, :presence => true, :uniqueness => true,
                    :format => {with: /[a-zA-Z0-9]+@[a-zA-Z0-9]+\.[a-zA-Z]{2,3}/}
end
