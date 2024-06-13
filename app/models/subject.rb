class Subject < ApplicationRecord
    before_create { |subject| subject.name = subject.name.capitalize }
    has_many :scores, dependent: :destroy
    has_many :students, through: :scores
end