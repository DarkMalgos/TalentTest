import React from 'react';
import './App.css';

class App extends React.Component {

  constructor(props) {
    super(props);
    this.state = {
      squares: [
        "grey",
        "grey",
        "grey",
        "grey",
        "grey",
        "grey",
        "grey",
        "grey",
        "grey",
        "grey",
      ],
      index: 9
   };
  }

  chooseColor(color) {
    let newList = this.state.squares
    newList.splice(this.state.index, 1, color)
    this.setState({
      squares: newList,
      index: this.state.index - 1 === -1 ? 9 : this.state.index - 1
    })
  }

  render() {
    let colorList = this.state.squares.map((color, index) =>
      <div className="square" style={{backgroundColor: color}} key={index}>
      </div>
    )
    return (
      <div className="App">
        <div className="row">
          <button style={{backgroundColor: "red"}} onClick={() => this.chooseColor("red")}>
            <p>red</p>
          </button>
          <button style={{backgroundColor: "blue"}} onClick={() => this.chooseColor("blue")}>
            <p>blue</p>
          </button>
        </div>
        <div className="row">
          { colorList }
        </div>
        <div className="row">
          <button style={{backgroundColor: "yellow"}} onClick={() => this.chooseColor("yellow")}>
            <p>yellow</p>
          </button>
          <button style={{backgroundColor: "green"}} onClick={() => this.chooseColor("green")}>
            <p>green</p>
          </button>
        </div>
      </div>
    );
  }
}

export default App;
