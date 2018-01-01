using System;

namespace GameFifteen
{
    public class MatrixWalker
    {
        private int[] directionsX = { 1, 1, 1, 0, -1, -1, -1, 0 };
        private int[] directionsY = { 1, 0, -1, -1, -1, 0, 1, 1 };

        private int[,] matrix;
        private int dimensionX;
        private int dimensionY;

        /// <summary>
        /// Initializes new instance of Matrix object with inner matrix of rank n.
        /// </summary>
        /// <param name="size">Number of rows/columns of the matrix.</param>
        public MatrixWalker(int size)
        {
            this.Matrix = new int[size, size];
            this.DimensionX = size;
            this.DimensionY = size;
        }

        public int[,] Matrix
        {
            get
            {
                return this.matrix;
            }

            set
            {
                if (value == null)
                {
                    throw new System.ArgumentNullException("Matrix should not be null.");
                }

                this.matrix = value;
            }
        }

        public int DimensionX
        {
            get
            {
                return this.dimensionX;
            }

            private set
            {
                this.dimensionX = value;
            }
        }

        public int DimensionY
        {
            get
            {
                return this.dimensionY;
            }

            private set
            {
                this.dimensionY = value;
            }
        }

        public Cell Change(Cell cell)
        {
            int[] directionsX = { 1, 1, 1, 0, -1, -1, -1, 0 };
            int[] directionsY = { 1, 0, -1, -1, -1, 0, 1, 1 };

            int cd = 0;
            for (int count = 0; count < 8; count++)
            {
                if (directionsX[count] == cell.X && directionsY[count] == cell.Y)
                {
                    cd = count;
                    break;
                }
            }

            Cell result = new Cell(cell);
            if (cd == 7)
            {
                result.X = directionsX[0];
                result.Y = directionsY[0];

            }
            else
            {
                result.X = directionsX[cd + 1];
                result.Y = directionsY[cd + 1];
            }

            return result;
        }

        public bool CheckCell(Cell cell)
        {
            int[] directionsX = { 1, 1, 1, 0, -1, -1, -1, 0 };
            int[] directionsY = { 1, 0, -1, -1, -1, 0, 1, 1 };

            int x = cell.X;
            int y = cell.Y;
            for (int i = 0; i < 8; i++)
            {
                if (this.DimensionX <= x + directionsX[i] || x + directionsX[i] < 0)
                {
                    directionsX[i] = 0;
                }


                if (this.DimensionY <= y + directionsY[i] || y + directionsY[i] < 0)
                {
                    directionsY[i] = 0;
                }
            }

            for (int i = 0; i < 8; i++)
            {
                if (this.matrix[x + directionsX[i], y + directionsY[i]] == 0)
                {
                    return true;
                }
            }

            return false;
        }

        public Cell FindCell()
        {
            Cell result = new Cell(0, 0);
            for (int i = 0; i < this.DimensionX; i++)
            {
                for (int j = 0; j < this.DimensionY; j++)
                {
                    if (this.matrix[i, j] == 0)
                    {
                        result.X = i;
                        result.Y = j;
                        return result;
                    }
                }
            }

            return result;
        }

        public void Run()
        {
            Cell cell = new Cell(0, 0);
            int k = 1;

            k = Update(k, cell);
            PrintMatrix();

            cell = FindCell();
            if (cell.X != 0 && cell.Y != 0)
            {
                k = Update(k, cell);
            }

            PrintMatrix();
        }

        private int Update(int k, Cell cell)
        {
            int i = cell.X;
            int j = cell.Y;
            int dx = 1;
            int dy = 1;

            while (true)
            {
                this.Matrix[i, j] = k;

                if (!CheckCell(new Cell(i, j)))
                {
                    break;
                }

                Cell changedCell = new Cell(dx, dy);
                while (IsValidCell(i, j, dx, dy))
                {
                    changedCell = Change(changedCell);
                    dx = changedCell.X;
                    dy = changedCell.Y;
                }

                i += dx;
                j += dy;
                k++;
            }

            return k;
        }

        private void PrintMatrix()
        {
            for (int rowIndex = 0; rowIndex < this.DimensionX; rowIndex++)
            {
                for (int columnIndex = 0; columnIndex < this.DimensionY; columnIndex++)
                {
                    Console.Write("{0,3}", matrix[rowIndex, columnIndex]);
                }

                Console.WriteLine();
            }
        }

        private bool IsValidCell(int i, int j, int dx, int dy)
        {
            return (this.DimensionX <= i + dx) || (i + dx < 0) ||
                (this.DimensionY <= j + dy) || (j + dy < 0) ||
                (this.matrix[i + dx, j + dy] != 0);
        }
    }
}
