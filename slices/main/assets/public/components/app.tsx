import "./app.css";
import { FC } from "react"
import HelloWorld from "./hello_world"
import List from "./list"

const frameworks = [
  { name: "Hanami" },
  { name: "dry-rb" },
  { name: "ROM" },
]

const App: FC = () => {
  return (
    <div className="App">
      <HelloWorld />
      <List data={frameworks} />
    </div>
  );
}

export default App;
