using System;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using School;

namespace School.Tests
{
    [TestClass]
    public class SchoolTests
    {
        private string courseName = "Mathematics";
        private string studentName = "Pesho Ivanov";
        private string schoolName = "School";

        [TestMethod]
        public void School_CreateNewInstance_WithValidName_ShouldSucceed()
        {
            School school = new School(courseName);
            Assert.AreEqual(courseName, school.Name, "School name is different.");
        }

        [TestMethod]
        [ExpectedException(typeof(ArgumentNullException))]
        public void School_CreateNewInstance_WithNullName_ShouldThrow()
        {
            School school = new School(null);
        }

        [TestMethod]
        [ExpectedException(typeof(ArgumentNullException))]
        public void School_CreateNewInstance_WithStringEmptyName_ShouldThrow()
        {
            School school = new School(string.Empty);
        }

        [TestMethod]
        [ExpectedException(typeof(ArgumentNullException))]
        public void School_CreateNewInstance_WithWhitepaceName_ShouldThrow()
        {
            School school = new School("  \t \r\n \t\t\t");
        }

        [TestMethod]
        [ExpectedException(typeof(ArgumentNullException))]
        public void School_AddNullCourse_ShouldThrow()
        {
            School school = new School(schoolName);
            school.AddCourse(null);
        }

        [TestMethod]
        public void School_AddValidCourse_ShouldSucceed()
        {
            School school = new School(schoolName);
            Course course = new Course(courseName);
            school.AddCourse(course);
            Assert.AreEqual(1, school.ListOfCourses.Count, "Number of courses should be 1.");
            Assert.IsTrue(school.ListOfCourses.Contains(course), "School should contain course.");
        }

        [TestMethod]
        [ExpectedException(typeof(ApplicationException))]
        public void School_AddValidCourse2Times_ShouldThrow()
        {
            School school = new School(schoolName);
            Course course = new Course(courseName);
            school.AddCourse(course);
            school.AddCourse(course);
        }

        [TestMethod]
        [ExpectedException(typeof(ArgumentNullException))]
        public void School_RemoveNullCourse_ShouldThrow()
        {
            School school = new School(schoolName);
            school.RemoveCourse(null);
        }

        [TestMethod]
        public void School_RemoveValidCourse_SchouldSucceed()
        {
            School school = new School(schoolName);
            
            Course course1 = new Course(courseName + 1);
            school.AddCourse(course1);
            
            Course course2 = new Course(courseName + 2);
            school.AddCourse(course2);

            school.RemoveCourse(course2);

            Assert.AreEqual(1, school.ListOfCourses.Count, "Number of courses in the school should be 1.");
            Assert.IsTrue(school.ListOfCourses.Contains(course1), "School should contain course1.");
            Assert.IsFalse(school.ListOfCourses.Contains(course2), "School should not contain course2.");
        }

        [TestMethod]
        public void School_RemoveNonAddedCourse_ShouldDoNothing()
        {
            School school = new School(schoolName);

            Course course1 = new Course(courseName + 1);
            school.AddCourse(course1);

            Course course2 = new Course(courseName + 2);

            school.RemoveCourse(course2);

            Assert.AreEqual(1, school.ListOfCourses.Count, "Number of courses in the school should be 1.");
            Assert.IsTrue(school.ListOfCourses.Contains(course1), "School should contain course1.");
            Assert.IsFalse(school.ListOfCourses.Contains(course2), "School should not contain course2.");
        }

        [TestMethod]
        public void School_Remove2TimesValidCourse_SchouldSucceed()
        {
            School school = new School(schoolName);

            Course course1 = new Course(courseName + 1);
            school.AddCourse(course1);

            Course course2 = new Course(courseName + 2);
            school.AddCourse(course2);

            school.RemoveCourse(course2);
            school.RemoveCourse(course2);

            Assert.AreEqual(1, school.ListOfCourses.Count, "Number of courses in the school should be 1.");
            Assert.IsTrue(school.ListOfCourses.Contains(course1), "School should contain course1.");
            Assert.IsFalse(school.ListOfCourses.Contains(course2), "School should not contain course2.");
        }

        [TestMethod]
        [ExpectedException(typeof(ArgumentNullException))]
        public void School_AddNullStudent_ShouldThrow()
        {
            School school = new School(schoolName);
            school.AddStudent(null);
        }

        [TestMethod]
        public void School_AddValidStudent_ShouldSucceed()
        {
            School school = new School(schoolName);
            Student student = new Student(studentName);
            school.AddStudent(student);
            Assert.AreEqual(1, school.ListOfStudents.Count, "Number of students should be 1.");
            Assert.IsTrue(school.ListOfStudents.Contains(student), "School should contain student.");
        }

        [TestMethod]
        [ExpectedException(typeof(ApplicationException))]
        public void School_AddValidStudent2Times_ShouldThrow()
        {
            School school = new School(schoolName);
            Student student = new Student(studentName);
            school.AddStudent(student);
            school.AddStudent(student);
        }

        [TestMethod]
        [ExpectedException(typeof(ArgumentNullException))]
        public void School_RemoveNullStudent_ShouldThrow()
        {
            School school = new School(schoolName);
            school.RemoveStudent(null);
        }

        [TestMethod]
        public void School_RemoveValidStudent_SchouldSucceed()
        {
            School school = new School(schoolName);

            Student student1 = new Student(studentName + 1);
            school.AddStudent(student1);

            Student student2 = new Student(studentName + 2);
            school.AddStudent(student2);

            school.RemoveStudent(student2);

            Assert.AreEqual(1, school.ListOfStudents.Count, "Number of students in the school should be 1.");
            Assert.IsTrue(school.ListOfStudents.Contains(student1), "School should contain student1.");
            Assert.IsFalse(school.ListOfStudents.Contains(student2), "School should not contain student2.");
        }

        [TestMethod]
        public void School_RemoveNonAddedStudent_ShouldDoNothing()
        {
            School school = new School(schoolName);

            Student student1 = new Student(studentName + 1);
            school.AddStudent(student1);

            Student student2 = new Student(studentName + 2);

            school.RemoveStudent(student2);

            Assert.AreEqual(1, school.ListOfStudents.Count, "Number of students in the school should be 1.");
            Assert.IsTrue(school.ListOfStudents.Contains(student1), "School should contain student1.");
            Assert.IsFalse(school.ListOfStudents.Contains(student2), "School should not contain student2.");
        }

        [TestMethod]
        public void School_Remove2TimesValidStudent_SchouldSucceed()
        {
            School school = new School(schoolName);

            Student student1 = new Student(studentName + 1);
            school.AddStudent(student1);

            Student student2 = new Student(studentName + 2);
            school.AddStudent(student2);

            school.RemoveStudent(student2);
            school.RemoveStudent(student2);

            Assert.AreEqual(1, school.ListOfStudents.Count, "Number of students in the school should be 1.");
            Assert.IsTrue(school.ListOfStudents.Contains(student1), "School should contain student1.");
            Assert.IsFalse(school.ListOfStudents.Contains(student2), "School should not contain student2.");
        }
    }
}
