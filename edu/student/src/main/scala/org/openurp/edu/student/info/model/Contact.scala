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
package org.openurp.edu.student.info.model

import org.beangle.data.model.LongId
import org.openurp.edu.base.model.Student

/**
 * 联系信息
 */
class Contact extends LongId {

  /**学生*/
  var std: Student = _

  /** 电子邮箱 */
  var mail: Option[String] = None

  /** 电话 */
  var phone: Option[String] = None

  /** 移动电话 */
  var mobile: Option[String] = None

  /** 地址 入校后联系地址 */
  var address: Option[String] = None
}