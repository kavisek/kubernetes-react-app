import logo from './logo.svg';
import './App.css';

// const HtmlWebpackPlugin = require('html-webpack-plugin')


export const CONFIG = {
  REACT_APP_ENVIRONMENT: process.env.NODE_ENV,
  REACT_APP_OWNER: process.env.REACT_APP_OWNER
}

console.log("process env");
console.log(process.env)
console.log("process config");
console.log(CONFIG);

function App() {
  return (
    <div className="App">
      <header className="App-header">
        <title> {CONFIG.REACT_APP_ENVIRONMENT}
        </title>
        <img src={logo} className="App-logo" alt="logo" />
        <p>
          Edit <code>src/App.js</code> and save to reload. Running {CONFIG.REACT_APP_ENVIRONMENT} enviroment. Owner is {CONFIG.REACT_APP_OWNER}.
        </p>
        <a
          className="App-link"
          href="https://reactjs.org"
          target="_blank"
          rel="noopener noreferrer"
        >
          Learn React
        </a>
      </header>
    </div>
  );
}

export default App;
