import React, { PureComponent, Fragment } from 'react'
import needDetailsBox from '../containers/need_details_box'
import PlanningDetailsComponent from './planning_details_box'
import ActivityPlanForm from '../containers/activity_plan_form'

class TTANeedPlanner extends PureComponent {
  render() {
    const {
      ttaNeed,
      history
    } = this.props
    if (ttaNeed == null) {
      return (<p>Loading</p>)
    }
    const PlanningDetailsBox = needDetailsBox(PlanningDetailsComponent)
    return (
      <Fragment>
        <h1>TTA Planning</h1>
        <PlanningDetailsBox ttaNeed={ttaNeed} />
        <ActivityPlanForm ttaNeed={ttaNeed} history={history} />
      </Fragment>
    )
  }
}

export default TTANeedPlanner
