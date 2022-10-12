import actionCable from 'actioncable'

const CableApp = {}
CableApp.cable = actionCable.createConsumer('ws://localhost:3000/cable')

window.CableApp = CableApp
// var componentRequireContext = require.context("components", true);
// var ReactRailsUJS = require("react_ujs");
// ReactRailsUJS.useContext(componentRequireContext);
