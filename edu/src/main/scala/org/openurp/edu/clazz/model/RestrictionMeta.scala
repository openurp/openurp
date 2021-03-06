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
package org.openurp.edu.clazz.model

import scala.language.implicitConversions

import org.openurp.base.model.Department
import org.openurp.code.edu.model.EducationLevel
import org.openurp.base.edu.code.model.StdLabel
import org.openurp.base.edu.code.model.StdType
import org.openurp.base.edu.model.Direction
import org.openurp.base.edu.model.Major
import org.openurp.base.edu.model.Squad
import org.beangle.data.model.Entity

object RestrictionMeta extends Enumeration {

  val Grade = new Meta(1, classOf[String])

  val StdType = new Meta(2, classOf[StdType])

  val Department = new Meta(4, classOf[Department])

  val Major = new Meta(5, classOf[Major])

  val Direction = new Meta(6, classOf[Direction])

  val Squad = new Meta(7, classOf[Squad])

  val Level = new Meta(8, classOf[EducationLevel])

  val StdLabel = new Meta(11, classOf[StdLabel])

  class Meta(id: Int, val contentType: Class[_]) extends Val(id) {

    val contentValueType: Class[_] = {
      if (classOf[Entity[_]].isAssignableFrom(contentType)) classOf[Number] else contentType
    }
  }
  implicit def convertValue(v: Value): Meta = v.asInstanceOf[Meta]
}
