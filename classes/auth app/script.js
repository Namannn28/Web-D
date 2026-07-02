// Wait for the DOM to fully load before running the script
document.addEventListener('DOMContentLoaded', () => {

    // --- Element References ---
    const welcomeMessage = document.getElementById('welcome-message');
    const userContent = document.getElementById('user-content');
    const authButton = document.getElementById('auth-button');

    // --- State Management ---
    // In a real app, this would be determined by a server session or token.
    // We start with the user being unauthorized.
    let isAuthorized = false;

    // --- Functions ---

    /**
     * Updates the page content based on the authorization status.
     */
    const updateContent = () => {
        if (isAuthorized) {
            // Content for AUTHORIZED users ✅
            welcomeMessage.textContent = 'Welcome Back, User! 👋';
            userContent.innerHTML = 'You are logged in. Here is your exclusive content: <br><b>Secret Code: 12345</b>';
            authButton.textContent = 'Log Out';
        } else {
            // Content for UNAUTHORIZED users ❌
            welcomeMessage.textContent = 'Access Denied!';
            userContent.textContent = 'Please log in to view the page content.';
            authButton.textContent = 'Log In';
        }
    };

    /**
     * Toggles the user's authorization state and updates the content.
     */
    const toggleAuth = () => {
        isAuthorized = !isAuthorized; // Flips the boolean value (true to false, false to true)
        updateContent();
    };


    // --- Event Listeners ---
    authButton.addEventListener('click', toggleAuth);


    // --- Initial Page Load ---
    // Display the initial content when the page first loads.
    updateContent();

});