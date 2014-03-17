require 'fileutils'
require 'etc'
require 'goodreads'

def fin()
	output = "<br/>"
	output += "<p>Réalisé grâce à :<br/><img src='https://djgho45yw78yg.cloudfront.net/assets/press/logo-5aea6e61d29a47cb9ebfabec5d3aa1ca.png' alt='goodreads_logo' width='100px'/></p>"
	return output
end

def contenuReview(key,name)

	client = Goodreads.new(:api_key => key)


	output = "<h1 id='reviews-faites'>Reviews faites</h1>"
	output +="<ul>"
	shelf = client.shelf(name, "reviewed")

	shelf.books.each do |book|

		bookContent = book.book

		blah = book.inspect

		bookId = bookContent.id
		bookTitle = bookContent.title
		authorId = bookContent.authors.author.id

		author = client.author(authorId)
		review = client.review(book.id)

		review = review.body.strip

		if review != "" then
			page = Nokogiri::HTML(review)
			links = page.css("a")
		
			output += "<li><i><a href='"+ links[0]["href"]+ "'>#{bookTitle}</a></i> - <b>#{author.name}</b></li>"

		end
	end

	output += "</ul>"
	return output

end

def contenuSansReview(key,name)

	client = Goodreads.new(:api_key => key)


	output = "<h1 id='lus-mais-pas-encore-de-review'>Lus mais pas encore de review</h1>"
	output += "<ul>"
	shelf = client.shelf(name, "to-review")
	
	shelf.books.each do |book|

		bookContent = book.book

		blah = book.inspect

		bookId = bookContent.id
		bookTitle = bookContent.title
		authorId = bookContent.authors.author.id

		author = client.author(authorId)
		
		output += "<li><i>#{bookTitle}</i> - <b>#{author.name}</b></li>"
		
	end

	output += "</ul>"
	return output

end

def contenuEnCours(key,name)

	client = Goodreads.new(:api_key => key)


	output = "<h1 id='en-cours-de-lecture'>En cours de lecture</h1>"
	output += "<ul>"
	shelf = client.shelf(name, "currently-reading")
	
	shelf.books.each do |book|

		bookContent = book.book

		blah = book.inspect

		bookId = bookContent.id
		bookTitle = bookContent.title
		authorId = bookContent.authors.author.id

		author = client.author(authorId)
		
		output += "<li><i>#{bookTitle}</i> - <b>#{author.name}</b></li>"
		
	end

	output += "</ul>"
	return output

end

def contenuALire(key,name)

	client = Goodreads.new(:api_key => key)


	output = "<h1 id='à-lire'>À lire</h1>"
	output += "<ul>"
	shelf = client.shelf(name, "to-read")
	
	shelf.books.each do |book|

		bookContent = book.book

		blah = book.inspect

		bookId = bookContent.id
		bookTitle = bookContent.title
		authorId = bookContent.authors.author.id

		author = client.author(authorId)
		
		output +="<li><i>#{bookTitle}</i> - <b>#{author.name}</b></li>"
		
	end

	output +="</ul>"
	return output
end

def contenuAAcheter(key,name)

	client = Goodreads.new(:api_key => key)


	output="<h1 id='à-acheter'>À acheter</h1>"
	output += "<ul>"
	shelf = client.shelf(name, "to-buy")
	
	shelf.books.each do |book|

		bookContent = book.book

		blah = book.inspect

		bookId = bookContent.id
		bookTitle = bookContent.title
		authorId = bookContent.authors.author.id

		author = client.author(authorId)
		
		output +="<li><i>#{bookTitle}</i> - <b>#{author.name}</b></li>"
		
	end

	output +="</ul>"
	return output

end


module Jekyll
	class GoodReadsBooksTag < Liquid::Tag

		def initialize(tag_name, text, tokens)
			super
		end

		def render(context)
			key = context.registers[:site].config['goodreads'].fetch("key","")
			name = context.registers[:site].config['goodreads'].fetch("name","")
			output=contenuReview(key,name)
			output+=contenuSansReview(key,name)
			output+=contenuEnCours(key,name)
			output+=contenuALire(key,name)
			output+=contenuAAcheter(key,name)
			output+=fin()
			%|#{output}|
		end
	end
end

Liquid::Template.register_tag('goodreads_books', Jekyll::GoodReadsBooksTag)




