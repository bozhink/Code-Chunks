namespace School
{
    using System;
    using System.Collections.Generic;
    using System.Linq;

    public class School
    {
        private ICollection<Course> listOfCourses;
        private ICollection<Student> listOfStudents;

        private string name;

        /// <summary>
        /// Initializes a new instance of School.School class with name 'name'.
        /// </summary>
        /// <param name="name">The name of the school.</param>
        /// <exception cref="System.ArgumentNullException">Name of school is invalid.</exception>
        public School(string name)
        {
            this.Name = name;
            this.listOfCourses = new List<Course>();
            this.listOfStudents = new List<Student>();
        }

        /// <summary>
        /// Gets the name of the school.
        /// </summary>
        /// <exception cref="System.ArgumentNullException">Name of school is invalid.</exception>
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
                    throw new ArgumentNullException("Name of school is invalid.");
                }

                this.name = value;
            }
        }

        /// <summary>
        /// Gets the list of courses in the school.
        /// </summary>
        public List<Course> ListOfCourses
        {
            get
            {
                return this.listOfCourses.Select(s => s).ToList<Course>();
            }
        }

        /// <summary>
        /// Gets the list od students in the school.
        /// </summary>
        public List<Student> ListOfStudents
        {
            get
            {
                return this.listOfStudents.Select(s => s).ToList<Student>();
            }
        }

        /// <summary>
        /// Adds a new course to thee school.
        /// </summary>
        /// <param name="course">Course to be added.</param>
        /// <exception cref="System.ArgumentNullException">Course should not be null.</exception>
        /// <exception cref="System.ApplicationException">This course is already added to the school.</exception>
        public void AddCourse(Course course)
        {
            if (course == null)
            {
                throw new ArgumentNullException("Course should not be null.");
            }

            if (this.listOfCourses.Contains(course))
            {
                throw new ApplicationException("This course is already added to the school.");
            }

            this.listOfCourses.Add(course);
        }

        /// <summary>
        /// Remove a course.
        /// </summary>
        /// <param name="course">Course to be removed.</param>
        /// <exception cref="System.ArgumentNullException">Course should not be null.</exception>
        public void RemoveCourse(Course course)
        {
            if (course == null)
            {
                throw new System.ArgumentNullException("Course should not be null.");
            }

            if (this.listOfCourses.Contains(course))
            {
                foreach (Student student in this.listOfStudents)
                {
                    student.LeaveCourse(course);
                }

                this.listOfCourses.Remove(course);
            }
        }

        /// <summary>
        /// Add a stusent to the school.
        /// </summary>
        /// <param name="student">Student to be added.</param>
        /// <exception cref="System.ArgumentNullException">Student should not be null.</exception>
        /// <exception cref="System.ApplicationException">Student already is in this school.</exception>
        public void AddStudent(Student student)
        {
            if (student == null)
            {
                throw new ArgumentNullException("Student should not be null.");
            }

            if (this.listOfStudents.Contains(student))
            {
                throw new ApplicationException("Student already is in this school.");
            }

            this.listOfStudents.Add(student);
        }

        /// <summary>
        /// Remove a student from the school.
        /// </summary>
        /// <param name="student">Student to be removed.</param>
        /// <exception cref="System.ArgumentNullException">Student should not be null.</exception>
        public void RemoveStudent(Student student)
        {
            if (student == null)
            {
                throw new ArgumentNullException("Student should not be null.");
            }

            if (this.listOfStudents.Contains(student))
            {
                foreach (Course course in this.listOfCourses)
                {
                    course.RemoveStudent(student);
                }

                this.listOfStudents.Remove(student);
            }
        }
    }
}
