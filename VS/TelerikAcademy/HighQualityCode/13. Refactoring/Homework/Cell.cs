using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace GameFifteen
{
    public class Cell
    {
        private int x;
        private int y;

        public Cell(int x, int y)
        {
            this.X = x;
            this.Y = y;
        }

        public Cell(Cell cell)
        {
            this.X = cell.X;
            this.Y = cell.Y;
        }

        public int X
        {
            get
            {
                return this.x;
            }

            set
            {
                this.x = value;
            }
        }

        public int Y
        {
            get
            {
                return this.y;
            }

            set
            {
                this.y = value;
            }
        }
    }
}
