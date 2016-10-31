# Website-Test-Scripts
This is to test websites when protected by bot automation prevention.

When a website is unprotected, the scripts will yield a success if a list of valid usernames / passwords are attempted on the login page.

When a website is protected, the script should receive failures, even if using a known list of valid usernams / passwords.

# CURL Script
The CURL script works by sending a POST request to the URL with the credential list. If the script receives a 200 response, the script will print a SUCCESS next to the credentials. If for any reason that there is not a 200 response (such as the URL doesn't respond, or the bot automation prevention works by blocking it) the script will print a FAILURE next to the credentials.

# Selenium Script
The Selenium script uses Selenium to automate the inputting of characters directly in the website. The script can be adjusted to have a varying length of time in between the characters. The script will print a SUCCESS if the credentials were able to log into the website, and a FAILURE if the credentials did not work, or if there was something preventing the credentials from working.
