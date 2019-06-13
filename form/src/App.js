import React, {Component} from 'react';
import './App.css';

class App extends Component {

  state = {
    personel: [],
    worker: {
      FirstName: 'Sample',
      SecondName: 'Name',
      WorkTime: '24/7'
    }
  }

  componentDidMount(){
    this.getPersonel();
  }

  getPersonel = _ =>{
    fetch('http://localhost:4000/')
    .then(response => response.json())
    .then(response => this.setState({ personel: response.data}))
    .catch(err => console.error(err))
  }

  addPersonel = _ =>{
    const { worker } = this.state;
    fetch(`http://localhost:4000/add?Name=${worker.FirstName}&sName=${worker.SecondName}&workTime=${worker.WorkTime}`)
    .then(this.getPersonel)
    .catch(err => console.error(err))

  }


 renderPersonel = ({ Id, FirstName, SecondName, WorkTime }) => <div key={Id}>{FirstName}{" "}{SecondName}{" "}{WorkTime}</div>
  
  render() {
    const { personel, worker } = this.state;
    return (

      <div className="App">
      <header className ="App-header">

      {personel.map(this.renderPersonel)}
      <div>
        <input
         value={worker.FirstName}
         onChange={e => this.setState({ worker: {...worker, FirstName:e.target.value}})}
         />
        <input
         value={worker.SecondName} 
         onChange={e => this.setState({ worker: {...worker, SecondName:e.target.value}})}
         />
        <input 
        value={worker.WorkTime} 
        onChange={e => this.setState({ worker: {...worker, WorkTime:e.target.value}})}
        />
        <button onClick={this.addPersonel}>Register Worker</button>
      </div>
      </header>
      </div>
    );
  }
}

export default App;
