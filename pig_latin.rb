# Pig Latin
# Rule 1. If a word begins with a vowel sound, add an "ay" sound to the end of the word.
# Rule 2.  If a word begins with a consonant sound, move it to the end of the word, and then add an "ay" sound to the end of the word.

class PigLatin
  attr_accessor :word

  def self.starting_letters_translate(word)
    output = ""
    if word.start_with?("a","e","i","o","u","yt","xr")
      output = word + "ay"
    elsif word.start_with?("thr","sch","squ")
      output = word.split(%r{\s*}).rotate.rotate.rotate.join + "ay"
    elsif word.start_with?("ch","qu","th")
      output = word.split(%r{\s*}).rotate.rotate.join + "ay"
    elsif word.start_with?("ye","xe","b","c","d","f","g","h","j","k","l","m","n","p","q","r","s","t","v","w","x","y","z")
      output = word.split(%r{\s*}).rotate.join + "ay"
    end
    output
  end    

  def self.translate(word)
    output = ""
    phrase = []
    if word.split(" ").size > 1
      word.split(" ").each { |w| phrase << starting_letters_translate(w) }
      output = phrase.join(" ")
    else
      output = starting_letters_translate(word)
    end
    output
  end
end


puts PigLatin.translate("apple")
puts PigLatin.translate("pig")
puts PigLatin.translate("quick fast run")