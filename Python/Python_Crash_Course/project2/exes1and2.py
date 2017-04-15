import matplotlib.pyplot as plt

x_5 = [1, 2, 3, 4, 5]
y_5 = [x**3 for x in x_5]

x_5000 = list(range(1, 5000))
y_5000 = [x**3 for x in x_5000]

plt.scatter(x_5000, y_5000,c=y_5000, cmap=plt.cm.Blues, s=100)
plt.title("Cube Numbers", fontsize=24)
plt.xlabel("Value", fontsize=14)
plt.ylabel("Cube of Value", fontsize=14)
plt.axis([0, 5500, 0, 5500**3])

plt.show()
