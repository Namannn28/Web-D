In React, data naturally flows downward from parent to child via props. This is known as unidirectional data flow.However, a common problem arises when two independent child components need to share the exact same changing data, or alter each other's state. Because sibling components cannot talk directly to one another, the solution is to lift the state up to their closest common parent.The Problem: Isolated Sibling StateImagine an application with two components:An Input Component where a user types a search query.A Results Component that filters and shows items matching that query.If the search term variable is trapped inside the Input component's local useState, the Results component cannot access it.The Solution: The React WayTo resolve this issue, we move the useState hook out of the child component entirely and place it inside the Parent Component.The Parent passes the state value down to the component that needs to read it.The Parent passes a handler function down to the component that needs to update it.Complete Code ImplementationHere is a real-world example of state lifting. We have a parent App controlling a typed value inside SearchInput and updating SearchPreview simultaneously.JavaScriptimport { useState } from 'react';

// Child Component 1: The Input
// It receives the current value and the update function from its parent
function SearchInput({ query, onQueryChange }) {
  return (
    <div style={{ marginBottom: '15px' }}>
      <label style={{ display: 'block', fontWeight: 'bold' }}>Search Items: </label>
      <input 
        type="text" 
        value={query} 
        onChange={(e) => onQueryChange(e.target.value)}
        placeholder="Type to filter..."
        style={{ padding: '8px', width: '250px', borderRadius: '4px', border: '1px solid #ccc' }}
      />
    </div>
  );
}

// Child Component 2: The Preview Display
// It only reads data passed down to it
function SearchPreview({ query }) {
  return (
    <div style={{ background: '#f4f4f4', padding: '12px', borderRadius: '6px' }}>
      <p><strong>Live Synchronized Preview:</strong></p>
      <p>{query ? `Searching for: "${query}"` : "Waiting for input..."}</p>
    </div>
  );
}

// The Common Parent Component
export default function App() {
  // The lifted state lives here now!
  const [searchQuery, setSearchQuery] = useState('');

  return (
    <div style={{ padding: '24px', maxWidth: '400px', fontFamily: 'sans-serif' }}>
      <h2>State Lifting Demo</h2>
      
      {/* Pass the setter function wrapper down to update state */}
      <SearchInput query={searchQuery} onQueryChange={setSearchQuery} />
      
      {/* Pass the plain state value down to reflect updates */}
      <SearchPreview query={searchQuery} />
    </div>
  );
}
Rules of Thumb for Lifting StateFind the common ancestor: Look at the component tree. Find the absolute closest component that wraps around both siblings requiring the data. That is where the state belongs.Keep state minimal: Don't lift state up higher than necessary (e.g., all the way to the main root level if only two nested components use it). Keeping it close keeps your application re-renders fast.