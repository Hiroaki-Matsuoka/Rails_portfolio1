class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :items
  has_many :posts
  has_many :likes
  has_many :places, through: :likes

  # attr_accessor :name, :age
  #
  # def initialize(name:, age:)
  #   @name = name
  #   @age = age
  # end
  #
  # def disp_name
  #   if @age > 19
  #     "#{@name}さん"
  #   elsif @age > 10
  #     "#{@name}君"
  #   elsif @age > 0
  #     "#{@name}ちゃん"
  #   else
  #     "不正な値です"
  #   end
  # end

end
