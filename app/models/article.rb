class Article < ActiveRecord::Base
  validates :title, :presence => true

  before_save :set_word_count

  def calculate_word_count
    self.body.split(' ').size
  end

  private

  def set_word_count
    self.word_count = calculate_word_count
  end
end