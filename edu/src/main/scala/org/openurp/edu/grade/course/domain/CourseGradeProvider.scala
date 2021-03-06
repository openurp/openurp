/*
 * OpenURP, Agile University Resource Planning Solution.
 *
 * Copyright © 2014, The OpenURP Software.
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful.
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */
package org.openurp.edu.grade.course.domain

import org.openurp.base.edu.model.Semester
import org.openurp.base.edu.model.Student
import org.openurp.edu.grade.course.model.CourseGrade

trait CourseGradeProvider {

  /**
   * 查询学生发布的成绩
   *
   * @param std
   * @param semesters
   * @return
   */
  def getPublished(std: Student, semesters: Semester*): collection.Seq[CourseGrade]

  /**
   * 查询学生所有成绩
   *
   * @param std
   * @param semesters
   * @return
   */
  def getAll(std: Student, semesters: Semester*): collection.Seq[CourseGrade]

  /**
   * 查询一批学生发布的成绩
   *
   * @param stds
   * @param semesters
   * @return
   */
  def getPublished(stds: Iterable[Student], semesters: Semester*): collection.Map[Student, collection.Seq[CourseGrade]]
  /**
   * 查询一批学生所有成绩
   *
   * @param stds
   * @param semesters
   * @return
   */
  def getAll(stds: Iterable[Student], semesters: Semester*): collection.Map[Student, collection.Seq[CourseGrade]]

  /**
   * 查看学生各个课程的通过状态
   *
   * @param std
   * @return
   */
  def getPassedStatus(std: Student): collection.Map[Long, Boolean]
}
