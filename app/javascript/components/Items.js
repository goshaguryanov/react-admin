import React, { Component } from 'react'


class Items extends Component {
  constructor(props) {
    super(props);
    this.state = {
      collection: []
    }
    this.getCollection = this.getCollection.bind(this);
    this.onFetch = this.onFetch.bind(this);
    this.headers = this.headers.bind(this);
  }

  componentWillMount() {
    this.getCollection();
  }

  getCollection() {
    fetch(this.props.fetch_url).
      then(resp => resp.json()).
      then(this.onFetch)
  }

  onFetch(data) {
    const collection = data.map(item => {
      const {
        id,
        payload,
        created_at,
        updated_at
      } = item

      return {
        id,
        payload: JSON.stringify(payload)
      }
    })
    this.setState({
      collection: collection
    })
  }

  headers() {
    const { columns } = this.props;
    return columns.map(column => ({
      Header: column,
      accessor: column
    }))
  }

  render() {
    const {
      data
    } = this.props;
    const {
      collection
    } = this.state;


    return (
      <Table columns={this.headers()} data={collection} />
    )
  }
}

export default Items;
