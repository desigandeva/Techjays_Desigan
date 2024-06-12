class Subject < ApplicationRecord
    before_create { |subject| subject.name = subject.name.capitalize }
    has_many :students
    has_many :scores, dependent: :destroy
end