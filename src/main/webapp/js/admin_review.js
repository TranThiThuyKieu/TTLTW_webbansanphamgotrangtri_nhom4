document.addEventListener("DOMContentLoaded", () => {
    const replyModal = document.getElementById("replyModal");
    const replyInput = document.getElementById("replyInput");
    const sendReplyButton = document.getElementById("sendReplyButton");

    let currentFeedbackData = {
        id: null,
        userId: null,
        customerName: ""
    };

    window.openReplyModal = function (feedbackId, userId, customerName, productName, rating, date) {
        if (!feedbackId) return;

        currentFeedbackData = { id: feedbackId, userId: userId, customerName: customerName };

        document.getElementById("modalCustomerName").innerText = customerName || "N/A";
        document.getElementById("modalProductName").innerText = productName || "N/A";
        document.getElementById("modalRatingStars").innerText = rating || 0;
        document.getElementById("modalReviewDate").innerText = date || "";

        const starContainer = document.getElementById("modalRatingStars");
        if (starContainer) {
            let stars = "";
            for (let i = 1; i <= rating; i++) {
                stars += `<i class="fas fa-star ${i <= rating ? 'text-warning' : ''}"></i>`;
            }
            starContainer.innerHTML = stars;
        }

        loadChatHistory(feedbackId, customerName);

        replyModal.style.display = "block";
    };

    let currentFetchController = null;

    function loadChatHistory(feedbackId, customerName) {
        if (currentFetchController) {
            currentFetchController.abort();
        }
        currentFetchController = new AbortController();
        const historyContainer = document.getElementById("modalReplyHistory");
        historyContainer.innerHTML = "<div class='text-center'>Đang tải lịch sử...</div>";

        fetch(`GetReviewHistory?parentId=${feedbackId}`, { signal: currentFetchController.signal })
            .then(res => res.json())
            .then(data => {
                historyContainer.innerHTML = "";
                if (data.length === 0) {
                    historyContainer.innerHTML = "<p class='text-center'>Chưa có lịch sử phản hồi.</p>";
                    return;
                }
                data.forEach(item => {
                    const isCustomer = (item.response_id === 0);
                    const chatItem = document.createElement("div");
                    chatItem.className = `history-item ${isCustomer ? 'customer-review' : 'admin-reply'}`;

                    const dateVal = item.createAt;
                    let dateStr = "";

                    if (dateVal) {
                        if (typeof dateVal === 'object' && dateVal.date) {
                            const d = dateVal.date;
                            const t = dateVal.time || {hour: 0, minute: 0};
                            dateStr = `${d.day}/${d.month}/${d.year} ${t.hour}:${t.minute}`;
                        } else if (typeof dateVal === 'string') {
                            const d = new Date(dateVal);
                            dateStr = d.toLocaleString('vi-VN', {
                                day: '2-digit',
                                month: '2-digit',
                                year: 'numeric',
                                hour: '2-digit',
                                minute: '2-digit'
                            });
                        } else {
                            const d = new Date(dateVal);
                            dateStr = d.toLocaleDateString('vi-VN');
                        }
                    } else {
                        dateStr = "Không rõ ngày";
                    }

                    chatItem.innerHTML = `
        <p class="history-meta"><strong>${isCustomer ? customerName : 'Bạn'}</strong> - ${dateStr}</p>
        <p class="history-text">${item.comment}</p>
    `;
                    historyContainer.appendChild(chatItem);
                });
                historyContainer.scrollTop = historyContainer.scrollHeight;
            })
            .catch(err => {
                if (err.name !== "AbortError") {
                    historyContainer.innerHTML = "<p class='text-danger'>Lỗi tải dữ liệu</p>";
                }
            });
    }

    let isDataChanged = false;

    if (sendReplyButton) {
        sendReplyButton.addEventListener("click", () => {
            const content = replyInput.value.trim();
            if (!content) {
                alert("Vui lòng nhập nội dung phản hồi.");
                return;
            }

            sendReplyButton.disabled = true;

            fetch("ReplyReview", {
                method: "POST",
                headers: { "Content-Type": "application/x-www-form-urlencoded" },
                body: new URLSearchParams({
                    parentId: currentFeedbackData.id,
                    comment: content
                })
            })
                .then(res => res.json())
                .then(data => {
                    if (data.success) {
                        alert("Phản hồi thành công!");
                        replyInput.value = "";
                        isDataChanged = true;

                        loadChatHistory(currentFeedbackData.userId, currentFeedbackData.customerName);
                    } else {
                        alert(data.message || "Gửi phản hồi thất bại!");
                    }
                })
                .catch(err => {
                    console.error("Lỗi gửi phản hồi:", err);
                    alert("Đã có lỗi hệ thống xảy ra.");
                })
                .finally(() => {
                    sendReplyButton.disabled = false;
                });
        });
    }

    window.closeReplyModal = function () {
        replyModal.style.display = "none";
        if (replyInput) replyInput.value = "";

        const historyContainer = document.getElementById("modalReplyHistory");
        if (historyContainer) {
            historyContainer.innerHTML = "";
        }

        currentFeedbackData = { id: null, userId: null, customerName: "" };

        if (isDataChanged) {
            isDataChanged = false;
            window.location.reload();
        }
    };

    window.deleteFeedback = function(feedbackId) {
        if (confirm("Bạn có chắc chắn muốn xóa đánh giá này? Dữ liệu phản hồi liên quan cũng sẽ bị xóa.")) {
            window.location.href = `AdminReviewServlet?action=delete&id=${feedbackId}`;
        }
    };

    document.addEventListener("click", (event) => {
        const row = event.target.closest(".highlight-row");
        const isActionZone = event.target.closest("td:last-child");

        if (row && !isActionZone && replyModal.style.display !== "block") {
            const replyBtn = row.querySelector(".reply-btn");
            if (replyBtn) {
                replyBtn.click();
            }
        }

    });

    if (replyModal) {
        replyModal.addEventListener("click", (e) => {
            if (e.target === replyModal) {
                closeReplyModal();
            }
        });
    }


    const searchInput = document.getElementById('searchInput');
    const ratingFilter = document.getElementById('ratingFilter');
    const typeFilter = document.getElementById('typeFilter');

    function applyFilterAndSearch() {
        const keyword = searchInput.value.trim();
        const rating = ratingFilter.value;
        const type = typeFilter.value;

        const params = new URLSearchParams();
        if (keyword) params.append('search', keyword);
        if (rating) params.append('rating', rating);
        if (type) params.append('type', type);

        window.location.href = 'AdminReviewServlet?' + params.toString();
    }

    if (searchInput) {
        searchInput.addEventListener('keydown', (event) => {
            if (event.key === 'Enter') {
                event.preventDefault();
                applyFilterAndSearch();
            }
        });
    }

    if (ratingFilter) ratingFilter.addEventListener('change', applyFilterAndSearch);
    if (typeFilter) typeFilter.addEventListener('change', applyFilterAndSearch);
});