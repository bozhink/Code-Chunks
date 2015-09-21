#!/usr/bin/env python

# "Klingon" -- this is a Python version of an old tty game circa 1976 by
# David A. Wheeler (the original game was written in BASIC).
# (C) 2000 David A. Wheeler <dwheeler@dwheeler.com>

# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.

# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.

# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111 USA


# This code was more-or-less transliterated from the BASIC code, so don't
# look for great examples of Python programming style here.
# At the time, this was one of the very few games available on my school's
# PDP's, so it was a local "hit."  I'm happy to say that both the
# computers and games have gotten more sophisticated since then...!
# This program intentionally keeps the original user interface
# (numbered commands), "help" list, etc.

import sys, string, random, time
# import os

# Constants:
enterprise=0
klingon=1

# Global values
damage = [0, 0 ]   # damage[0] = enterprise, [1] = klingon; larger is worse
distance = 0.0
rank=0

def init_game():
    global damage
    global distance
    damage = [0, 0 ]
    distance = random.random()*100 + 100


def show_instructions():
    print "Available Commands:"
    print "1 = Phaser           Range =   0 to 200"
    print "2 = Photon Torpedo   Range = 150 to 300"
    print "3 = Move Closer"
    print "4 = Move Away"
    print "5 = Self-Destruct"
    print "6 = Surrender"
    print "7 = Evasive Action"

def get_command():
    while 1:
        line = raw_input("Your Command? >>>  ")
        try:
            command = int(line)
        except ValueError:
            print "That was not a valid number.  Enter 0 for help."
            continue
        if command == 0:         show_instructions()
        elif 1 <= command <= 7: return command
        else: print "No such command; choose 0 for help."

def opponent(p):
    return 1-p

def name(p):
    if p==0: return "U.S.S. Enterprise"
    else:    return "Klingon"

def dead(damage):
    if damage>12: return 1
    else:         return 0

def show_destruction(victim):
    if victim==0:
        print "U.S.S. Enterprise destroyed!"
    else:
        print "K L I N G O N   D E S T R O Y E D"

def cause_damage(victim, shotvalue):
    d = damage[victim] + shotvalue
    if d > 12:
        show_destruction(victim)
        damage[victim] = d
        return
    if d >= 7 and damage[victim] < 7:
        print victim,": Shields down."
    if d >= 11 and damage[victim] < 11:
        print victim,": Warp engines have suffered major damage."
    damage[victim] = d
    if d <= 3:   print victim,": Shields holding, no damage."
    elif d <= 5: print victim,": Shields weakening."
    elif d == 6: print victim,": Shields weakening... minor damage amidships."
    elif d == 7: pass   # print "Shields down."
    elif d == 8: print victim,": Minor damage to hull."
    elif d == 9: print victim,": Major damage to hull."
    elif d == 10: print victim,": Dilithium crystals overheating."
    elif d == 11: pass # print "Warp engines have suffered major damage."
    elif d == 12: print victim,": Photon torpedo tube destroyed!"

def game_over():
    if dead(damage[0]) or dead(damage[1]): return 1
    if distance > 300 or distance <= 0:    return 1
    return 0

def phaser(victim):
    if distance > 200:
        print victim,": Sorry, too far away for phasers."
        return
    if random.random() > .7 - distance/1000:
        print victim,": Miss."
        return
    if random.random() < 0.05:
        print victim,": Lucky shot!"
        shotvalue=3
    else:
        print victim,": Phaser hits, damage done to " + name(victim) + ":"
        shotvalue=1
    cause_damage(victim, shotvalue)
    

def photon(victim):
    if distance < 150:
        print victim,": Sorry, too close for photon torpedos."
        return
    if random.random() > .7 - distance/600:
        print victim,": Miss."
        return
    if random.random() < 0.05:
        print victim,": Lucky shot!"
        shotvalue=4
    else:
        print victim,": Photon Torpedo hits, damage done to " + name(victim) + ":"
        shotvalue=2
    cause_damage(victim, shotvalue)

def move(mover, direction):
    global distance
    if damage[mover] >= 11:
        distance = distance + direction * (10 + 25*random.random())
    else:
        distance = distance + direction * (50 + 15*random.random())
    if distance > 300:
        print "Out of range."
    if distance < 0:
        if random.random() < 0.3:
            print "The ships have run past each other."
            distance = abs(distance) + 10
        else:
            print "The ships have crashed into each other!"
            damage[0] = damage[1] = 100
       

def self_destruct(player):
    print "Auto-destruct sequence   A C T I V A T E D"
    for x in xrange(5,0,-1):
        print x
        time.sleep(1)
    cause_damage(player, 100)
    # Make the range extremely variable, and create a small but nonzero
    # chance to hit faraway opponents:
    range = random.random()*90+10
    if random.random() < 0.02: range = range * 5
    print "Radius of anti-matter explosion = %s" % range
    if distance <= range:
        cause_damage(opponent(player), 100)
    else:
        print name(opponent(player)) + " unharmed."

def surrender(player):
    # In Star Trek, Klingons don't take prisoners, but consistency is
    # less important than gameplay...
    print "I accept your surrender."
    damage[player] = 100

def klingon_turn():
    if damage[klingon] > 10 and damage[enterprise] < 8:
        # The situation is desparate!
        if distance <= 80:    command=5
        elif distance < 175: command=3
        else: command=4
    else:
        if random.random() < 0.35:
            # Make a random choice.
            command=0
            while command==0:
                command=int(random.random()*4 + 1)
                if   command==1 and distance>200: command=2
                elif command==2 and distance<150: command=1
                if command==2 and damage[klingon]>11: command=0
        else:  # Normal case, make a "reasonable decision"
            if   distance<80:  command=4
            elif distance<175: command=1
            elif distance<210: command=2
            else:              command=3
    # Execute command selected.
    if command == 1:
        print "Klingon fires phasers."
        phaser(0)
    elif command == 2:
        print "Klingon fires photon torpedos."
        photon(0)
    elif command == 3:
        print "Klingon moves closer."
        move(klingon, -1)
    elif command == 4:
        print "Klingon moves away."
        move(klingon, 1)
    elif command == 5:
        print "Klingon initiates self-destruct!"
        self_destruct(1)
    else:
        print "Klingon executes " + `command`


def compute_new_rank():
    global rank
    # Did we win (1), lose (-1), or draw (0)?
    win = 0
    if dead(damage[klingon]):    win = win + 1
    if dead(damage[enterprise]): win = win - 1
    rank = rank + win

def rank_name(rank):
    if   rank <= -3:  return "Son of a Romulan worm"
    elif rank == -2:  return "Latrine-cleaner"
    elif rank == -1:  return "Ensign"
    elif rank ==  0:  return "Lieutenant"
    elif rank ==  1:  return "Lieutenant Commander"
    elif rank ==  2:  return "Commander"
    elif rank ==  3:  return "Captain"
    elif rank ==  4:  return "Commodore"
    elif rank ==  5:  return "Admiral"
    elif rank ==  6:  return "Rear Admiral"
    elif rank ==  7:  return "Full Admiral"
    elif rank  >  7:  return `(rank-3)` + "-star Full Admiral"

def display_rank():
    print "Your current rank is: " + rank_name(rank) + "."


def play_a_game():
    # Play a game
    global distance
    init_game()
    print
    if rank < 5:
        print "Klingon coming in!"
    else:
        print "Klingon Flagship coming in!"
        damage[klingon] = -4
    print
    while 1:
        distance = distance + (random.random() - 0.5)* 10
        if distance < 1:
            distance = 1 + (random.random() * 2)
        print "Distance to Klingon = " + `distance`
        print
        command = get_command()
        if   command == 1: phaser(1)
        elif command == 2: photon(1)
        elif command == 3: move(0, -1)
        elif command == 4: move(0, 1)
        elif command == 5: self_destruct(0)
        elif command == 6: surrender(0)
        if game_over(): break
        klingon_turn()
        if game_over(): break


def main():
    print "Welcome to 'Klingon' by David A. Wheeler."
    print "(an exercise in retrocomputing; original game circa 1976)"
    print """\
You command the U.S.S. Enterprise and must defeat a Klingon Warbird."""
    print
    line = raw_input("Do you want instructions? ")
    if len(line) > 0 and string.upper(line[0]) == "Y": show_instructions()

    print "When you want a list of choices, type 0 and press return."
    
    while 1:
        play_a_game()
        print; print
        compute_new_rank()
        display_rank()
        line = raw_input("Do you wish to play again? ")
        if len(line) > 0 and string.upper(line[0]) == "N":
            break


if __name__ == "__main__":
    main()

