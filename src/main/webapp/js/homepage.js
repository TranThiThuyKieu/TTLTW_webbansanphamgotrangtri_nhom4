function toggleWishlist(element, productId) {
    element.classList.toggle('active');
    const icon = element.querySelector('i');

    if (element.classList.contains('active')) {
        icon.classList.remove('ri-heart-line');
        icon.classList.add('ri-heart-fill');

        alert("Đã thêm vào danh sách yêu thích!");
    } else {
        icon.classList.remove('ri-heart-fill');
        icon.classList.add('ri-heart-line');

        alert("Đã xóa khỏi danh sách yêu thích!", "ri-information-line");
    }
}