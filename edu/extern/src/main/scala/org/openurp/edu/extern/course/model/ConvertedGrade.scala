/*
 * OpenURP, Agile University Resource Planning Solution.
 *
 * Copyright © 2005, The OpenURP Software.
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU Lesser General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */
package org.openurp.edu.extern.course.model

import org.beangle.data.model.LongId
import org.openurp.edu.base.model.Student
import org.openurp.edu.base.model.Semester
import org.openurp.edu.base.model.Course
import scala.collection.mutable.ListBuffer
import scala.collection.mutable.Buffer

/**
 * 转换成我校后的成绩
 */
class ConvertedGrade extends LongId {
  var semester: Semester = _

  var std: Student = _

  var course: Course = _

  var score: Option[Float] = _

  var scoreText: String = _

  var passed: Boolean = _

  var gp: Option[Float] = None

  var sources: Buffer[ExternGrade] = new ListBuffer[ExternGrade]
}
