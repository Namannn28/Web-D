1. JSX (JavaScript XML)
JSX is a syntax extension for JavaScript. It looks exactly like HTML, but it lives completely inside your JavaScript file.

Instead of keeping your markup (HTML) and your logic (JavaScript) in separate files, React combines them so that your UI stays directly tied to your data.

The Key Rules of JSX:
Return a single root element: You can't return multiple side-by-side HTML elements. They must be wrapped inside a single parent tag, like a <div>, or a React Fragment <> and </>.

Use className instead of class: Since class is a reserved keyword in JavaScript, React uses className for CSS classes.

Evaluate JavaScript with curly braces { }: If you want to drop a JavaScript variable, function, or expression right into your HTML, just wrap it in {}.

JavaScript
// A quick example of JSX in action
function WelcomeMessage() {
  const username = "Naman";
  const isLoggedIn = true;

  return (
    <div className="welcome-container">
      <h1>Hello, {username}!</h1>
      <p>Today's date is {new Date().toLocaleDateString()}</p>
      {isLoggedIn ? <p>Welcome back!</p> : <p>Please log in.</p>}
    </div>
  );
}
2. Components
Components are the building blocks of a React application. They are independent, reusable bits of code that represent parts of your user interface (like a navigation bar, a button, or a profile card).

In modern React, a component is simply a JavaScript function that starts with a Capital letter and returns JSX.

JavaScript
// 1. Define a smaller reusable component
function FollowButton() {
  return <button className="btn-primary">Follow</button>;
}

// 2. Use it inside another component
function ProfileCard() {
  return (
    <div className="card">
      <h3>User Profile</h3>
      <p>Software Developer based in Berlin.</p>
      {/* Reusing our component here */}
      <FollowButton /> 
    </div>
  );
}
3. Props (Properties)
If components are like JavaScript functions, then Props are the arguments passed into those functions.

Props allow you to pass data down from a parent component to a child component, making your components dynamically customizable instead of hardcoded.

⚠️ Important Golden Rule: Props are read-only (immutable). A child component should never modify the props it receives; it just reads them and displays them.

Code Example: Putting it all together
Let's see how a parent component passes distinct data to multiple instances of the same child component using props.

JavaScript
// The Child Component: Receives data via an object typically named 'props'
function ProductCard(props) {
  return (
    <div className="product-card">
      <img src={props.imageUrl} alt={props.title} />
      <h3>{props.title}</h3>
      <p>Price: ${props.price}</p>
    </div>
  );
}

// The Parent Component: Passes data to the child components using custom attributes
export default function StoreFront() {
  return (
    <div className="store-container">
      <h2>Summer Collection</h2>
      
      {/* Passing different values to the same component structure */}
      <ProductCard 
        title="Wireless Headphones" 
        price="99" 
        imageUrl="https://placehold.co/150" 
      />
      <ProductCard 
        title="Mechanical Keyboard" 
        price="149" 
        imageUrl="https://placehold.co/150" 
      />
    </div>
  );
}
Pro-Tip: Destructuring Props
Instead of typing props.title or props.price every time, developers frequently use JavaScript destructuring directly inside the function's arguments to make the code cleaner:

JavaScript
// This behaves exactly the same way, but reads much cleaner!
function ProductCard({ title, price, imageUrl }) {
  return (
    <div className="product-card">
      <img src={imageUrl} alt={title} />
      <h3>{title}</h3>
      <p>Price: ${price}</p>
    </div>
  );
}