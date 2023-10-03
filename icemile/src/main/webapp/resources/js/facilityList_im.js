window.addEventListener('DOMContentLoaded', event => {
    // Simple-DataTables
    // https://github.com/fiduswriter/Simple-DataTables/wiki

    const datatablesSimple = document.getElementById('datatablesSimple');
    if (datatablesSimple) {
        new simpleDatatables.DataTable(datatablesSimple, {
        
      // 페이지 표시 버튼 삭제
      perPageSelect : false,
      // 검색창 삭제
      searchable : false,
      // 페이지당 목록 10개
      perPage : 10,
      
      //라벨 수정
      labels: {
      placeholder: "검색",
      noResults : "검색 결과가 없습니다",
      info : ""
      }
        
      });
    }
});
