import React, { Component } from 'react'

export default class CLI extends Component {
  constructor(props) {
    super(props);
    this.write = this.write.bind(this);
    this.state = {
      lines: []
    }
  }

  componentDidMount() {
    console.log('CLI.componentDidMount')
    window.CLI = this;
  }

  componentWillUnmount() {
    window.CLI = undefined;
  }

  write(string) {
    this.setState(prevState => ({
      lines: [
        ...prevState.lines,
        string
      ]
    }))
  }

  render() {
    const { lines } = this.state;
    const { greeting } = this.props;

    return (
      <ul>
        {lines.map(line =>
          <li>{greeting} {line}</li>
          )}
      </ul>
    )
  }
}
