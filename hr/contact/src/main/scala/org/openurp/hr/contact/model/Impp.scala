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
package org.openurp.hr.contact.model

import org.beangle.data.model.LongId

/**
 * 即时消息
 * @see https://tools.ietf.org/html/rfc6350#section-6.4.3
 * @see https://tools.ietf.org/html/rfc4770
 */
class Impp extends LongId with Preferred with Typed with UriType with ContactAware {
  /**
   * Presence Protocol
   *  IMPP;TYPE=personal,pref:im:alice@example.com
   */
  var impp: String = _

}