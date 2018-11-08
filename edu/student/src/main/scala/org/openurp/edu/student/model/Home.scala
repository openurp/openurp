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
package org.openurp.edu.student.model

import org.openurp.edu.base.model.Student
import org.beangle.data.model.LongId
import org.openurp.code.geo.model.RailwayStation

/**
 * 家庭信息
 */
class Home extends LongId {

  /**学生*/
  var std: Student = _

  /** 家庭电话 */
  var phone: Option[String] = None

  /** 家庭地址 */
  var address: Option[String] = None

  /** 家庭地址邮编 */
  var postcode: Option[String] = None

  /** 户籍 */
  var formerAddr: Option[String] = None

  /** 派出所 */
  var police: Option[String] = None

  /** 派出所电话 */
  var policePhone: Option[String] = None

  /** 火车站 用于打印学生证 */
  var railwayStation: Option[RailwayStation] = None
}
