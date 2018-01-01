using System;

public class CSharpExam : Exam
{
    private const int MinimalScore = 0;
    private const int MaximalScore = 100;

    private int score;

    public CSharpExam(int score)
    {
        this.Score = score;
    }

    public int Score
    {
        get
        {
            return this.score;
        }

        private set
        {
            if (MinimalScore > value || value > MaximalScore)
            {
                throw new ArgumentOutOfRangeException(
                    "Score must be between " + MinimalScore + " and " + MaximalScore + ".");
            }
            else
            {
                this.score = value;
            }
        }
    }

    public override ExamResult Check()
    {
        return new ExamResult(this.Score, MinimalScore, MaximalScore, "Exam results calculated by score.");
    }
}
