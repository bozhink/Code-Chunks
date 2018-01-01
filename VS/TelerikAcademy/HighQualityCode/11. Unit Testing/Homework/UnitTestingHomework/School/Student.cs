namespace School
{
    using System;
    using System.Collections.Generic;
    using System.Linq;

    public class Student
    {
        private const int MinimalValidIdValue = 10000;
        private const int MaximalValidIdValue = 99999;

        private static int lastUsedId = MinimalValidIdValue - 1;

        private ICollection<Course> courses;
        private string name;
        private int id;

        /// <summary>
        /// Initializes a new instance of School.Student class with name 'name'.
        /// </summary>
        /// <param name="name">The name of the student.</param>
        /// <exception cref="System.ArgumentNullException">Invalid student name.</exception>
        /// <exception cref="System.ArgumentOutOfRangeException">Invalid value for Id.</exception>
        public Student(string name)
        {
            this.Name = name;
            this.Id = ++lastUsedId;
            this.courses = new List<Course>();
        }

        /// <summary>
        /// Gets the name of the student.
        /// </summary>
        /// <exception cref="System.ArgumentNullException">Invalid student name.</exception>
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
                    throw new ArgumentNullException("Invalid student name.");
                }

                this.name = value;
            }
        }

        /// <summary>
        /// Gets the unique number of the student.
        /// </summary>
        /// <exception cref="System.ArgumentOutOfRangeException">Invalid value for Id.</exception>
        public int Id
        {
            get
            {
                return this.id;
            }

            private set
            {
                if (MaximalValidIdValue < value || value < MinimalValidIdValue)
                {
                    throw new ArgumentOutOfRangeException("Invalid value for Id.");
                }

                this.id = value;
            }
        }

        public List<Course> ListOfCourses
        {
            get
            {
                return this.courses.Select(s => s).ToList<Course>();
            }
        }

        /// <summary>
        /// Join to a course.
        /// </summary>
        /// <param name="course">Coourse to be joined.</param>
        /// <exception cref="System.ArgumentNullException">Course to join should not be null.</exception>
        /// <exception cref="System.ApplicationException">Student is already signed to this course.</exception>
        public void JoinCourse(Course course)
        {
            if (course == null)
            {
                throw new ArgumentNullException("Course to join should not be null.");
            }

            if (this.courses.Contains(course))
            {
                throw new ApplicationException("Student is already joined to this course.");
            }

            this.courses.Add(course);

            try
            {
                course.AddStudent(this);
            }
            catch (ApplicationException)
            {
                // Student already is added.
            }
            catch (ArgumentOutOfRangeException)
            {
                this.courses.Remove(course);
                throw;
            }
            catch
            {
                throw;
            }
        }

        public void LeaveCourse(Course course)
        {
            if (course == null)
            {
                throw new ArgumentNullException("Course to leave should not be null.");
            }

            if (this.courses.Contains(course))
            {
                this.courses.Remove(course);
                course.RemoveStudent(this);
            }
        }
    }
}
