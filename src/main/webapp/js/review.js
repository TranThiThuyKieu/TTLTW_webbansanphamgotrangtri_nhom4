function showTab(type) {
    document.getElementById('pending-section').style.display = (type === 'pending' ? 'block' : 'none');
    document.getElementById('history-section').style.display = (type === 'history' ? 'block' : 'none');
    const btns = document.querySelectorAll('.tab-btn');
    btns[0].classList.toggle('active', type === 'pending');
    btns[1].classList.toggle('active', type === 'history');
}

function openReviewModal(id, name, orderId) {
    document.getElementById('modalId').value = id;
    document.getElementById('modalName').innerText = name;
    document.getElementById('modalOrderId').value = orderId;
    document.getElementById('reviewModal').style.display = 'block';
}

function closeModal() {
    document.getElementById('reviewModal').style.display = 'none';
}

window.onclick = function(e) {
    if (e.target == document.getElementById('reviewModal')) closeModal();
}