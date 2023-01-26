const security_form = document.getElementById("security-form");
const results_form = document.getElementById("results-form");

security_form?.addEventListener("submit", function(event) {
  event.preventDefault(); // prevent form submission
  const secureCode = document.getElementById("secure_code").value;
  const dateOfBirth = document.getElementById("date_of_birth").value;
  const csrf_token = document.querySelector('meta[name="csrf-token"]').getAttribute('content');
  // Send an HTTP request to your server to validate the secure code and date of birth
  fetch('/results/validate', {
    method: 'POST',
    headers: { 'Content-Type': 'application/json',
    'X-CSRF-Token': csrf_token },
    body: JSON.stringify({ secure_code: secureCode, date_of_birth: dateOfBirth })
  })
  .then(response => response.json())
  .then(data => {
    console.log(data)
    if (typeof data.id === 'number' && data.id >= 0) {
      // Secure code is valid, proceed with form submission
      document.getElementById("main_form").classList.remove("hidden");
      document.getElementById("security-form").classList.add("hidden");
      document.getElementById("test_date").disabled = false;
    } else {
      // Secure code is invalid, show an error message
      document.getElementById("secure-code-error").innerHTML = data.error;
      document.getElementById("secure-code-error").classList.remove("hidden");
    }
  })
});
