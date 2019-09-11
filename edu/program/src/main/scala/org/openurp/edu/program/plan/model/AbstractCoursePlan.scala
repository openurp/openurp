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
package org.openurp.edu.program.plan.model

import org.beangle.data.model.LongId
import org.beangle.data.model.pojo.{Remark, TemporalOn, Updated}
import org.openurp.edu.base.States
import org.openurp.edu.base.code.model.CourseType

import scala.collection.mutable.{Buffer, ListBuffer}

/**
 * 抽象课程方案
 *
 * @author chaostone
 * @since 2009
 */
trait AbstractCoursePlan extends LongId with CoursePlan with Updated with TemporalOn with Remark {

  /**
   * 课程组
   */
  var groups: Buffer[CourseGroup] = new ListBuffer[CourseGroup]

  /**
   * 要求学分
   */
  var credits: Float = _

  /**
   * 起始学期
   */
  var startTerm: Short = _

  /**
   * 结束学期
   */
  var endTerm: Short = _

  /**
   * 审核状态
   */
  var state: States.State = States.Draft

  def terms: Short = (endTerm - startTerm + 1).asInstanceOf[Short]

  def addGroup(group: CourseGroup): Unit = {
    groups += group
  }

  override def tops: collection.Seq[CourseGroup] = {
    val res = new ListBuffer[CourseGroup]
    for (group <- groups if group.parent == null) res += group
    res
  }

  override def group(courseType: CourseType): CourseGroup = {
    groups.find(_.courseType == courseType).orNull
  }
}
