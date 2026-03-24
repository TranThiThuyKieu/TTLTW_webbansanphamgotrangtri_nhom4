const TOKEN = "ce465184-2605-11f1-b015-2eae3cf2dbdd";

let provincesCache = null;
let districtsCache = {};
let wardsCache = {};
async function loadProvinces(selectedId = null) {
    const provinceSelect = document.getElementById("province_id");

    if (!provincesCache) {
        const res = await fetch("https://online-gateway.ghn.vn/shiip/public-api/master-data/province", {
            headers: { "Token": TOKEN }
        });
        const data = await res.json();
        provincesCache = data.data;
    }

    provinceSelect.innerHTML = `<option value="">Chọn tỉnh / Thành phố</option>`;

    provincesCache.forEach(p => {
        provinceSelect.innerHTML += `<option value="${p.ProvinceID}">${p.ProvinceName}</option>`;
    });

    if (selectedId) {
        provinceSelect.value = String (selectedId);
    }
    console.log("Set province:", selectedId);
}

async function loadDistricts(provinceId, selectedId = null) {
    if (!provinceId) return;

    const districtSelect = document.getElementById("district_id");
    const wardSelect = document.getElementById("ward_code");

    districtSelect.disabled = true;
    wardSelect.disabled = true;

    if (!districtsCache[provinceId]) {
        const res = await fetch("https://online-gateway.ghn.vn/shiip/public-api/master-data/district", {
            headers: { "Token": TOKEN }
        });

        const data = await res.json();

        if (!data.data) return;

        districtsCache[provinceId] =
            data.data.filter(d => d.ProvinceID == provinceId);
    }

    districtSelect.innerHTML = `<option value="">Chọn quận / huyện</option>`;

    districtsCache[provinceId].forEach(d => {
        districtSelect.innerHTML += `<option value="${d.DistrictID}">${d.DistrictName}</option>`;
    });

    districtSelect.disabled = false;

    if (selectedId) {
        districtSelect.value =String (selectedId);
    }
}

async function loadWards(districtId, selectedId = null) {
    if (!districtId) return;

    const wardSelect = document.getElementById("ward_code");
    wardSelect.disabled = true;

    if (!wardsCache[districtId]) {
        const res = await fetch(
            `https://online-gateway.ghn.vn/shiip/public-api/master-data/ward?district_id=${districtId}`,
            { headers: { "Token": TOKEN } }
        );

        const data = await res.json();

        if (!data.data) return;

        wardsCache[districtId] = data.data;
    }

    wardSelect.innerHTML = `<option value="">Chọn phường / xã</option>`;

    wardsCache[districtId].forEach(w => {
        wardSelect.innerHTML += `<option value="${w.WardCode}">${w.WardName}</option>`;
    });

    wardSelect.disabled = false;

    if (selectedId) {
        wardSelect.value = String(selectedId);
    }
}

function setupAddressEvents() {
    const provinceEl = document.getElementById("province_id");
    const districtEl = document.getElementById("district_id");

    provinceEl.onchange = async function () {
        const provinceId = this.value;

        const districtSelect = document.getElementById("district_id");
        const wardSelect = document.getElementById("ward_code");

        wardSelect.innerHTML = `<option value="">Chọn quận trước</option>`;
        wardSelect.disabled = true;

        if (!provinceId) {
            districtSelect.innerHTML = `<option value="">Chọn tỉnh trước</option>`;
            districtSelect.disabled = true;
            return;
        }

        await loadDistricts(provinceId);
    };

    districtEl.onchange = async function () {
        const districtId = this.value;
        if (!districtId) return;

        await loadWards(districtId);
    };
}

function openAddAddressModal() {
    document.getElementById("modalTitle").innerHTML = '<i class="fas fa-plus-circle"></i> Thêm địa chỉ';
    document.getElementById("addr-action").value = "add";

    document.getElementById("addr-id").value = "";
    document.getElementById("addr-name").value = "";
    document.getElementById("addr-phone").value = "";
    document.getElementById("addr-detail").value = "";

    const provinceSelect = document.getElementById("province_id");
    const districtSelect = document.getElementById("district_id");
    const wardSelect = document.getElementById("ward_code");

    provinceSelect.innerHTML = `<option value="" disabled selected hidden>Tỉnh / Thành phố</option>`;

    districtSelect.innerHTML = `<option value="">Chọn tỉnh trước</option>`;
    districtSelect.disabled = true;

    wardSelect.innerHTML = `<option value="">Chọn quận trước</option>`;
    wardSelect.disabled = true;


    document.getElementById("addressModal").style.display = "block";

    setupAddressEvents();
    loadProvinces();
}

function closeAddressModal() {
    document.getElementById("addressModal").style.display = "none";
}
function loadSelectedAddress() {

    const select = document.getElementById("old-address");
    if (!select || select.options.length === 0) return;
    const selected = select.options[select.selectedIndex];

    const districtId = selected.dataset.districtId;
    const wardCode = selected.dataset.wardCode;

    document.querySelector('input[placeholder="Họ và tên"]').value =
        selected.dataset.name || "";

    document.querySelector('input[placeholder="Số điện thoại"]').value =
        selected.dataset.phone || "";

    document.querySelector('input[placeholder="Địa chỉ cụ thể"]').value =
        selected.dataset.detail || "";

    document.querySelector('input[placeholder="Tỉnh/Thành phố"]').value =
        selected.dataset.province || "";

    document.querySelector('input[placeholder="Quận/Huyện"]').value =
        selected.dataset.district || "";

    document.querySelector('input[placeholder="Phường/Xã"]').value =
        selected.dataset.ward || "";

    calculateShipping(districtId, wardCode);
}
window.addEventListener("DOMContentLoaded", function () {

    loadSelectedAddress();

    document.getElementById("old-address")
        ?.addEventListener("change", loadSelectedAddress);
});
async function calculateShipping(districtId, wardCode) {

    if (!districtId || !wardCode) return;

    try {
        const res = await fetch(
            `ShippingServlet?district_id=${districtId}&ward_code=${wardCode}`
        );

        const data = await res.json();

        console.log("Shipping response:", data);
        if (data.code === 200) {

            const fee = data.data.total;

            document.getElementById("shipping-fee").innerText =
                fee.toLocaleString("vi-VN") + " VND";

            updateFinalTotal(fee);

        } else {
            console.error("GHN error", data);
        }

    } catch (err) {
        console.error("Fetch error", err);
    }
}
function updateFinalTotal(shippingFee) {

    const el = document.querySelector(".total-row-value");

    const subtotal = Number(el.dataset.subtotal) || 0;

    const final = subtotal + shippingFee;

    el.innerText = final.toLocaleString("vi-VN") + " đ";
}