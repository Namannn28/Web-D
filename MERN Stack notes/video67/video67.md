Handling user events (like button clicks, form submissions, and keystrokes) is what makes your React applications interactive.While React events feel a lot like standard HTML event listeners, they have a few crucial differences under the hood that make them cleaner, faster, and cross-browser compatible.1. The Core Rules of React EventsCamelCase Naming: In plain HTML, you write onclick. In React, you use camelCase, so it becomes onClick, onChange, onSubmit, or onKeyDown.Pass Functions, Don't Invoke Them: Instead of passing a string template or invoking the function directly, you pass the actual function reference inside curly braces {}.❌ The Wrong Way:JavaScript// This calls the function IMMEDIATELY when the page renders, not when clicked!
<button onClick={handleClick()}>Click Me</button>
The Right Way:JavaScript// This passes the function reference so React calls it ONLY upon click
<button onClick={handleClick}>Click Me</button>
2. Common Event Handling ScenariosA. Simple Click Event HandlerFor simple interactions, define a function right inside your component block and point to it.JavaScriptexport default function AlertButton() {
  function handleButtonClick() {
    alert("Button was clicked!");
  }

  return (
    <button onClick={handleButtonClick}>
      Trigger Alert
    </button>
  );
}
B. Passing Arguments to HandlersWhat if you need to pass a specific piece of data (like a user ID or string) to your handler function? You wrap the function call inside an anonymous arrow function.JavaScriptexport default function UserGreeting() {
  function sayHello(name) {
    alert(`Hello, ${name}!`);
  }

  return (
    // We wrap it in an arrow function so it runs only on the click action
    <button onClick={() => sayHello("Naman")}>
      Greet Me
    </button>
  );
}
C. Reading the Event Object (e)Every event handler automatically receives a special SyntheticEvent object as its first argument. This is React's cross-browser wrapper around native browser events. We use it to read values from inputs or prevent default submission behaviors.JavaScriptimport { useState } from 'react';

export default function SearchForm() {
  const [text, setText] = useState('');

  function handleSubmit(e) {
    // Prevent the browser from refreshing the entire page on form submit
    e.preventDefault(); 
    console.log("Form Submitted with text:", text);
  }

  return (
    <form onSubmit={handleSubmit}>
      <input 
        type="text" 
        value={text} 
        // Read the typed character value via e.target.value
        onChange={(e) => setText(e.target.value)} 
        placeholder="Type something..."
      />
      <button type="submit">Submit</button>
    </form>
  );
}
3. Top 4 Event Handlers You'll Use DailyEvent NameCommon Target ElementsPrimary Use CaseonClick<button>, <a>, <div>Tracking basic user click interactions.onChange<input>, <textarea>, <select>Syncing user form inputs with component useState.onSubmit<form>Capturing entire forms and stopping default page reloads (e.preventDefault()).onKeyDownWindow or global structural tagsCatching specific hotkeys (like tracking if the user pressed Enter or Escape).