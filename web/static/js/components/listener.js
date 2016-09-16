import React from 'react';
// import _ from 'lodash';
import _ from 'underscore';

export default class Listener extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      data: {
        room: "lobby"
      }
    };
    // _.bindAll(this, 'queueRender');
  }

  componentDidMount() {
    // raf(this.queueRender);
    this.subscribe();
  }

  componentWillUnmount() {
    this.unsubscribe();
    // raf.cancel(this.queueRender);
  }

  subscribe() {
    console.log("subscribe");
    this.unsubscribe();
    // this.channelUnsub = DataSocket.subscribe(channel, function() {});
  }

  unsubscribe() {
    console.log("unsubscribe");
    if (this.channelUnsub) this.channelUnsub();
  }

  render() {
      const { data } = this.state;
      if (data) {
        return this.props.children(data);
      } else {
        return <div>Loading...</div>;
      }
    }
}
