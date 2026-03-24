function updatePrice(selectElement) {
    const selectedOption = selectElement.options[selectElement.selectedIndex];
    const price = selectedOption.getAttribute('data-price') || 0;
    const stock = selectedOption.getAttribute('data-stock') || 0;
    const card = selectElement.closest('.product-variant-card');
    card.querySelector('.original-price').value = price;
    const stockInput = card.querySelector('.item-stock');
    stockInput.value = stock;
    stockInput.setAttribute('max', stock);
    stockInput.placeholder = "Tồn: " + stock;
    card.querySelector('.item-percent').value = '';
    card.querySelector('.item-price').value = '';
    card.querySelector('.final-price-display').value = parseFloat(price).toLocaleString();
}
function calculatePrice(inputElement, type) {
    const card = inputElement.closest('.product-variant-card');
    const originalPrice = parseFloat(card.querySelector('.original-price').value) || 0;
    const finalPriceDisplay = card.querySelector('.final-price-display');
    const percentInput = card.querySelector('.item-percent');
    const directPriceInput = card.querySelector('.item-price');
    let val = parseFloat(inputElement.value);
    if (val < 0) {
        inputElement.value = 0;
        val = 0;
    }

    let finalPrice = originalPrice;
    if (type === 'percent') {
        let percent = val || 0;
        if (percent > 100) {
            percent = 100;
            inputElement.value = 100;
        }
        finalPrice = originalPrice - (originalPrice * percent / 100);
        directPriceInput.value = '';
    } else {
        let discountAmount = val || 0;
        if (discountAmount > originalPrice) {
            discountAmount = originalPrice;
            inputElement.value = originalPrice;
        }
        finalPrice = originalPrice - discountAmount;
        percentInput.value = '';
    }

    finalPriceDisplay.value = Math.round(finalPrice).toLocaleString();
}

document.addEventListener('input', function(e) {
    if (e.target.classList.contains('item-stock')) {
        let input = e.target;
        let maxStock = parseInt(input.getAttribute('max')) || 0;
        let currentValue = parseInt(input.value) || 0;

        if (currentValue < 0) {
            input.value = 0;
        }
        if (maxStock > 0 && currentValue > maxStock) {
            input.value = maxStock;
        }
    }
});
function addNewProductCard() {
    const list = document.getElementById('flash-product-list');
    const firstCard = list.querySelector('.product-variant-card');
    const newCard = firstCard.cloneNode(true);
    newCard.querySelector('.variant-header span').innerText = "Biến thể #" + (list.children.length + 1);
    newCard.querySelectorAll('input').forEach(input => {
        input.value = "";
        if(input.classList.contains('original-price') || input.classList.contains('final-price-display')) {
            input.value = "0";
        }
    });
    const select = newCard.querySelector('select');
    select.value = "0";

    list.appendChild(newCard);
}
function removeCard(btn) {
    const list = document.getElementById('flash-product-list');
    if (list.children.length > 1) {
        btn.closest('.product-variant-card').remove();
        const cards = list.querySelectorAll('.product-variant-card');
        cards.forEach((card, index) => {
            card.querySelector('.variant-header span').innerText = "Biến thể #" + (index + 1);
        });
    } else {
        alert("Phải có sản phẩm!");
    }
}
function applyBulk(type) {
    const percent = document.getElementById('bulk-percent').value;
    const stock = document.getElementById('bulk-stock').value;
    const cards = document.querySelectorAll('.product-variant-card');

    cards.forEach(card => {
        if (percent !== "" && (type === 'percent' || type === 'all')) {
            const pInput = card.querySelector('.item-percent');
            pInput.value = percent;
            calculatePrice(pInput, 'percent');}
        if (stock !== "" && (type === 'stock' || type === 'all')) {
            const sInput = card.querySelector('.item-stock');
            const maxOfThisCard = parseInt(sInput.getAttribute('max')) || 0;
            if (maxOfThisCard > 0 && parseInt(stock) > maxOfThisCard) {
                sInput.value = maxOfThisCard;
            } else {
                sInput.value = stock;
            }
        }
    });
}