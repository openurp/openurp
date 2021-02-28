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
package org.openurp.std.info.model

import org.beangle.data.model.LongId
import org.beangle.data.model.pojo.Updated
import org.openurp.base.edu.model.Student
import org.openurp.code.edu.model.DisciplineCatalog

/** 辅修学生信息
 *
 */
class Minor extends LongId with Updated {

  /** 学生 */
  var std: Student = _

  /** 主修学校 */
  var school: MinorSchool = _

  /** 主修专业 */
  var majorName: String = _

  /** 主修专业英文名 */
  var enMajorName: Option[String] = None

  /** 主修专业学科门类 */
  var majorCatalog: DisciplineCatalog = _
}