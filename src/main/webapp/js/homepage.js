function toggleWishlist(btn, productId) {

    fetch("AddFavoritesServelt", {
        method: "POST",
        headers: {
            "Content-Type": "application/x-www-form-urlencoded"
        },
        body: "productId=" + productId
    })
        .then(res => res.json())
        .then(data => {
            if (data.status === "login_required") {
                window.location.href = "login.jsp";
                return;
            }

            const icon = btn.querySelector("i");

            if (data.status === "added") {
                btn.classList.add("active");

                icon.classList.remove("ri-heart-line");
                icon.classList.add("ri-heart-fill");

                alert("Đã thêm vào danh sách yêu thích!");
            }

            else if (data.status === "removed") {
                btn.classList.remove("active");

                icon.classList.remove("ri-heart-fill");
                icon.classList.add("ri-heart-line");

                alert("Đã xóa khỏi danh sách yêu thích!");
            }
        })
        .catch(err => {
            console.error(err);
            alert("Có lỗi xảy ra!");
        });
}