/*
 * OpenURP, Agile University Resource Planning Solution
 *
 * Copyright (c) 2014-2015, OpenURP Software.
 *
 * OpenURP is free software: you can redistribute it and/or modify
 * it under the terms of the GNU Lesser General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * OpenURP is distributed in the hope that it will be useful.
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with OpenURP.  If not, see <http://www.gnu.org/licenses/>.
 */
package org.openurp.sin.harvest.model

import java.sql.Date

import org.beangle.data.model.{ IntId, Named }

class PublishedSituation extends IntId with Named {

  var enName: String = _

  var isbn: String = _

  var issn: String = _

  var position: String = _

  var cn: String = _

  var publishedDate: Date = _

  var harvestType: HarvestType = _

  var publishedRange: PublishedRange = _

  var translated: Boolean = false

}