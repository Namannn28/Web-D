To create data that actually triggers a UI update when it changes, we use State. The useState Hook is the built-in React function that lets you add local state memory to your functional components.

1. The Anatomy of useState
To use it, you first import it from the React core library. When you call useState(), it returns an array containing exactly two items:

The current state value: The live value stored in memory.

The setter function: A special function used to update that value and tell React to re-render the UI.

JavaScript
import { useState } from 'react';

// Using JavaScript array destructuring to grab both items:
const [state, setState] = useState(initialValue);
2. A Practical Example: The Counter
Let's look at a straightforward example: a classic button counter.

JavaScript
import { useState } from 'react';

export default function Counter() {
  // 1. Initialize count at 0
  const [count, setCount] = useState(0);

  function handleIncrement() {
    // 2. Update state using the setter function
    setCount(count + 1); 
  }

  return (
    <div style={{ padding: '20px', textAlign: 'center' }}>
      <h3>You clicked {count} times</h3>
      
      {/* 3. Wire up the event handler */}
      <button onClick={handleIncrement}>
        Click Me
      </button>
    </div>
  );
}
What happens under the hood when you click the button?
The onClick event fires and triggers handleIncrement().

setCount(count + 1) is called, scheduling an update to change count from 0 to 1.

React re-runs (re-renders) the Counter function.

The line const [count, setCount] = useState(0) runs again, but this time React remembers the state was updated, so it sets count to 1.

The return block updates the virtual DOM, changing the text on the screen cleanly.

3. Important Rules to Remember
⚠️ Never Modify State Directly
Never do this: count = count + 1. React relies on the setter function (setCount) to know when to update the screen. If you change the variable directly, the UI will stay exactly the same.

🔄 State is Isolated and Private
If you render three <Counter/> components on a single screen, each individual counter gets its own completely isolated memory. Clicking one won't affect the other two.

📦 Updating Arrays and Objects in State
When your state is an object or an array, you must pass a completely new object/array to the setter function. You cannot modify the original array directly.

JavaScript
// Working with an Array in state
const [items, setItems] = useState(['Apple', 'Banana']);

function addItem() {
  // Use the JavaScript spread operator (...) to make a copy, then append the new item
  setItems([...items, 'Orange']); 
}