# frozen_string_literal: true

# User class
class User < ActiveRecord::Base
  has_secure_token :api_token

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable
end
