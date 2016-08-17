# Create a thesaurus application. To create it, you will create two classes, Thesaurus and Entry.
# A Thesaurus will contain many Entries. An Entry contains three primary attributes:
# word, synonymns, and antonyms. Your application should contain the following features:
# 1. The ability to add new words to a Thesaurus.
# 2. The ability to delete a word from a Thesaurus.
# 3. The ability to look up a word's synonyms.
# 4. The ability to look up a word's antonyms.
# 5. The ability to add a synonym to a word.
# 6. The ability to add an antonym to a word.
#
# Part of the challenge is to determine which functionality belongs in the Thesaurus class,
# and which belongs in the Entry class.
#
# And... test your functionality using RSpec!

class Entry
  attr_accessor :synonyms, :antonyms, :word

  def initialize(options)
    @word = options[:word]
    @synonyms = [options[:synonyms]]
    @antonyms = [options[:antonyms]]
  end

end

class Thesaurus

  def initialize(entries)
    @entries = entries
  end

  def list_of_entries
    @entries.each_with_index do |entry, index|
      puts "#{(index + 1).to_s}.  WORD: (#{entry.word}) SYNONYMS: (#{entry.synonyms}) ANTONYMS: (#{entry.antonyms})"
    end
  end

  def add_new_word(new_word)
    @entries << Entry.new(word: new_word)
  end

  def delete_word(word)
    @entries.delete_if{|entry| entry.word == word}
  end

  def synonyms_for_word(word)
    @entries.find{|entry| return entry.synonyms if entry.word == word}
  end

  def antonyms_for_word(word)
    @entries.find{|entry| return entry.antonyms if entry.word == word}
  end

  def add_synonym_to_word(word, synonym)
    @entries.find{|entry| entry.synonyms << synonym if entry.word == word}
  end

  def add_antonym_to_word(word, antonym)
    @entries.find{|entry| entry.antonyms << antonym if entry.word == word}
  end

end

entry1 = Entry.new(word: "afraid", synonyms: "petrified", antonyms: "valiant")
entry2 = Entry.new(word: "ask", synonyms: "interrogate", antonyms: "retort")
entry3 = Entry.new(word: "correct", synonyms: "verified", antonyms: "mistaken")
entry4 = Entry.new(word: "bliss", synonyms: "happiness", antonyms: "unhapiness")
entry5 = Entry.new(word: "captivity", synonyms: "bondage", antonyms: "freedom")
entry6 = Entry.new(word: "celebrated", synonyms: "famous", antonyms: "unknown")

thesaurus1 = Thesaurus.new([entry1,entry2,entry3,entry4,entry5,entry6]) # A thesaurus has many entries

RSpec.describe Thesaurus do
  describe '#list_of_entries' do
    it 'returns a list of all entries in thesaurus' do
      result = thesaurus1.list_of_entries
      expect(result).to match_array(result[0..5])
    end
  end
end

RSpec.describe Thesaurus do
  describe '#add_new_word' do
    it 'creates a new entry with only a new word to a thesaurus' do
      thesaurus1.add_new_word("cheerful")
      result = thesaurus1.list_of_entries
      expect(result).to match_array(result[0..6])
    end
  end
end

RSpec.describe Thesaurus do
  describe '#delete_word' do
    it 'deletes an entry from a thesaurus' do
      thesaurus1.delete_word("afraid")
      result = thesaurus1.list_of_entries
      expect(result).to match_array(result[0..5])
    end
  end
end

RSpec.describe Thesaurus do
  describe '#synonyms_for_word' do
    it 'shows synonyms for a word in a thesaurus' do
      result = thesaurus1.synonyms_for_word("celebrated")
      expect(result).to eq(["famous"])
    end
  end
end

RSpec.describe Thesaurus do
  describe '#antonyms_for_word' do
    it 'shows antonyms for a word in a thesaurus' do
      result = thesaurus1.antonyms_for_word("correct")
      expect(result).to eq(["mistaken"])
    end
  end
end

RSpec.describe Thesaurus do
  describe '#add_synonym_to_word' do
    it 'adds synonyms to a word in a thesaurus' do
      thesaurus1.add_synonym_to_word("bliss", "joyfull")
      result = thesaurus1.synonyms_for_word("bliss")
      expect(result).to eq(["happiness", "joyfull"])
    end
  end
end

RSpec.describe Thesaurus do
  describe '#add_antonym_to_word' do
    it 'adds antonyms to a word in a thesaurus' do
      thesaurus1.add_antonym_to_word("bliss", "depressed")
      result = thesaurus1.antonyms_for_word("bliss")
      expect(result).to eq(["unhapiness", "depressed"])
    end
  end
end
