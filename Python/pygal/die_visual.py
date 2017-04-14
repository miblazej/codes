from die import Die
import pygal


def label(dice1, dice2):
    x_axis = []
    for x in range(1, dice1*dice2):
        x_axis.append(str(x))
    return x_axis


def auto_title(dice1, dice2, time):
    return "Results of rolling one D" + str(dice1) + " and one D" + str(dice2) + " " + str(time) + " times"


die1 = Die(8)
die2 = Die(8)
time = 1000
results = []

for roll_num in range(time):
    result = die1.roll() * die2.roll()
    results.append(result)

frequencies = []
for value in range(1, (die1.num_sides * die2.num_sides)+1):
    frequency = results.count(value)
    frequencies.append(frequency)

print(frequencies)

# Visualize the results

hist = pygal.Bar()

hist.title = auto_title(die1.num_sides, die2.num_sides, range)
hist.x_labels = label(die1.num_sides, die2.num_sides)
hist.x_title = "Result"
hist.y_title = "Frequncy of results"
hist.add('D6 + D10', frequencies)
hist.render_to_file('die_visual.svg')