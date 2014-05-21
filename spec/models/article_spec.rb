require "spec_helper"

describe Article do
  context "when counting the number of words in the article" do
    it "calculates by splitting on spaces" do
      article = Article.new(title: "Foo", body: "A sentence.")
      expect(article.calculate_word_count).to eq(2)
    end

    it "persists the word count to the database" do
      article = Article.new(title: "Foo", body: "A sentence.")
      article.stub(calculate_word_count: 5)

      article.save
      expect(article.word_count).to eq(5)
    end
  end
end