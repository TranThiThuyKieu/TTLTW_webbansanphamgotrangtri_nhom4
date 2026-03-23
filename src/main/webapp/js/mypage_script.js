document.addEventListener('DOMContentLoaded', function() {
    const dropdownToggle = document.querySelector('.dropdown-toggle');
    const dropdownMenu = document.querySelector('.menu-item-dropdown');
    if (dropdownToggle && dropdownMenu) {
        dropdownToggle.addEventListener('click', function(e) {
            e.preventDefault();
            dropdownMenu.classList.toggle('active');
        });
    }

    function activeTab(tabId) {
        const targetContent = document.getElementById(tabId);
        const targetLink = document.querySelector(`[data-tab="${tabId}"]`);

        if (targetContent) {
            document.querySelectorAll('.tab-content').forEach(c => c.classList.remove('active'));
            targetContent.classList.add('active');

            if (targetLink) {
                document.querySelectorAll('.tab-link, .menu-link').forEach(l => l.classList.remove('active'));
                targetLink.classList.add('active');

                const parentDropdown = targetLink.closest('.menu-item-dropdown');
                if (parentDropdown) parentDropdown.classList.add('active');
            }
        }
    }

    document.querySelectorAll('.menu-link[data-tab], .tab-link[data-tab]').forEach(link => {
        link.addEventListener('click', function (e) {
            const href = this.getAttribute('href');

            if (href && href !== '#' && href.includes('MyPageServlet')) {
                return;
            }

            e.preventDefault();
            const tabId = this.dataset.tab;
            activeTab(tabId);
        });
    });

    const params = new URLSearchParams(window.location.search);
    const tabName = params.get('tab') || 'ho-so';
    activeTab(tabName);

    const form = document.querySelector(".modal-form");

    if (form) {
        form.addEventListener("submit", function () {
            const provinceSelect = document.getElementById("province_id");
            const districtSelect = document.getElementById("district_id");
            const wardSelect = document.getElementById("ward_code");

            document.getElementById("province_name").value =
                provinceSelect.options[provinceSelect.selectedIndex]?.text || "";

            document.getElementById("district_name").value =
                districtSelect.options[districtSelect.selectedIndex]?.text || "";

            document.getElementById("ward_name").value =
                wardSelect.options[wardSelect.selectedIndex]?.text || "";
        });
    }
});
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

async function openEditAddressModal(id, name, phone, detail, ward_code, district_id, province_id) {
    document.getElementById("modalTitle").innerHTML = '<i class="fas fa-edit"></i> Cập nhật địa chỉ';
    document.getElementById("addr-action").value = "update";

    document.getElementById("addr-id").value = id;
    document.getElementById("addr-name").value = name;
    document.getElementById("addr-phone").value = phone;
    document.getElementById("addr-detail").value = detail;

    document.getElementById("addressModal").style.display = "block";

    console.log("Province:", province_id);
    console.log("District:", district_id);
    console.log("Ward:", ward_code);

    setupAddressEvents();

    await loadProvinces(province_id);
    await loadDistricts(province_id, district_id);
    await loadWards(district_id, ward_code);
}

function closeAddressModal() {
    document.getElementById("addressModal").style.display = "none";
}

