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
package org.openurp.qos.evaluation.clazz.model

import org.beangle.data.model.LongId
import org.openurp.edu.clazz.model.Clazz
import org.beangle.data.model.LongId
import org.openurp.qos.evaluation.model.Questionnaire

class QuestionnaireClazz extends LongId {
  /**教学任务*/
  var clazz: Clazz = _

  /**问卷*/
  var questionnaire: Questionnaire = _

  /** 是否教师评教 */
  var evaluateByTeacher: Boolean = _
}