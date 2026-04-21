function updateTotal() {

    let subTotal = 0;
    const taxRate = 0.08;

    document.querySelectorAll('.cart-item').forEach(item => {

        const checkbox = item.querySelector('.cart-check');

        if (checkbox && checkbox.checked) {

            const price = parseFloat(
                item.querySelector('.item-price').dataset.price
            ) || 0;

            const qty = parseInt(
                item.querySelector('.item-qty').value
            ) || 0;

            subTotal += price * qty;
        }
    });

    const taxAmount = subTotal * taxRate;
    const finalTotal = subTotal > 0 ? subTotal + taxAmount : 0;

    document.getElementById('sub-total').innerText =
        subTotal.toLocaleString('vi-VN') + " VND";

    document.getElementById('tax-amount').innerText =
        taxAmount.toLocaleString('vi-VN') + " VND";

    document.getElementById('cart-total').innerText =
        finalTotal.toLocaleString('vi-VN') + " VND";
}

function changeQty(btn, delta) {

    const cartItem = btn.closest('.cart-item');
    const qtyInput = cartItem.querySelector(".item-qty");

    const variantId = cartItem.dataset.variantId;

    let qty = (parseInt(qtyInput.value) || 0) + delta;

    if (qty < 1) {
        alert("Số lượng sản phẩm tối thiểu là 1");
        return;
    }

    const oldQty = qtyInput.value;

    qtyInput.value = qty;

    updateTotal();

    const url =
        "CartServlet?action=updateQtyAjax&variantId=" +
        variantId +
        "&quantity=" +
        qty;

    fetch(url, {
        method: 'GET',
        headers: { 'X-Requested-With': 'XMLHttpRequest' }
    })
        .then(res => res.json())
        .then(data => {

            if (!data.success) {

                alert("Lỗi: " + data.message);

                qtyInput.value = oldQty;

                updateTotal();
            }
        })
        .catch(err => {

            console.error("AJAX Error:", err);

            alert("Không thể kết nối đến máy chủ");

            qtyInput.value = oldQty;

            updateTotal();
        });
}
function handleCheckout(event) {
    event.preventDefault();

    const selectedCheckboxes = document.querySelectorAll('.cart-check:checked');

    if (selectedCheckboxes.length === 0) {
        alert("Vui lòng chọn sản phẩm!");
        return;
    }

    const form = document.createElement("form");
    form.method = "POST";
    form.action = "CartServlet";

    const actionInput = document.createElement("input");
    actionInput.type = "hidden";
    actionInput.name = "action";
    actionInput.value = "prepareCheckout";
    form.appendChild(actionInput);

    selectedCheckboxes.forEach(cb => {
        const input = document.createElement("input");
        input.type = "hidden";
        input.name = "selectedItems";
        input.value = cb.value;
        form.appendChild(input);
    });

    document.body.appendChild(form);
    form.submit();
}

function closeCheckoutModal() {

    document.getElementById('checkoutModal').style.display = 'none';
}

window.onclick = function(event) {

    const modal = document.getElementById('checkoutModal');

    if (event.target === modal) {

        closeCheckoutModal();
    }
};


document
    .getElementById('checkoutForm')
    ?.addEventListener('submit', function () {

        const btn = document.getElementById('submitOrderBtn');

        if (btn) {

            btn.disabled = true;

            btn.innerHTML = 'Đang xử lý...';
        }
    });