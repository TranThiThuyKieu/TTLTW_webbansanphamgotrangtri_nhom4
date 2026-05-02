 function toggleRankSelection() {
    var select = document.getElementById("rewardStyleSelect");
    var rankWrapper = document.getElementById("rankWrapper");
    if (select.value === "SPECIAL") {
    rankWrapper.style.display = "block";
} else {
    rankWrapper.style.display = "none";
    var checkboxes = rankWrapper.querySelectorAll('input[type="checkbox"]');
    checkboxes.forEach(cb => cb.checked = false);
}
}
 window.onload = function () {
     toggleRankSelection();
 };
