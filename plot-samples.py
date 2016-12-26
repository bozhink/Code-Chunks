# -*- coding: utf-8 -*-
"""
Spyder Editor

This is a temporary script file.
"""

import matplotlib.pyplot as plt

year = [1800, 1850, 1900] + [1950, 1970, 1990, 2010]
pop = [1.0, 1.262, 1.650] + [2.519, 3.692, 5.263, 6.972]

# line plot
plt.plot(year, pop)

# scatter plot
plt.scatter(year, pop)

# set x-axis to be logarithmic
# plt.xscale('log')
# plt.yscale('log')

# fill color
plt.fill_between(year, pop, 0, color='green')

# axis labels
plt.xlabel('Year')
plt.ylabel('Population')

# title
plt.title('World Popularion Projection')

# ticks
plt.yticks([0, 2, 4, 6, 8],
           # labels:
           ['0', '2B', '4B', '6B', '8B'])


# show combined plot
plt.show()

