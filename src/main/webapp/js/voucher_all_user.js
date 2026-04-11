function filterVoucher(type) {
    const cards = document.querySelectorAll(".v-card");
    const buttons = document.querySelectorAll(".v-filter-btn button");
    buttons.forEach(btn => btn.classList.remove("active"));
    event.target.classList.add("active");
    cards.forEach(card => {
    const cardType = card.getAttribute("data-type");
    if (type === "ALL" || cardType === type) {
    card.style.display = "flex";
} else {
    card.style.display = "none";
}});}