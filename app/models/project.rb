class Project < ApplicationRecord
  has_many :todo_lists
  has_many :todos, through: :todo_lists
end
