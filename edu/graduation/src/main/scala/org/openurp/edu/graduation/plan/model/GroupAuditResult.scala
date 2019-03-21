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
package org.openurp.edu.graduation.plan.model

import scala.collection.mutable.Buffer

import org.beangle.data.model.LongId
import org.beangle.data.model.pojo.{ Hierarchical, Named }
import org.openurp.edu.base.code.model.CourseType
import org.openurp.edu.base.model.Course
import org.openurp.edu.graduation.plan.domain.GroupResultAdapter
import org.openurp.edu.program.plan.model.CourseGroup

object GroupAuditResult {

  def checkPassed(groupResult: GroupAuditResult, isRecursive: Boolean) {
    if (null == groupResult) {
      return
    }
    var childrenPassed = true
    if (!groupResult.children.isEmpty) {
      val requiredNum = if (groupResult.subCount >= 0) groupResult.subCount else groupResult.children.size
      var passed = 0
      for (childResult <- groupResult.children if !childResult.passed) {
        passed += 1
      }
      childrenPassed = (passed >= requiredNum)
    }
    groupResult.passed = childrenPassed && groupResult.auditStat.passed
    if (isRecursive) {
      groupResult.parent match {
        case None => checkPassed(new GroupResultAdapter(groupResult.planResult), false)
        case Some(p) => checkPassed(p, true)
      }
    }
  }
}

class GroupAuditResult extends LongId with Named with Hierarchical[GroupAuditResult] {

  var auditStat = new AuditStat

  var courseResults: Buffer[CourseAuditResult] = new collection.mutable.ListBuffer[CourseAuditResult]

  var courseType: CourseType = _

  var passed: Boolean = _

  var subCount: Short = _

  var planResult: PlanAuditResult = _

  def attachTo(pl: PlanAuditResult) {
    planResult = pl
    planResult.groupResults += this
    for (groupResult <- children) {
      groupResult.attachTo(planResult)
    }
  }

  def detach() {
    if (null != planResult) planResult.groupResults -= this
    planResult = null
    for (groupResult <- children) groupResult.detach
  }

  def this(group: CourseGroup) {
    this
    this.name = group.name
    this.courseType = group.courseType
  }

  def SuperResult: GroupAuditResult = {
    if ((null != planResult)) new GroupResultAdapter(planResult) else null
  }

  def addCourseResult(courseResult: CourseAuditResult) {
    courseResult.groupResult = this
    courseResults += courseResult
    if (courseResult.passed) {
      addPassedCourse(this, courseResult.course)
    }
  }

  def updateCourseResult(rs: CourseAuditResult) {
    if (rs.passed) addPassedCourse(rs.groupResult, rs.course)
  }

  private def addPassedCourse(groupResult: GroupAuditResult, course: Course) {
    if (null == groupResult) {
      return
    }
    val auditStat = groupResult.auditStat
    if (!auditStat.passedCourses.contains(course)) {
      auditStat.passedCourses.add(course)
      auditStat.addCredits(course.credits)
      auditStat.addNum(1)
    }
    groupResult.parent match {
      case None =>
        val planAuditStat = groupResult.planResult.auditStat
        if (!planAuditStat.passedCourses.contains(course)) {
          planAuditStat.passedCourses.add(course)
          planAuditStat.addCredits(course.credits)
          planAuditStat.addNum(1)
        }
      case Some(p) => addPassedCourse(p, course)
    }
  }

  def addChild(gr: GroupAuditResult) {
    gr.parent = Some(this)
    this.children += gr
  }

  def removeChild(gr: GroupAuditResult) {
    gr.parent = null
    this.children -= gr
  }

  def checkPassed(isRecursive: Boolean) {
    GroupAuditResult.checkPassed(this, isRecursive)
  }
}