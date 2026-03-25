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
document.querySelector("form").addEventListener("submit", function () {
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
document.addEventListener("DOMContentLoaded", async () => {
    const provinceSelect = document.getElementById("province_id");
    const districtSelect = document.getElementById("district_id");
    const wardSelect = document.getElementById("ward_code");

    provinceSelect.innerHTML = `<option value="" disabled selected>Đang tải...</option>`;
    districtSelect.innerHTML = `<option value="">Chọn tỉnh trước</option>`;
    wardSelect.innerHTML = `<option value="">Chọn quận trước</option>`;

    districtSelect.disabled = true;
    wardSelect.disabled = true;

    setupAddressEvents();

    await loadProvinces();

    await restoreAddressFromDB();
});
async function restoreAddressFromDB() {
    const savedProvinceId = document.getElementById("saved_province_id")?.value;
    const savedDistrictId = document.getElementById("saved_district_id")?.value;
    const savedWardCode = document.getElementById("saved_ward_code")?.value;

    console.log("Restore:", savedProvinceId, savedDistrictId, savedWardCode);

    if (!savedProvinceId || savedProvinceId === "0") return;

    document.getElementById("province_id").value = String(savedProvinceId);

    await loadDistricts(savedProvinceId);
    if (savedDistrictId) {
        document.getElementById("district_id").value = String(savedDistrictId);
    }

    if (savedDistrictId) {
        await loadWards(savedDistrictId);
    }
    if (savedWardCode) {
        document.getElementById("ward_code").value = String(savedWardCode);
    }
}