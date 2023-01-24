document.getElementById("results-form").addEventListener("submit", function(event) {
  event.preventDefault(); // prevent form submission
  const secureCode = document.getElementById("secure_code").value;
  const dateOfBirth = document.getElementById("date_of_birth").value;
  // Send an HTTP request to your server to validate the secure code and date of birth
  fetch('/validate_secure_code', {
    method: 'POST',
    body: JSON.stringify({ secure_code: secureCode, date_of_birth: dateOfBirth }),
    headers: { 'Content-Type': 'application/json' },
  })
  .then(response => response.json())
  .then(data => {
    if (data.valid) {
      // Secure code is valid, proceed with form submission
      document.getElementById("main_form").classList.remove("hidden");
      document.getElementById("secure_form").classList.add("hidden");
    } else {
      // Secure code is invalid, show an error message
      document.getElementById("secure-code-error").innerHTML = data.error;
      document.getElementById("secure-code-error").classList.remove("hidden");
    }
  })
});
