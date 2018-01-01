using System;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using System.Collections.Generic;

namespace School.Tests
{

    [TestClass]
    public class CourseTests
    {
        private string courseName = "Mathematics";
        private string studentName = "Pesho Ivanov";

        [TestMethod]
        public void Course_CreateNewInstance_WithValidName_ShouldSucceed()
        {
            Course course = new Course(courseName);
            Assert.AreEqual(courseName, course.Name, "Course name is different.");
        }

        [TestMethod]
        [ExpectedException(typeof(ArgumentNullException))]
        public void Course_CreateNewInstance_WithNullName_ShouldThrow()
        {
            Course course = new Course(null);
        }

        [TestMethod]
        [ExpectedException(typeof(ArgumentNullException))]
        public void Course_CreateNewInstance_WithStringEmptyName_ShouldThrow()
        {
            Course course = new Course(string.Empty);
        }

        [TestMethod]
        [ExpectedException(typeof(ArgumentNullException))]
        public void Course_CreateNewInstance_WithWhitepaceName_ShouldThrow()
        {
            Course course = new Course("  \t \r\n \t\t\t");
        }

        [TestMethod]
        [ExpectedException(typeof(ArgumentNullException))]
        public void Course_AddNullStudent_ShouldThrow()
        {
            Course course = new Course(courseName);
            course.AddStudent(null);
        }

        [TestMethod]
        public void Course_AddValidStudent_ShouldSucceed()
        {
            Course course = new Course(courseName);
            Student student = new Student(studentName);

            course.AddStudent(student);

            Assert.AreEqual(student.Name, course.ListOfStudents[0].Name, "Names mismatch.");
        }

        [TestMethod]
        [ExpectedException(typeof(ApplicationException))]
        public void Course_AddStudentAlreadyAdded_ShouldThrow()
        {
            Course course = new Course(courseName);
            Student student = new Student(studentName);

            course.AddStudent(student);
            course.AddStudent(student);
        }

        [TestMethod]
        public void Course_Add30Students_ShouldSucceed()
        {
            const int N = 30;
            Course course = new Course(courseName);
            List<Student> students = new List<Student>();
            for (int i = 0; i < N; ++i)
            {
                Student student = new Student(studentName + i);
                students.Add(student);
                course.AddStudent(student);
            }

            Assert.AreEqual(N, course.ListOfStudents.Count, "Number of students joined to this course is invalid.");

            foreach (Student student in students)
            {
                Assert.IsTrue(course.ListOfStudents.Contains(student), "List of Joined students does not contain all joined students.");
            }
        }

        [TestMethod]
        public void Course_Add30IdenticalStudents_ShouldSucceed()
        {
            const int N = 30;
            Course course = new Course(courseName);
            List<Student> students = new List<Student>();
            for (int i = 0; i < N; ++i)
            {
                Student student = new Student(studentName);
                students.Add(student);
                course.AddStudent(student);
            }

            Assert.AreEqual(N, course.ListOfStudents.Count, "Number of students joined to this course is invalid.");

            foreach (Student student in students)
            {
                Assert.IsTrue(course.ListOfStudents.Contains(student), "List of Joined students does not contain all joined students.");
            }
        }

        [TestMethod]
        [ExpectedException(typeof(ArgumentOutOfRangeException))]
        public void Course_Add31Students_ShouldThrow()
        {
            const int N = 31;
            Course course = new Course(courseName);
            List<Student> students = new List<Student>();
            for (int i = 0; i < N; ++i)
            {
                Student student = new Student(studentName + i);
                students.Add(student);
                course.AddStudent(student);
            }

            Assert.AreEqual(N, course.ListOfStudents.Count, "Number of students joined to this course is invalid.");

            foreach (Student student in students)
            {
                Assert.IsTrue(course.ListOfStudents.Contains(student), "List of Joined students does not contain all joined students.");
            }
        }

        [TestMethod]
        [ExpectedException(typeof(ArgumentOutOfRangeException))]
        public void Course_AddNGreaterThan30Students_ShouldThrow()
        {
            Random rand = new Random(DateTime.Now.Millisecond);
            int n = 30 + rand.Next(1, 1000000);
            Course course = new Course(courseName);
            List<Student> students = new List<Student>();
            for (int i = 0; i < n; ++i)
            {
                Student student = new Student(studentName + i);
                students.Add(student);
                course.AddStudent(student);
            }

            Assert.AreEqual(n, course.ListOfStudents.Count, "Number of students joined to this course is invalid.");

            foreach (Student student in students)
            {
                Assert.IsTrue(course.ListOfStudents.Contains(student), "List of Joined students does not contain all joined students.");
            }
        }

        [TestMethod]
        [ExpectedException(typeof(ArgumentNullException))]
        public void Course_RemoveNullStudent_ShouldThrow()
        {
            Course course = new Course(courseName);
            Student student = new Student(studentName);
            course.AddStudent(student);
            course.RemoveStudent(null);
        }

        [TestMethod]
        public void Course_RemoveJoinedStudent_ShouldSucceed()
        {
            Course course = new Course(courseName);
            
            Student student1 = new Student(studentName);
            course.AddStudent(student1);

            Student student2 = new Student(studentName);
            course.AddStudent(student2);

            course.RemoveStudent(student1);

            Assert.AreEqual(1, course.ListOfStudents.Count, "Number of joined students shouls be 1.");
            Assert.IsFalse(course.ListOfStudents.Contains(student1), "Student1 should not be here yet.");
            Assert.IsTrue(course.ListOfStudents.Contains(student2), "Student2 should be already joined to this course.");
        }

        [TestMethod]
        public void Course_RemoveNonJoinedStudent_ShouldDoNothing()
        {
            Course course = new Course(courseName);

            Student student1 = new Student(studentName);
            course.AddStudent(student1);

            Student student2 = new Student(studentName);

            course.RemoveStudent(student2);

            Assert.AreEqual(1, course.ListOfStudents.Count, "Number of joined students should be 1.");
            Assert.IsTrue(course.ListOfStudents.Contains(student1), "Course should contain student1.");
            Assert.IsFalse(course.ListOfStudents.Contains(student2), "Course should not contain student2.");
            Assert.AreEqual(1, student1.ListOfCourses.Count, "Student1 should be added to 1 course.");
            Assert.AreEqual(0, student2.ListOfCourses.Count, "Student2 should not be added to any course.");
        }

        [TestMethod]
        public void Course_AlterListOfStudentsProperty_ShouldNotAlterTheListOfAddedStudents()
        {
            Course course = new Course(courseName);
            const int N = 20;
            for (int i = 0; i < N; ++i)
            {
                Student student = new Student(studentName + i);
                course.AddStudent(student);
            }

            course.ListOfStudents.RemoveAt(0);
            course.ListOfStudents.RemoveAt(10);

            int result = course.ListOfStudents.Count;
            Assert.AreEqual(N, result, "Number of added students is " + result + ", not " + N + ".");
        }
    }
}
