using System;

public class ExamResult
{
    private int grade;
    private int minGrade;
    private int maxGrade;
    private string comments;

    public ExamResult(int grade, int minGrade, int maxGrade, string comments)
    {
        this.MinGrade = minGrade;
        this.MaxGrade = maxGrade;
        this.Grade = grade;
        this.Comments = comments;
    }

    public int Grade
    {
        get
        {
            return this.grade;
        }

        private set
        {
            if (this.MinGrade > value || value > this.MaxGrade)
            {
                throw new ArgumentOutOfRangeException(
                    "Grade must be between " + this.MinGrade + " and " + this.MaxGrade + ".");
            }
            else
            {
                this.grade = value;
            }
        }
    }

    public int MinGrade
    {
        get
        {
            return this.minGrade;
        }

        private set
        {
            if (value < 0)
            {
                throw new ArgumentOutOfRangeException("MinGrade must be non-negative.");
            }
            else
            {
                this.minGrade = value;
            }
        }
    }

    public int MaxGrade
    {
        get
        {
            return this.maxGrade;
        }

        private set
        {
            if (value <= this.MinGrade)
            {
                throw new ArgumentOutOfRangeException("MaxGrade must be greater than MinGrade");
            }
            else
            {
                this.maxGrade = value;
            }
        }
    }

    public string Comments
    {
        get
        {
            return this.comments;
        }

        private set
        {
            if (value == null || value == string.Empty)
            {
                throw new ArgumentNullException("Comments must be non-empty string");
            }
            else
            {
                this.comments = value;
            }
        }
    }
}
