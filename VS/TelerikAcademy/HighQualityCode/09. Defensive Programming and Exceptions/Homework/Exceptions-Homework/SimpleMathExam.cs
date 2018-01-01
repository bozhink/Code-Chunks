using System;

public class SimpleMathExam : Exam
{
    private const int MinimalPossibleNumberOfSolvedProblems = 0;
    private const int MaximalPossibleNumberOfSolvedProblems = 10;

    private ArgumentOutOfRangeException invalidNumberOfProblemsSolved =
        new ArgumentOutOfRangeException("Invalid number of problems solved.", new ArgumentOutOfRangeException());

    private int problemsSolved;

    public SimpleMathExam(int problemsSolved)
    {
        this.ProblemsSolved = problemsSolved;
    }

    public int ProblemsSolved
    {
        get
        {
            return this.problemsSolved;
        }

        private set
        {
            if (MinimalPossibleNumberOfSolvedProblems > value || value > MaximalPossibleNumberOfSolvedProblems)
            {
                throw this.invalidNumberOfProblemsSolved;
            }
            else
            {
                this.problemsSolved = value;
            }
        }
    }

    public override ExamResult Check()
    {
        if (this.ProblemsSolved == 0)
        {
            return new ExamResult(2, 2, 6, "Bad result: nothing done.");
        }
        else if (this.ProblemsSolved == 1)
        {
            return new ExamResult(4, 2, 6, "Average result: well done.");
        }
        else if (this.ProblemsSolved == 2)
        {
            return new ExamResult(6, 2, 6, "Highest result: Excellent!");
        }

        throw this.invalidNumberOfProblemsSolved;
    }
}
