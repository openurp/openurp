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
package org.openurp.edu.curricula.model

import org.beangle.data.orm.MappingModule

class DefaultMapping extends MappingModule {

  def binding(): Unit = {
    defaultIdGenerator("auto_increment")

    bind[Syllabus].on(e => declare(
      e.course & e.locale & e.attachment & e.passed & e.updatedAt & e.beginOn are notnull,
      e.contents is depends("section"),
      e.attachment.name is (notnull, length(50)),
      e.attachment.size is (notnull, column("file_size")),
      e.attachment.key is (notnull, length(200))))

    bind[SyllabusSection].on(e => declare(
      e.title & e.syllabus are notnull,
      e.content is length(3900)))

    bind[SyllabusSectionTitle].on(e => declare(
      e.name is (notnull, length(80))))
  }
}