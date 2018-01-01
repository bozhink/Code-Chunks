namespace School
{
    using System;
    using System.Collections.Generic;
    using System.Linq;

    public class Course
    {
        private const int MaximalNumberOfSignedStudents = 30;
        private ICollection<Student> listOfStudents;
        private string name;

        /// <summary>
        /// Initializes a new instance of School.Course class with name 'name'.
        /// </summary>
        /// <param name="name">The name of the course.</param>
        /// <exception cref="System.ArgumentException">Invalid course name.</exception>
        public Course(string name)
        {
            this.Name = name;
            this.listOfStudents = new List<Student>();
        }

        /// <summary>
        /// Gets the name of the Course object.
        /// </summary>
        /// <exception cref="System.ArgumentException">Invalid course name.</exception>
        public string Name
        {
            get
            {
                return this.name;
            }

            private set
            {
                if (string.IsNullOrWhiteSpace(value))
                {
                    throw new ArgumentNullException("Invalid course name.");
                }

                this.name = value;
            }
        }

        /// <summary>
        /// Gets the list of students joined to this course.
        /// </summary>
        public List<Student> ListOfStudents
        {
            get
            {
                return this.listOfStudents.Select(s => s).ToList<Student>();
            }
        }

        /// <summary>
        /// Adds a student to this course.
        /// </summary>
        /// <param name="student">The student to added.</param>
        /// <exception cref="System.ArgumentNullException">Student should not be null.</exception>
        /// <exception cref="System.ApplicationException">Student can be added only once.</exception>
        /// <exception cref="System.ArgumentOutOfRangeException">Maximal number of students in this course is reached.</exception>
        public void AddStudent(Student student)
        {
            if (student == null)
            {
                throw new ArgumentNullException("Student should not be null.");
            }

            if (this.listOfStudents.Contains(student))
            {
                throw new ApplicationException("Student can be added only once.");
            }

            if (this.listOfStudents.Count >= MaximalNumberOfSignedStudents)
            {
                throw new ArgumentOutOfRangeException("Maximal number of students in this course is reached.");
            }

            this.listOfStudents.Add(student);

            try
            {
                student.JoinCourse(this);
            }
            catch (ApplicationException)
            {
                // Course is already added to the course list of the student.
            }
            catch
            {
                throw;
            }
        }

        public void RemoveStudent(Student student)
        {
            if (student == null)
            {
                throw new ArgumentNullException("Student should not be null.");
            }

            if (this.listOfStudents.Contains(student))
            {
                this.listOfStudents.Remove(student);
                student.LeaveCourse(this);
            }
        }
    }
}