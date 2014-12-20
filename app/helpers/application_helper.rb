module ApplicationHelper
	def convert_to_isbn10(isbn)
		isbn13 = isbn.gsub('-','')
		isbn13 = isbn13[3..-2]
		weightage = 0
		isbn13.reverse.split('').each_with_index do |digit, index|
			weightage += digit.to_i*(index+2)
		end
		checkdigit = (11 - (weightage % 11)) % 11
		lastdigit = (checkdigit == 10) ? 'X' : checkdigit.to_s
		isbn10 = isbn13+lastdigit
	end
end