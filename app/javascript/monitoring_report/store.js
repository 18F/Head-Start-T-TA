import thunkMiddleware from 'redux-thunk'
import { createLogger } from 'redux-logger'
import { middleware as beesMiddleware } from 'redux-bees'
import { createStore, applyMiddleware } from 'redux'
import reducers from './reducers'
import ttaNeedInitialState from 'tta_need/store'

const initialState = {
  ...ttaNeedInitialState,
  app: {
    formOpen: false,
    showSuccess: false
  },
  report: {
    id: ""
  }
}

export default createStore(
  reducers,
  initialState,
  applyMiddleware(
    thunkMiddleware,
    createLogger(),
    beesMiddleware()
  )
)
