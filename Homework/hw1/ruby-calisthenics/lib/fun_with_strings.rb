module FunWithStrings
  def palindrome?
    # your code here
    word = self.gsub(/\W+/, '')
    word = word.downcase
    return true if word == word.reverse && self != '' 
    false
  end
  def count_words
    # your code here
    str = self.downcase.split
    words = {}
    str.each do |word|
      word = word.gsub(/\W+/, '') 
      if words.include? word
        words[word] += 1
      else
        words[word] = 1 if word != '' 
      end
    end
    words
  end
  def anagram_groups
    # your code here
    word = self.downcase.split
    group = word.group_by{ |anagram| anagram.chars.sort }.values
  end
end

# make all the above functions available as instance methods on Strings:

class String
  include FunWithStrings
end

# Test cases 1

puts 'abba'.palindrome? == true
puts 'racecar'.palindrome? == true
puts 'chocolate'.palindrome? == false
puts ''.palindrome? == false
puts 'A man, a plan, a canal -- Panama!'.palindrome?

# Test case 2

puts 'now is the time'.count_words =={'now' => 1, 'is' => 1, 'the'=> 1, 'time' =>1 }
puts 'A man, a plan, a canal -- Panama!'.count_words == {'a' => 3, 'man' => 1, "plan" => 1, "canal" => 1, "panama" => 1} #== {'man' => 1, 'plan' => 1, 'canal' => 1, 'a' => 3, 'panama' => 1}
puts 'Doo bee doo bee doo'.count_words == {'doo' => 3, 'bee' => 2}
puts ''.count_words == {}

#Test case 3
puts 'scream cars for four scar creams'.anagram_groups == [["scream", "creams"], ["cars", "scar"],["for"],["four"]]
puts 'rats tars apple pplea for star '.anagram_groups == [["rats", "tars", "star"],["apple","pplea"],["for"]]
puts ''.anagram_groups == []
