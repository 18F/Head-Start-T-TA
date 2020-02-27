import { buildApi, get, post } from 'redux-bees'
import camelcaseKeys from 'camelcase-keys'

const apiEndpoints = {
  getMonitoringReport: { method: get, path: "/monitoring_reports/:id" }
}

const config = {
  baseUrl: window.location.origin,
  afterResolve({status, headers, body}) {
    return Promise.resolve({status, headers, body: camelcaseKeys(body, {deep: true})})
  },
  configureHeaders(headers) {
    return {
      ...headers,
      "X-CSRF-Token": document.querySelector('meta[name="csrf-token"]').content
    }
  }
}

export default buildApi(apiEndpoints, config)
