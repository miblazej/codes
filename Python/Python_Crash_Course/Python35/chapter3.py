friend = ['bartek','lukasz','pawel','mohamed']
print(friend[0].title())
print(friend[1].title()+" szuka dup na tinderze")
print(friend[2].title()+" to moj szwagier ciekawe czy juz wrocil do domu")
print(friend[-1].upper()+ " chuj go wie czy to friend czy foe")

print("Czesc "+friend[0].title()+" jak tam leci ?")
print("Czesc "+friend[1].title()+" jak tam leci ?")
print("Czesc "+friend[2].title()+" jak tam leci ?")
print("Czesc "+friend[3].title()+" jak tam leci ?")

flt = ['Prosze 911','Ferari','Plane','Bike']

print("My favorite car is "+flt[0])
print("But chicks like "+ flt[1]+" the most")
print("One day I will have a "+flt[2])
print("Unfortunately right now I have only a " + flt[-1])

#3.4
dinner_list = ['Adolf Htiler','Albert Einstein','Jozif Stalin','Lenin','Napoleon','Cezar','Robert Lewandowski','Krzysztof Sieradzki','Caryca Katarzyna','Pierwszy czlowiek']

b=len(dinner_list)
for x in range(0,b):	
 print("Hello "+ dinner_list[x].title() + ",jestes zaproszona/y na zajebisty obiad,naprawde zajebisty")
 
 
nie_przyjda = [] 
 
nie_przyjda.append(dinner_list.pop(dinner_list.index("Robert Lewandowski")))
nie_przyjda.append(dinner_list.pop(dinner_list.index("Krzysztof Sieradzki")))
przyjda = ["Szymon Wisniewski","Mario Mandzukic"]

dinner_list.append(przyjda[0])
dinner_list.append(przyjda[1])


print(nie_przyjda[0].title()+"nie wpadnie bo gra mecz z Realem\nA " + nie_przyjda[1].title()+ " bo jest nielojalnym zydkiem i fochy strzela\nAle za to mozemy zawsze liczyc na " + przyjda[0]+" " +przyjda[1])


for x in range(0,len(dinner_list)):	
 print("Hello "+ dinner_list[x].title() + ",jestes zaproszona/y na zajebisty obiad,naprawde zajebisty")


dinner_list.insert(0,'Andrea')
dinner_list.insert(int(len(dinner_list)/2),'Numero uno')
dinner_list.append("Michal")

for x in range(0,len(dinner_list)):	
 print("Hello "+ dinner_list[x].title() + ",jestes zaproszona/y na zajebisty obiad,naprawde zajebisty")
 
print("Nowy stol nie przyjdzie troche lipa tylko dwie osoby moga wpasc")



for x in range(0,len(dinner_list)-2):
	
 print("Przepraszam "+ dinner_list.pop()  +" ale tylko dwie osoby moga przyjsc bo nowy stol nie przyszedl")

for x in range(0,len(dinner_list)):
 print("Zero problemu " + dinner_list[x].title() + " dalej mozecie przyjsc")  
 

del dinner_list[0]
del dinner_list[0]
print(dinner_list)

places = ['Australia','Moskow','Switzerland','Pussy','Madrit']
print(places)
print(sorted(places))
print(places)
places.sort(reverse=True)
print(places)
places.sort()
print(places)
places.reverse()
print(places)
places.reverse()
print(places)
places.sort()
print(places)
places.sort(reverse=True)
print(places)

countries = ["Poland","Ukraine","United Kingdon","Iceland","United States","Norway","Germany","Switzerland","France"]
countries.sort()
print(countries)
countries.reverse()
print(countries)
countries.append("Slovakia?")
print(countries)
a=countries.pop()
print(a)
print(countries)
countries.insert(0,'Russia')
print(countries)
