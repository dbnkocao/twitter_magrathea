class Hashtag < ApplicationRecord
  validates_uniqueness_of :descricao, on: :create, message: "Já existe essa hashtag."
  validates_presence_of :descricao, on: :create, message: "O campo descrição é obrigatório."

  validate :no_space, on: :create
  validate :only_letters_and_digits, on: :create


  private
  def no_space
    unless (self.descricao =~ /[\s]/).nil?
      errors.add(:descricao, "Não é permitido usar espaços em branco em uma hashtag.")
    end
  end

  def only_letters_and_digits
    if self.descricao.size  != self.descricao.scan(/[\w\d]/).count
      errors.add(:descricao, "Uma hashtag deve conter apenas letras e números.")
    end
  end
end
