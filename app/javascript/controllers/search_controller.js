let searchInput = document.getElementById("search-input");
let list = document.getElementById("patient-list");

searchInput?.addEventListener("keyup", function () {
  let searchValue = this.value.toLowerCase();
  let listItems = list.getElementsByTagName("p");

  for (let i = 0; i < listItems.length; i++) {
    let item = listItems[i];
    let itemValue = item.innerHTML.toLowerCase();
    if (itemValue.indexOf(searchValue) != -1) {
      item.style.display = "block";
    } else {
      item.style.display = "none";
    }
  }
});
