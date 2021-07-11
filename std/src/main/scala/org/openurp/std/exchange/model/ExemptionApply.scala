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
package org.openurp.std.exchange.model

import org.beangle.data.model.LongId
import org.beangle.data.model.pojo.Updated
import org.openurp.base.edu.AuditStates
import org.openurp.base.edu.model.ExternStudent

/** 免修申请
 *
 */
class ExemptionApply extends LongId with Updated {
  /** 外部学习经历 */
  var externStudent: ExternStudent = _

  /** 成绩单附件路径 */
  var transcriptPath: Option[String] = None

  /** 审核状态 */
  var auditState: AuditStates.State = AuditStates.Draft

  /** 审核意见 */
  var auditOpinion: Option[String] = None

  /** 申请冲抵的外校课程学分总计 */
  var credits: Float = _

  /** 冲抵本校课程的学分总计 */
  var exemptionCredits: Float = _
}