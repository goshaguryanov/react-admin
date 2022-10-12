import React from "react"
import styled from "styled-components"
import consumer from "../channels/consumer"
import PropTypes from "prop-types"

const Wrapper = styled.div`
  display: grid;
`;

const Input = styled.input`
  margin: 1em 0 0 0;
`;

const Textarea = styled.textarea`
  margin: 1em 0 0 0;
`;

class PhantomJS extends React.Component {
  constructor(props) {
    super(props);
    this.inputChanged = this.inputChanged.bind(this);
    this.inputKeyPressed = this.inputKeyPressed.bind(this);
    this.createSubscription = this.createSubscription.bind(this);
    this.state = {
      history: '',
      line: ''
    }
  }

  componentDidMount() {
    const consumer = this.createSubscription()
    this.setState(prevState => ({
      ...prevState,
      consumer
    }))
  }

  inputChanged(e) {
    this.setState({
      line: e.target.value
    })
  }

  inputKeyPressed(e) {
    if (e.key === 'Enter') {
      this.state.consumer.send({
        line: this.state.line
      })
      this.setState(prevState => ({
        ...prevState,
        line: ''
      }))
    }
  }

  createSubscription() {
    let self = this;
    return consumer.subscriptions.create("PrivateChannel", {
      connect() {
        console.log("PrivateChannel connect")
      },
      received(data) {
        console.log("PrivateChannel received", data)
        self.setState(prevState => ({
          ...prevState,
          history: `${prevState.history}${data}\n`
        }))
      },
      disconnect() {
        console.log("PrivateChannel disconnect")
      }
    });
  }

  render() {
    return (
      <Wrapper>
        <Input
          onChange={this.inputChanged}
          onKeyDown={this.inputKeyPressed}
          value={this.state.line}
        />
        <Textarea
          rows={20}
          value={this.state.history}
        />
      </Wrapper>
    );
  }
}

export default PhantomJS
