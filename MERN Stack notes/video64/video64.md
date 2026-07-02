Up until now, you've likely been passing standard data types down to components via standard props (like title="Headphones" or price="99").

However, React allows you to pass entire blocks of UI elements and even executable functions as props. Let's break down these two highly powerful structural patterns.

1. Passing Props as children
Sometimes, you want to create a component that acts as a generic layout wrapper—like a Modal, a Sidebar, or a styled Card wrapper—without knowing exactly what HTML content or text will go inside it ahead of time.

React handles this natively using a special built-in prop called children. Anything you nest inside the opening and closing tags of your custom component automatically gets passed in as children.

The Component Setup (CardWrapper.jsx)
JavaScript
// The component destructures 'children' from its props automatically
export default function CardWrapper({ children, title }) {
  return (
    <div className="card-container" style={{ border: '2px solid #333', padding: '20px', borderRadius: '8px' }}>
      <h2 className="card-header">{title}</h2>
      <div className="card-body">
        {/* Whatever sits between the component tags will render right here */}
        {children}
      </div>
    </div>
  );
}
How You Use It (App.jsx)
JavaScript
import CardWrapper from './CardWrapper';

export default function App() {
  return (
    <div>
      {/* Example 1: Nesting simple text and buttons */}
      <CardWrapper title="Profile Settings">
        <p>Update your email address and notification status here.</p>
        <button>Edit Profile</button>
      </CardWrapper>

      {/* Example 2: Nesting completely different markup in the same wrapper */}
      <CardWrapper title="System Alert">
        <div style={{ color: 'red', fontWeight: 'bold' }}>
          ⚠️ Warning: Your disk space is nearly full.
        </div>
      </CardWrapper>
    </div>
  );
}
2. Passing Functions as Props (Lifting State Up)
In React, data flows strictly downward (from parent to child). But what happens if a child component needs to communicate something back up to its parent—for example, a button click that deletes an item from a list stored in parent state?

You solve this by passing an executable function as a prop from the parent component down to the child. When the child executes that function, it can pass data right back up to the parent.

The Code Example
JavaScript
// 1. The Child Component (Receives the function via props)
function AlertButton({ onCustomClick, buttonText }) {
  return (
    // When clicked, it runs the function given to it by the parent
    <button onClick={onCustomClick} style={{ backgroundColor: '#ff4d4d', color: '#fff' }}>
      {buttonText}
    </button>
  );
}

// 2. The Parent Component (Owns the state and defines the behavior)
export default function App() {
  
  function handleAlertTrigger(message) {
    alert(`Parent received event: ${message}`);
  }

  return (
    <div style={{ padding: '30px' }}>
      <h1>Dashboard Interface</h1>
      
      {/* We pass our handleAlertTrigger function straight down as a prop */}
      <AlertButton 
        buttonText="Trigger Nuclear Launch" 
        onCustomClick={() => handleAlertTrigger("Launch Code Accepted")} 
      />
      
      <AlertButton 
        buttonText="Format Drive" 
        onCustomClick={() => handleAlertTrigger("Formatting Initiated")} 
      />
    </div>
  );
}
Why this design works beautifully:
The Child stays dumb and reusable: The AlertButton component doesn't know (or care) what happens when it is clicked. It just knows it needs to fire a function called onCustomClick.

The Parent retains complete control: The parent component determines the actual logic and state modifications safely within its own scope.