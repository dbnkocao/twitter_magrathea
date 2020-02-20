class Hashtag < ApplicationRecord
  validates_uniqueness_of :descricao, on: :create, message: "Já existe essa hashtag."
end
