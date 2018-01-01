﻿using System;

namespace ControlFlowHomework
{
    class ControlFlowHomework
    {
        static void Main(string[] args)
        {
            // Task 1
            {
                Chef chef = new Chef();
                chef.Cook();
            }

            // Task 2
            {
                CookVegetables cookVegetables = new CookVegetables();
                cookVegetables.CookPotato();

                Chess chess = new Chess();
                chess.VisitCellIfPossible(2, 2, true);
            }

            // Task 3
            {
                ValueFinder<String> finder = new ValueFinder<String>();
                const int ArraySize = 120;
                String[] array = new String[ArraySize];
                array[0] = "z";
                for (int i = 1; i < ArraySize; ++i)
                {
                    array[i] = "a";
                }

                finder.Find(array, "a");
            }
        }
    }
}
