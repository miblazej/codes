szymon = {'first_name': 'szymon','last_name': 'Wisniewski','age' : 27, 'city': 'Rzeszow'}
print(szymon)

favoite_numbers = {
    'michal': 5,
    'Xiaoya': 4,
    'Szymon': 0,
    'David': 7,
    'Rafal': 2,
}

print(favoite_numbers)

glossary = {

'for': 'loop that it is very helpfull in programing',
'in' : 'think that will help us a lot',
'if' : 'logic statement returns true or false',
'elif': ' 2nd if in a loop',
'else': 'if nothing is true then there is always else'
}





for instruction,describtion in glossary.items():
	print(instruction + " Describtion: " + describtion)

rivers = {

'nile': 'egypt',
'wisla': 'poland',
'wolga': 'russia',

}


for river,country in rivers.items():
	print("The "+ river.title() + " runs through " + country.title())
	
for river in rivers.keys():
	print(river)

for country in rivers.values():
	print(country)

## Exe 6-6
favorite_languages = {
'jen': 'python',
'sarah': 'c',
'edward': 'ruby',
'phil': 'python',
'Andrew': 'c++',
'Alex': '',
'Pablo': '',
'Gregor': '',
}

for name,language in sorted(favorite_languages.items()):
	if language != '':
		print(name.title() + "s favorite language is "+ language.title())
	elif language == "":
		print("Hi "+ name.title() +" you should take a favorite language pool")


people_kln = {
'Sieradzki' : 'nie ma napleta',
'Wisniewski': 'nie ma roboty',
'Nowak': 'nie ma wzrostu',
'Kwoka': 'nie ma ochoty',
'Roman': 'nie ma zachamowań',

}

people_frb = {
'Fabian' : 'pracuje',
'Falk': 'oglada z archiwum X',
'Maria' : 'pracuje w Basel',
'Ben' : 'pali trawke i jezdzi na rowerze',
'Patryk': 'bawi sie sieciami neuronowymi',
}


people = [favorite_languages,people_frb,people_frb]

for one_of_list in people:
	for k,v in one_of_list.items():
		print(k.title() + " describtion: " + v)





dog = {
'name': 'Burek',
'wlasciciel': 'Ola',
'rasa': 'mieszaniec',
'cechy szczegolne': 'bardzo mily piesek'
}

cat = {
'name': 'Lalunia',
'wlasciciel': 'Mariusz',
'rasa': 'kot z niebieskimi oczami',
'cechy szczegolne': 'tylko sepi zarcie'
}


jamnik = {
'name': 'Korek',
'wlasciciel': 'Bolek',
'rasa': 'mieszany jamnik',
'cechy szczegolne': 'bolek go kupil zeby nam zrobic na zlosc'
}

pets = [dog,cat,jamnik]

for pet in pets:
	for k,v in pet.items():
		print(k.title()+ " " + v)

# 6.9

favorite_places = {

'John' : ['San Francisko','Chicago','Los Angeles'],
'Pawel': ['Zakopane','Solina','Niechobrz'],
'Michal':['Nowy Jork','Londyn','Reyjkavik'],

}


for k,v in favorite_places.items():
	print(k.title() + " jego ulubione miejsca to: " + str(v))

favoite_numbers = {
    'michal': [5,4],
    'Xiaoya': [5,4],
    'Szymon': [5,4],
    'David': [5,4],
    'Rafal': [5,4],
}

for k,v in favoite_numbers.items():
	print(k.title() + " favorite numbers of that person: " + str(v))


cities ={

'Nowy_jork' :  {
'name' : 'Nowy Jork',
'kraj' : 'USA',
'populacja': '8kk',
'fakt': 'tam wszystko jest mozliwe',
},
'Londyn' : {
'name' : 'Londyn',
'kraj' : 'Wielka Brytania',
'populacja': '13kk',
'fakt': 'Muszlumanin jest mayorem',
},

'Reyjkavik' : {
'name' : 'Ryjkjavik',
'kraj' : 'Islandia',
'populacja': '300k',
'fakt': 'Elfy and shit',
},



}

for k,v in cities.items():
	kraj = v['kraj']
	name = v['name']
	populacja=v['populacja']
	fakt = v['fakt']
	print(kraj+","+name+","+populacja+","+fakt)



