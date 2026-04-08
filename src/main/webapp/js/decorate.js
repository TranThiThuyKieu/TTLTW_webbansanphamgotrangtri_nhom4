    function sortProduct(sortValue) {
    let form = document.getElementById("filterForm");
    let formData = new FormData(form);

    let url = "ProductAllServlet?ajax=true";
    for (let [key, value] of formData.entries()) {
    url += "&" + key + "=" + value;}
    url += "&sort=" + sortValue;
    fetch(url)
    .then(res => res.text())
    .then(data => {
    document.getElementById("productList").innerHTML = data;
});
}