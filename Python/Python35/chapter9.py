class Restaurant():

	def __init__(self,name,cuisinte_type):
		self.name = name;
		self.cuisinte_type = cuisinte_type
		self.number_served = 0
	
	
	def describe_restaurant(self):
		print('Restaurant name is '+ self.name.title() + " and cuisinte type is "+ self.cuisinte_type + "number of customers " + str(self.number_served))
		
	def restaurant_open(self):
		print('Restaurant is open')
	def add_customers(self,number):
		self.number_served+=number


pizzeria = Restaurant('Pizzeria','pizza')
Kebs = Restaurant('Dara','kebs')
chinczyk = Restaurant('Sajgon','chinczyk')
pizzeria.describe_restaurant()
pizzeria.add_customers(5)
pizzeria.describe_restaurant()
pizzeria.restaurant_open()
Kebs.describe_restaurant()
Kebs.add_customers(5)
Kebs.describe_restaurant()
Kebs.restaurant_open()
chinczyk.describe_restaurant()
chinczyk.add_customers(5)
chinczyk.describe_restaurant()
chinczyk.restaurant_open()

class User():

	def __init__(self,first_name,last_name,points,money):
		self.first_name = first_name
		self.last_name = last_name
		self.points = points
		self.money = money
		self.login_attempts = 0
		
	
	
	def describe_restaurant(self):
		print(self.first_name+self.last_name+str(self.points)+str(self.money))
		
	def restaurant_open(self):
		print('Hello michal you are not an american idiot'+ str(self.login_attempts))	
		
	def inc(self):
		self.login_attempts += 1
				
	
michal = User('Michal','Blazej',25000,'1500')

michal.inc()
michal.inc()
michal.inc()
michal.inc()

michal.describe_restaurant()
michal.restaurant_open()


