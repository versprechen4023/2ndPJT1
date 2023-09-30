window.addEventListener('DOMContentLoaded', event => {
    // Simple-DataTables
    // https://github.com/fiduswriter/Simple-DataTables/wiki

    const datatablesSimple = document.getElementById('datatablesSimple');
    if (datatablesSimple) {
        new simpleDatatables.DataTable(datatablesSimple, {
        
      // 페이지 표시 버튼 삭제
      perPageSelect : false,
      searchable : false,
      perPage : 10,
      
      //라벨을 수정
      labels: {
      placeholder: "검색",
      noResults : "검색 결과가 없습니다",
      info : ""
      }
        
      });
    }
});
