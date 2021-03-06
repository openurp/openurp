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
package org.openurp.std.transfer.model

import java.time.Instant

import org.beangle.commons.collection.Collections
import org.beangle.data.model.LongId
import org.beangle.data.model.pojo.{Named, Updated}
import org.openurp.base.edu.model.{Project, Semester}

import scala.collection.mutable

/** 转专业招生计划
 *
 */
class TransferScheme extends LongId with Named with Updated {

  /** 项目 */
  var project: Project = _
  /** 学年学期 */
  var semester: Semester = _

  /** 申请开始时间 */
  var applyBeginAt: Instant = _
  /** 申请结束时间 */
  var applyEndAt: Instant = _

  /** 院系编辑计划开始时间 */
  var editBeginAt: Instant = _
  /** 院系编辑计划结束时间 */
  var editEndAt: Instant = _

  /** 院系审核申请开始时间 */
  var auditBeginAt: Instant = _
  /** 院系审核申请结束时间 */
  var auditEndAt: Instant = _

  /** 招生专业列表 */
  var options: mutable.Buffer[TransferOption] = Collections.newBuffer[TransferOption]

  /** 招生学生范围 */
  var scopes: mutable.Buffer[TransferScope] = Collections.newBuffer[TransferScope]

  /** 附件路径 */
  var noticePath: Option[String] = None

  /** 发布招生方案 */
  var published: Boolean = _

  def canApply(): Boolean = {
    val now = Instant.now
    !(this.applyBeginAt.isAfter(now) || this.applyEndAt.isBefore(now))
  }
}
