#!/bin/bash

# ==========================================
# 1. ARGUMENT VALIDATION
# ==========================================

# The $# variable holds the number of arguments passed to the script.
# The statement below checks if this number is exactly 2.
if [ "$#" -ne 2 ]; then
    # If it isn't 2, print an error message.
    echo "Error: Missing or incorrect number of arguments."
    echo "Usage: $0 <name> <target_domain>"
    
    # exit 1 terminates the script with a standard error code to indicate failure.
    exit 1 
fi

# Assign arguments to descriptive variables
NAME=$1
DOMAIN=$2
CSV_FILE="ping_results.csv"

# Format the current time using the 'date' command
CURRENT_TIMESTAMP=$(date "+%Y-%m-%d %H:%M:%S")

# ==========================================
# 2. PINGING THE DOMAIN
# ==========================================
echo "Pinging $DOMAIN..."

# The 'if' statement naturally evaluates the exit code of the 'ping' command.
# -c 1: Ensures it only sends one ping request instead of running continuously.
# -W 2: Adds a 2-second timeout so the script doesn't hang indefinitely.
# > /dev/null 2>&1: Quietly discards the bulky output of the ping command to keep the terminal clean.
if ping -c 1 -W 2 "$DOMAIN" > /dev/null 2>&1; then
    # If successful, ping returns an exit code of 0 (triggering the 'then' block)
    RESULT="success"
    echo "Result: Ping successful!"
else
    # If it fails, it returns a non-zero exit code (triggering the 'else' block)
    RESULT="failure"
    echo "Result: Ping failed!"
fi

# ==========================================
# 3. LOGGING TO CSV
# ==========================================

# Create a header row if the CSV file doesn't already exist
if [ ! -f "$CSV_FILE" ]; then
    echo "Name,Domain,Result,Timestamp" > "$CSV_FILE"
fi

# Use the append operator (>>) to add a new line to the CSV file 
# with all the variables separated by commas.
echo "$NAME,$DOMAIN,$RESULT,$CURRENT_TIMESTAMP" >> "$CSV_FILE"

echo "Data logged to $CSV_FILE."