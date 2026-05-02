function openTab(evt, tabName) {
    const tabContents = document.getElementsByClassName("tab-content");
    for (let i = 0; i < tabContents.length; i++) tabContents[i].classList.remove("active");

    const tabBtns = document.getElementsByClassName("tab-btn");
    for (let i = 0; i < tabBtns.length; i++) tabBtns[i].classList.remove("active");

    document.getElementById(tabName).classList.add("active");
    evt.currentTarget.classList.add("active");
}

$(document).ready(function() {
    $('.select2').select2({
        placeholder: "-- Chọn Nhà cung cấp --",
        allowClear: true,
        width: '100%'
    });

    initSelect2Variant();
});

function initSelect2Variant(element = '.select2-variant') {
    $(element).select2({
        placeholder: "-- Chọn mặt hàng --",
        allowClear: true,
        width: '100%'
    });
}

function addRow(tableId) {
    const tableBody = document.querySelector(`#${tableId} tbody`);
    const firstRow = tableBody.querySelector('tr');

    const newRow = firstRow.cloneNode(true);

    const $newSelect = $(newRow).find('.select2-variant');

    $(newRow).find('.select2-container').remove();

    $newSelect.removeClass('select2-hidden-accessible')
        .removeAttr('data-select2-id')
        .removeAttr('aria-hidden')
        .removeAttr('tabindex')
        .empty(); // Xóa option cũ nếu muốn load từ currentVariants

    $newSelect.append('<option value="" disabled selected>-- Chọn mặt hàng --</option>');

    if (currentVariants && currentVariants.length > 0) {
        currentVariants.forEach(v => {
            $newSelect.append(new Option(v.sku, v.id));
        });
        $newSelect.prop('disabled', false);
    } else {
        $newSelect.prop('disabled', true);
    }

    newRow.querySelectorAll('input').forEach(input => {
        if (input.name === 'qty[]') input.value = 1;
        else if (input.name === 'prc[]') input.value = 0;
        else if (input.type !== 'checkbox') input.value = '';
    });

    const totalCell = newRow.querySelector('.row-total');
    if (totalCell) totalCell.innerText = "0 đ";

    tableBody.appendChild(newRow);

    $newSelect.select2({
        placeholder: "-- Chọn mặt hàng --",
        allowClear: true,
        width: '100%'
    });
}

function removeRow(btn, type) {
    const tbody = btn.closest('tbody');
    if (tbody.rows.length > 1) {
        $(btn.closest('tr')).find('.select2-variant').select2('destroy');
        btn.closest('tr').remove();
        if (type === 'import') calculateGrandTotal();
    }
}

function updateRowTotal(input, type) {
    const row = input.closest('tr');
    const qty = parseFloat(row.querySelector('input[name="qty[]"]').value) || 0;
    const price = parseFloat(row.querySelector('input[name="prc[]"]').value) || 0;
    const total = qty * price;

    const totalCell = row.querySelector('.row-total');
    if (totalCell) {
        totalCell.innerText = total.toLocaleString('vi-VN') + " đ";
    }
    calculateGrandTotal();
}

function calculateGrandTotal() {
    let grandTotal = 0;
    document.querySelectorAll('.row-total').forEach(cell => {
        const val = parseInt(cell.innerText.replace(/\D/g, '')) || 0;
        grandTotal += val;
    });
    const display = document.getElementById('grandTotalImport');
    if (display) display.innerText = grandTotal.toLocaleString('vi-VN') + " đ";
}
$(document).on('submit', 'form', function(e) {

    let isValid = true;

    $('.error-message').remove();
    $('.error').removeClass('error');

    const supplier = $('select[name="supplierId"]');

    if (!supplier.val()) {
        showError(supplier, "Vui lòng chọn nhà cung cấp");
        isValid = false;
    }
    if ($('#importTable tbody tr').length === 0) {
        alert("Phải có ít nhất 1 mặt hàng");
        isValid = false;
    }
    const creator = $('input[name="billCode"]');
    const importDate = $('input[name="importDate"]');

    if (!creator.val().trim()) {
        showError(creator, "Không được để trống");
        isValid = false;
    }

    if (!importDate.val()) {
        showError(importDate, "Chọn ngày lập");
        isValid = false;
    } else {
        const selectedDate = new Date(importDate.val());
        const today = new Date();
        today.setHours(0,0,0,0);

        if (selectedDate < today) {
            showError(importDate, "Không được chọn ngày cũ");
            isValid = false;
        }
    }

    $('#importTable tbody tr').each(function() {

        const variant = $(this).find('select[name="vId[]"]');
        const qty = $(this).find('input[name="qty[]"]');
        const price = $(this).find('input[name="prc[]"]');

        if (!variant.val()) {
            showError(variant, "Chọn mặt hàng");
            isValid = false;
        }

        if (!qty.val() || parseInt(qty.val()) <= 0) {
            showError(qty, "SL phải > 0");
            isValid = false;
        }

        if (!price.val() || parseFloat(price.val()) <= 0) {
            showError(price, "Giá phải > 0");
            isValid = false;
        }

    });

    const confirm = $('input[name="confirmImport"]');

    if (!confirm.is(':checked')) {
        showError(confirm, "Bạn phải xác nhận");
        isValid = false;
    }

    if (!isValid) {
        e.preventDefault();

        const firstError = $('.error').first();
        if (firstError.length) {
            $('html, body').animate({
                scrollTop: firstError.offset().top - 100
            }, 300);
        }
    }

});
function showError(element, message) {

    element.addClass('error');

    if (element.hasClass('select2-hidden-accessible')) {
        const container = element.nextAll('.select2-container').first();
        container.after(`<div class="error-message">${message}</div>`);
    }
    else if (element.attr('type') === 'checkbox') {
        element.closest('.checkbox-container')
            .after(`<div class="error-message">${message}</div>`);
    }
    else {
        element.after(`<div class="error-message">${message}</div>`);
    }
}
$(document).on('input change', 'input, select', function() {
    $(this).removeClass('error');
    $(this).nextAll('.error-message').first().remove();
});
$(document).on('change', '.select2, .select2-variant', function() {
    $(this).removeClass('error');
    $(this).nextAll('.error-message').first().remove();
});
$(document).ready(function() {
    $('select[name="supplierId"]').on('change', function() {
        const supplierId = $(this).val();
        const variantSelects = $('.select2-variant');

        if (supplierId) {
            $.ajax({
                url: 'ImportInventoryStockServlet',
                type: 'GET',
                data: {
                    action: 'getVariants',
                    supplierId: supplierId
                },
                success: function(data) {
                    updateAllVariantOptions(data);
                }
            });
        } else {
            variantSelects.prop('disabled', true).val(null).trigger('change');
        }
    });
});

let currentVariants = [];

function updateAllVariantOptions(variants) {
    currentVariants = variants;
    const selects = $('.select2-variant');

    selects.each(function() {
        const $el = $(this);
        $el.prop('disabled', false);
        $el.empty().append('<option value="" disabled selected>-- Chọn mặt hàng --</option>');

        variants.forEach(v => {
            $el.append(new Option(v.sku, v.id));
        });
        $el.trigger('change');
    });
}