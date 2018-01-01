using System;
using System.Collections.Generic;
using System.Linq;

public class Student
{
    private string firstName;
    private string lastName;
    private IList<Exam> exams;

    public Student(string firstName, string lastName, IList<Exam> exams = null)
    {
        this.FirstName = firstName;
        this.LastName = lastName;
        this.Exams = exams;
    }

    public string FirstName
    {
        get
        {
            return this.firstName;
        }

        set
        {
            if (value == null || value == string.Empty)
            {
                throw new ArgumentNullException("Invalid first name.");
            }
            else
            {
                this.firstName = value;
            }
        }
    }

    public string LastName
    {
        get
        {
            return this.lastName;
        }

        set
        {
            if (value == null || value == string.Empty)
            {
                throw new ArgumentNullException("Invalid last name.");
            }
            else
            {
                this.lastName = value;
            }
        }
    }

    public IList<Exam> Exams
    {
        get
        {
            if (this.exams == null || this.exams.Count < 1)
            {
                throw new NullReferenceException("The student has no exams.");
            }
            else
            {
                return this.exams;
            }
        }

        set
        {
            this.exams = value;
        }
    }

    public IList<ExamResult> CheckExams()
    {
        IList<ExamResult> results = new List<ExamResult>();

        try
        {
            int examsCount = this.Exams.Count;
            for (int i = 0; i < examsCount; ++i)
            {
                results.Add(this.Exams[i].Check());
            }
        }
        catch (NullReferenceException e)
        {
            Console.WriteLine(e.Message);
        }

        return results;
    }

    public double CalcAverageExamResultInPercents()
    {
        double result = 0.0;
        try
        {
            int examsCount = this.Exams.Count;
            double[] examScore = new double[examsCount];
            IList<ExamResult> examResults = this.CheckExams();
            for (int i = 0; i < examsCount; ++i)
            {
                examScore[i] =
                    ((double)examResults[i].Grade - examResults[i].MinGrade) /
                    (examResults[i].MaxGrade - examResults[i].MinGrade);
            }

            result = examScore.Average();
        }
        catch (NullReferenceException e)
        {
            Console.WriteLine(e.Message);
        }

        return result;
    }
}
