function sortProducts() {
    let sortValue = document.getElementById("sortSelect").value;
    fetch("FavoriteServlet?ajax=true&sort=" + sortValue)
        .then(res => res.text())
        .then(data => {
            document.getElementById("productList").innerHTML = data;
        })
        .catch(err => console.log(err));
}