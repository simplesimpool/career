$(document).ready(function () {
  // 탭 클릭 시
  $(".tab-btn").on("click", function () {
    const tab = $(this).data("tab");

    // 탭 활성화
    $(".tab-btn").removeClass("active");
    $(this).addClass("active");

    $(".tab-content").removeClass("active");
    $("#" + tab).addClass("active");
  });

  // 👉 URL에 #user-tab 또는 #publisher-tab 있을 경우 해당 탭 자동으로 활성화
  const hash = window.location.hash;
  if (hash === "#publisher-tab") {
    $(".tab-btn").removeClass("active");
    $(".tab-content").removeClass("active");

    $('.tab-btn[data-tab="publisher-tab"]').addClass("active");
    $("#publisher-tab").addClass("active");
  } else {
    // 기본은 user-tab
    $(".tab-btn[data-tab='user-tab']").addClass("active");
    $("#user-tab").addClass("active");
  }
});

  
  
$(document).ready(function () {
  const $checkbox = $("#hideWithdrawn");

  // 페이지 로딩 시: sessionStorage에서 값 꺼내 체크 상태 복원
  const savedWithdraw = sessionStorage.getItem("withdraw");
  if (savedWithdraw === "true") {
    $checkbox.prop("checked", true);
    $(".withdrawn-row").hide();
  } else {
    $checkbox.prop("checked", false);
    $(".withdrawn-row").show();
  }

  // 체크 상태 변경 시 저장
  $checkbox.on("change", function () {
    const isChecked = $(this).is(":checked");
    sessionStorage.setItem("withdraw", isChecked ? "true" : "false");

    if (isChecked) {
      $(".withdrawn-row").hide();
    } else {
      $(".withdrawn-row").show();
    }

    updatePaginationLinks(); // 기존대로 페이징 링크 업데이트
  });

  // 페이징 링크에 withdraw=true/false 유지
  function updatePaginationLinks() {
    const withdrawVal = $checkbox.is(":checked") ? "true" : "false";

    $(".pagination .page-link").each(function () {
      let href = $(this).attr("href") || "";
      href = href.replace(/([&?])withdraw=(true|false)/, "");
      const separator = href.includes("?") ? "&" : "?";
      href += separator + "withdraw=" + withdrawVal;

      $(this).attr("href", href);
    });
  }
});

  