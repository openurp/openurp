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
package org.openurp.code.geo.model

import org.beangle.data.orm.MappingModule

class DefaultMapping extends MappingModule {

  def binding(): Unit = {
    bind[Division].declare { e =>
      e.children is(depends("parent"), orderby("code"))
    }

    bind[Country].declare { e =>
      e.alpha2Code is(length(2), notnull)
      e.alpha3Code is(length(3), notnull)
      e.shortName is (length(50))
    }

    bind[RailwayStation].declare { e =>
      e.jianpin is(length(50), notnull)
    }

    all.cacheAll()
  }

}