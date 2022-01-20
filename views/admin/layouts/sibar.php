<nav class="navbar navbar-expand-lg navbar-light bg-light">
  <a class="navbar-brand" href="index.php">SHOPHAI</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <div class="mr-auto"></div>
    <ul class="navbar-nav mr-auto">
      <li class="nav-item">
        <a class="nav-link" href="admin.php">Trang chủ</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">Thông báo</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">Admin</a>
      </li>
    </ul>
    <form class="form-inline my-2 my-lg-0">
      <input class="form-control mr-sm-2" type="search" placeholder="Tìm..." aria-label="Search">
      <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Tìm kiếm</button>
    </form>
  </div>
</nav>

<div>
  <div id="wrapper">
  <!-- Sidebar -->
    <div id="sidebar">
      <header>
        <i class="far fa-user nav-a__icon"></i>&nbsp;  Hi, Admin
      </header>
      <ul class="nav">
        <li>
          <a href="admin.php?controller=category&action=list" class="nav-a">
            <i class="fab fa-elementor nav-a__icon"></i> Quản lý danh mục
          </a>
        </li>
        <li>
          <a href="#" class="nav-a">
            <i class="fas fa-align-justify nav-a__icon"></i> Quản lý thể loại
          </a>
        </li>
        <li>
          <a href="#" class="nav-a">
          <i class="fas fa-mobile nav-a__icon"></i> Quản lý sản phẩm
          </a>
        </li>
        <li>
          <a href="#" class="nav-a">
            <i class="fas fa-users nav-a__icon"></i> Quản lý khách hàng
          </a>
        </li>
        <li>
          <a href="admin.php?controller=order&action=list" class="nav-a">
          <i class="fas fa-shopping-cart nav-a__icon"></i> Quản lý đơn hàng
          </a>
        </li>
        <li>
          <a href="admin.php?controller=page&action=listContact" class="nav-a">
          <i class="fas fa-reply nav-a__icon"></i> Phản hồi
          </a>
        </li>
        <li>
          <a href="#" class="nav-a">
            <i class="far fa-star nav-a__icon"></i> Đánh giá
          </a>
        </li>
        <li>
          <a href="#" class="nav-a">
            <i class="far fa-calendar-alt nav-a__icon"></i> Thống kê
          </a>
        </li>
        <li>
          <a href="#" class="nav-a">
            <i class="fas fa-power-off nav-a__icon"></i> Đăng xuất
          </a>
        </li>
      </ul>
      
    </div>
  </div>
</div>
