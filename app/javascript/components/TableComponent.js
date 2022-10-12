import React from "react"
import PropTypes from "prop-types"
import Table from "./Table"

class TableComponent extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      collection: []
    }
    this.getCollection = this.getCollection.bind(this);
    this.onFetch = this.onFetch.bind(this);
    this.headers = this.headers.bind(this);
  }

  getCollection() {
    fetch(this.props.fetch_url).
      then(resp => resp.json()).
      then(this.onFetch)
  }

  componentDidMount() {
    this.getCollection()
  }

  onFetch(collection) {
    this.setState({ collection })
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
      collection
    } = this.state;

    return (
      <Table
        columns={this.headers()}
        data={collection}
      />
    );
  }
}

TableComponent.propTypes = {
  columns: PropTypes.array,
  fetch_url: PropTypes.string
};
export default TableComponent
