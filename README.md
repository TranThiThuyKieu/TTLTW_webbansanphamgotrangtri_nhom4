# TTLTW_webbansanphamgotrangtri_nhom4
1. Quy định:
  - Nhánh main: Chỉ chứa code ổn định, Không code trực tiếp trên nhánh này, Chỉ merge khi chức năng đã hoàn thành
  - Nhánh admin: Dùng để phát triển các chức năng quản trị
    - Ví dụ:quản lý sản phẩm, quản lý đơn hàng, quản lý khách hàng...
  - Nhánh user: Dùng để phát triển các chức năng người dùng
    - Ví dụ:đăng ký / đăng nhập, giỏ hàng, thanh toán, xem sản phẩm...

  Lưu ý: Trước khi code cần pull code mới nhất.
  - Quy định làm việc nhóm
    - Không sửa code của thành viên khác khi chưa trao đổi.
    - Luôn pull code trước khi code.
    - Commit phải ghi rõ nội dung.
    - Không push code chưa test.
  - Chỉ merge khi: code chạy ổn định, không lỗi, không conflict

2. Quy tác commit:
   - Commit phải ghi rõ chức năng đã làm: [loại]: mô tả chức năng
    - Loại và ý nghĩa commit
      - feat: thêm chức năng mới
      - fix: sửa lỗi
      - update: cập nhật code
      - refactor: chỉnh sửa lại code
      - style: chỉnh CSS / giao diện
      - remove: xóa chức năng
      - docs: cập nhật tài liệu
      - Ví dụ: 
        - Thêm chức năng:  
          - feat: thêm chức năng thêm sản phẩm cho admin
          - feat: tạo trang danh sách sản phẩm cho user
        - Sửa lỗi:
          fix: sửa lỗi không thêm được sản phẩm
        
3. Quy định push code:
   - Mỗi chức năng nên commit riêng.
   - Không commit nhiều chức năng trong 1 commit.
   - Không nên push code lỗi hoặc chưa chạy.
   
