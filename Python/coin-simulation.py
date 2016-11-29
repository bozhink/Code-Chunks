import random


def enumerate_trials(size):
    for j in range(size):
        yield random.randint(0, 1)


NUMBER_OF_SIMULATION_RUNS = 10000
NUMBER_OF_TRIALS = 30
RESULTANT_HEADS = 22
m = 0
for i in range(NUMBER_OF_SIMULATION_RUNS):
    trials = list(enumerate_trials(NUMBER_OF_TRIALS))
    if sum(trials) > RESULTANT_HEADS:
        m += 1

p = m / NUMBER_OF_SIMULATION_RUNS
print(p)
