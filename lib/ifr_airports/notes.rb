
#Trying to get the table I want but this produces an array of 6 tables!
doc.css('[id = "template-main-content"]').css("table").size

#I believe this is getting me the table I want
table = doc.css('[id = "content_dgAirportSearch"]')

#This oroduces the second row which is the first content row
table.css("tr")[1]

#This provides the airport ID from the first row
table.css("tr")[1].css("td")[0].text

#produces the airport name 
table.css("tr")[1].css("td")[1].text

#produces bad weather support indicator
table.css("tr")[1].css("td")[2].text