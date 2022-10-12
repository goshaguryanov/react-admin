import consumer from "../channels/consumer"
import React, { Component } from 'react'

class WS extends Component {
  constructor(props) {
    super(props);
    this.createSubscription = this.createSubscription.bind(this);
  }

  createSubscription() {
    consumer.subscriptions.create("PrivateChannel", {
      connect() {
        console.log("PrivateChannel connect")
      },
      received(data) {
        console.log("PrivateChannel received", data)
      },
      disconnect() {
        console.log("PrivateChannel disconnect")
      }
    });

    consumer.subscriptions.create(
      {
        channel: "SharedChannel"
      },
      {
        connect() {
          console.log("SharedChannel connect")
        },
        received(data) {
          console.log("SharedChannel received", data)
        },
        disconnect() {
          console.log("SharedChannel disconnect")
        }
      }
    )
  }
  componentDidMount() {
    console.log('CLI.componentDidMount')
    window.WS = this;
  }

  componentWillUnmount() {
    window.WS = undefined;
  }


  render() {
    return (
      <div>WS</div>
    );
  }
}
export default WS;
