In React, conditional rendering works using standard JavaScript logical structures. Because JSX evaluates plain expressions, we can swap, hide, or show UI elements dynamically.

Here are the four most common ways to handle conditional rendering in modern React applications.

1. The Classic if / else Statement
The standard if statement is best used at the very top of your component code, before your primary return block. This acts as an early exit gate for your layout.

JavaScript
function Dashboard({ isLoading, data }) {
  // Early return rule: Render a loading state first
  if (isLoading) {
    return <h2>⌛ Loading your dashboard...</h2>;
  }

  // Fallback return rule: Render when data successfully arrives
  return (
    <div>
      <h2>Welcome Back!</h2>
      <p>Your premium balance is: {data.balance}</p>
    </div>
  );
}
2. The Ternary Operator (condition ? true : false)
When you want to conditionally render elements inline inside your main JSX layout block, use the JavaScript ternary operator. Think of it as a compact, inline if/else wrapper.

JavaScript
function AuthenticationButton({ isLoggedIn }) {
  return (
    <div style={{ padding: '10px' }}>
      {/* Syntax: condition ? render_if_true : render_if_false */}
      {isLoggedIn ? (
        <button className="logout-btn">Log Out</button>
      ) : (
        <button className="login-btn">Log In / Register</button>
      )}
    </div>
  );
}
3. The Logical AND Operator (condition && render_if_true)
Sometimes you want an element to appear only if a condition is true, and display absolutely nothing if it is false. The short-circuit && operator is the cleanest choice here.

JavaScript
function NotificationBadge({ unreadCount }) {
  return (
    <div className="bell-icon">
      <span>🔔 Alerts Menu</span>
      
      {/* If unreadCount is greater than 0, render the badge element. 
          If it's 0, JavaScript shorts out and skips rendering entirely. */}
      {unreadCount > 0 && (
        <span className="badge-count" style={{ background: 'red', color: 'white', padding: '2px 6px' }}>
          {unreadCount}
        </span>
      )}
    </div>
  );
}
⚠️ Gotcha Warning: Be careful passing raw numbers like 0 to the left side of &&. If your code reads {items.length && <List/>} and the array is empty, React will print a literal 0 onto your webpage! Always make sure the condition evaluates to a clean boolean value, like {items.length > 0 && <List/>}.

4. Preventing Render Entirely with null
If you want a component to completely hide itself under certain circumstances, you can explicitly return null. Returning null instructs React to mount the component invisibly without outputting any HTML node to the browser DOM structure.

JavaScript
function CookieBanner({ isAccepted }) {
  // If user already clicked accept, hide the entire banner element
  if (isAccepted) {
    return null;
  }

  return (
    <div className="cookie-banner-popup" style={{ background: '#333', color: '#fff', position: 'fixed', bottom: 0 }}>
      <p>We use tracking cookies to personalize your development workflow experience.</p>
      <button>I Understand</button>
    </div>
  );
}
Which one should I choose?
Use an if statement for complex, global components that alter the whole page outcome (like loading screens or error walls).

Use a Ternary operator (? :) when toggling between two alternative elements side-by-side inside HTML markup.

Use && when adding a single optional UI option that pops on or off dynamically.