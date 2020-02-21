class AlterColumnDataPublicacaoToDatetimeInTweets < ActiveRecord::Migration[6.0]
  def change
    change_column :tweets, :data_publicacao, :datetime
  end
end
