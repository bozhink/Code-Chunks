using System;
using Microsoft.VisualStudio.TestTools.UnitTesting;

namespace School.Tests
{
    [TestClass]
    public class StudentTests
    {
        private string courseName = "Mathematics";
        private string studentName = "Pesho Ivanov";

        [TestMethod]
        public void Student_CreateNewInstance_WithValidName_ShouldSucceed()
        {
            Student student = new Student(studentName);
            Assert.AreEqual(studentName, student.Name, "Name mismatch");
        }

        [TestMethod]
        [ExpectedException(typeof(ArgumentNullException))]
        public void Student_CreateNewInstance_WithNullName_ShouldThrow()
        {
            Student student = new Student(null);
        }

        [TestMethod]
        [ExpectedException(typeof(ArgumentNullException))]
        public void Student_CreateNewInstance_WithStringEmptyName_ShouldThrow()
        {
            Student student = new Student(string.Empty);
        }

        [TestMethod]
        [ExpectedException(typeof(ArgumentNullException))]
        public void Student_CreateNewInstance_WithWhitepaceName_ShouldThrow()
        {
            Student student = new Student("  \t \r\n \t\t\t");
        }

        [TestMethod]
        [ExpectedException(typeof(ArgumentNullException))]
        public void Student_JoinNullCourse_ShouldThrow()
        {
            Student student = new Student(studentName);
            student.JoinCourse(null);
        }

        [TestMethod]
        public void Student_JoinValidCourse_WithFreePositions_ShouldSucceed()
        {
            Course course = new Course(courseName);
            Student student = new Student(studentName);

            student.JoinCourse(course);

            Assert.AreEqual(course.Name, student.ListOfCourses[0].Name, "Names mismatch.");
        }

        [TestMethod]
        [ExpectedException(typeof(ArgumentOutOfRangeException))]
        public void Student_JoinValidCourse_WithoutFreePositions_ShouldThow()
        {
            const int FreePositions = 30;
            Course course = new Course(courseName);
            for (int i = 0; i < FreePositions; ++i)
            {
                Student student = new Student(studentName + i);
                student.JoinCourse(course);
            }

            Assert.AreEqual(FreePositions, course.ListOfStudents.Count, "Number of students is invalid.");

            {
                Student student = new Student(studentName);
                student.JoinCourse(course);
            }
        }

        [TestMethod]
        public void Student_JoinValidCourse_ShouldContainItInListOfCourses()
        {
            Course course1 = new Course(courseName + 1);
            Course course2 = new Course(courseName + 2);
            Student student = new Student(studentName);

            student.JoinCourse(course1);
            student.JoinCourse(course2);

            Assert.IsTrue(student.ListOfCourses.Contains(course1), "List of courses should contain course1.");
            Assert.IsTrue(student.ListOfCourses.Contains(course2), "List of courses should contain course2.");
        }

        [TestMethod]
        [ExpectedException(typeof(ApplicationException))]
        public void Student_JoinCourseAlreadyJoined_ShouldThrow()
        {
            Course course = new Course(courseName);
            Student student = new Student(studentName);

            student.JoinCourse(course);
            student.JoinCourse(course);
        }

        [TestMethod]
        public void Student_JoinTwoDifferentButIdenticalCourses_ShouldNotThrow()
        {
            Course course1 = new Course(courseName);
            Course course2 = new Course(courseName);
            Student student = new Student(studentName);

            student.JoinCourse(course1);
            student.JoinCourse(course2);

            Assert.AreEqual(course1, student.ListOfCourses[0]);
        }

        [TestMethod]
        [Ignore]
        public void Student_JoinTwoCourses_ShouldMakesListOfCoursesWithLenghtTwo()
        {
            Course course1 = new Course(courseName + 1);
            Course course2 = new Course(courseName + 2);
            Student student = new Student(studentName);

            student.JoinCourse(course1);
            student.JoinCourse(course2);

            Assert.AreEqual(2, student.ListOfCourses.Count, "Number of joined courses is not 2.");
        }

        [TestMethod]
        public void Student_JoinNCourses_ShouldMakeListOfCoursesWithLenghtN()
        {
            Student student = new Student(studentName);
            const int N = 1000;
            for (int i = 0; i < N; ++i)
            {
                Course course = new Course(courseName + i);
                student.JoinCourse(course);
            }

            int result = student.ListOfCourses.Count;
            Assert.AreEqual(N, result, "Number of joined courses is " + result + ", not " + N + ".");
        }

        [TestMethod]
        public void Student_AlterListOfCoursesProperty_ShouldNotAlterTheListOfJoinedCourses()
        {
            Student student = new Student(studentName);
            const int N = 1000;
            for (int i = 0; i < N; ++i)
            {
                Course course = new Course(courseName + i);
                student.JoinCourse(course);
            }

            student.ListOfCourses.RemoveAt(0);
            student.ListOfCourses.RemoveAt(10);

            int result = student.ListOfCourses.Count;
            Assert.AreEqual(N, result, "Number of joined courses is " + result + ", not " + N + ".");
        }

        [TestMethod]
        [ExpectedException(typeof(ArgumentNullException))]
        public void Student_LeaveNullCourse_ShouldThrow()
        {
            Student student = new Student(studentName);
            student.LeaveCourse(null);
        }

        [TestMethod]
        public void Student_LeaveJoinedCourse_ShouldSucceed()
        {
            Course course1 = new Course(courseName);
            Course course2 = new Course(courseName);
            Student student = new Student(studentName);

            student.JoinCourse(course1);
            student.JoinCourse(course2);

            student.LeaveCourse(course1);

            Assert.AreEqual(1, student.ListOfCourses.Count, "Count of joined courses should be 1.");
            Assert.IsFalse(student.ListOfCourses.Contains(course1), "List of joined courses should not contain course1.");
            Assert.IsTrue(student.ListOfCourses.Contains(course2), "List of joined courses should contain course2.");
        }

        [TestMethod]
        public void Student_LeaveNonJoinedCourse_ShouldDoNothing()
        {
            Course course1 = new Course(courseName + 1);
            Course course2 = new Course(courseName + 2);
            Student student = new Student(studentName);

            student.JoinCourse(course2);
            student.LeaveCourse(course1);

            Assert.AreEqual(1, student.ListOfCourses.Count, "Number of joined courses should be 1.");
            Assert.IsTrue(student.ListOfCourses.Contains(course2), "List of joined courses should contain course2.");
            Assert.IsFalse(student.ListOfCourses.Contains(course1), "List of joined courses should not contain course1.");
            Assert.AreEqual(1, course2.ListOfStudents.Count, "Course2 should contain 1 student.");
            Assert.AreEqual(0, course1.ListOfStudents.Count, "Course1 should not contain any student.");
        }

        [TestMethod]
        [ExpectedException(typeof(ArgumentOutOfRangeException))]
        public void Student_CreateTooManyStudents_WithValidNames_ShouldThrow()
        {
            for (int i = 0; i < 1000000; ++i)
            {
                Student student = new Student(studentName);
            }
        }
    }
}
