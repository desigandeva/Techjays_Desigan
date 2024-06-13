class Student < ApplicationRecord
    before_create { |student| student.name = student.name.capitalize }
    has_many :scores, dependent: :destroy
    has_many :subjects, through: :scores
end