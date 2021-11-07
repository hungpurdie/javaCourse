<%@page import="bean.GioHangBean"%>
<%@page import="bo.GioHangBo"%>
<%@page import="java.util.ArrayList"%>
<%@page import="bean.KhachHangBean"%>
<%@page import="bo.KhachHangBo"%>
<%@page import="bean.LoaiBean"%>
<%@page import="bean.SachBean"%>
<%@page import="bo.LoaiBo"%>
<%@page import="bo.SachBo"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
	integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
	integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"
	integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js"
	integrity="sha384-w1Q4orYjBQndcko6MimVbzY0tgp4pWB4lZ7lr30WKz0vr/aWKhXdBNmNb5D92v7s"
	crossorigin="anonymous"></script>

</head>
<title>Giỏ hàng</title>
</head>
<body>

	<style>
#Modal style


.modal-login {
	width: 350px;
}

.modal-login .modal-content {
	padding: 20px;
	border-radius: 5px;
	border: none;
}

.modal-login .modal-header {
	border-bottom: none;
	position: relative;
	justify-content: center;
}

.modal-login .close {
	position: absolute;
	top: -10px;
	right: -10px;
}

.modal-login h4 {
	color: #636363;
	text-align: center;
	font-size: 26px;
	margin-top: 0;
}

.modal-login .modal-content {
	color: #999;
	border-radius: 1px;
	margin-bottom: 15px;
	background: #fff;
	border: 1px solid #f3f3f3;
	box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
	padding: 25px;
}

.modal-login .form-group {
	margin-bottom: 20px;
}

.modal-login label {
	font-weight: normal;
	font-size: 13px;
}

.modal-login .form-control {
	min-height: 38px;
	padding-left: 5px;
	box-shadow: none !important;
	border-width: 0 0 1px 0;
	border-radius: 0;
}

.modal-login .form-control:focus {
	border-color: #ccc;
}

.modal-login .input-group-addon {
	max-width: 42px;
	text-align: center;
	background: none;
	border-bottom: 1px solid #ced4da;
	padding-right: 5px;
	border-radius: 0;
}

.modal-login .btn, .modal-login .btn:active {
	font-size: 16px;
	font-weight: bold;
	background: #19aa8d !important;
	border-radius: 3px;
	border: none;
	min-width: 140px;
}

.modal-login .btn:hover, .modal-login .btn:focus {
	background: #179b81 !important;
}

.modal-login .hint-text {
	text-align: center;
	padding-top: 5px;
	font-size: 13px;
}

.modal-login .modal-footer {
	color: #999;
	border-color: #dee4e7;
	text-align: center;
	margin: 0 -25px -25px;
	font-size: 13px;
	justify-content: center;
}

.modal-login a {
	color: #fff;
	text-decoration: underline;
}

.modal-login a:hover {
	text-decoration: none;
}

.modal-login a {
	color: #19aa8d;
	text-decoration: none;
}

.modal-login a:hover {
	text-decoration: underline;
}

.modal-login .fa {
	font-size: 21px;
	position: relative;
	top: 6px;
}
</style>




	<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
	%>




	<div class="container-fuild">
		<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
			<a class="navbar-brand" href="home">Trang chủ</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>

			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav mr-auto">
					<li class="nav-item active"><a class="nav-link" href="cart">Giỏ
							hàng <span class="sr-only">(current)</span>
					</a></li>
					<li class="nav-item"><a class="nav-link" href="payment">Thanh
							Toán</a></li>

					<li class="nav-item"><a class="nav-link" href="order-history">Lịch
							sử mua hàng</a></li>
				</ul>

				<ul class="navbar-nav ml-auto mr-2">
					<%
					KhachHangBean kh = (KhachHangBean) session.getAttribute("auth");
					int flagAuth;

					if (kh != null) {
					%>
					<li class="nav-item"><a class="nav-link" href="profile">Chào
							mừng <%=kh.getHoTen()%>
					</a></li>
					<form action="signin?logout=<%=true%>" method="POST">
						<li class="nav-item"><button
								class="nav-link btn btn-sm btn-outline-secondary" href="signin">Đăng
								xuất</button></li>
					</form>
					<%
					} else {
					if (session.getAttribute("flag_auth") == null) {
						flagAuth = 0;
					} else {
						flagAuth = (int) session.getAttribute("flag_auth");
					}

					if (flagAuth == 1) {
					%>
					<script>
						alert('Thông tin tài khoản mật khẩu không chính xác');
					</script>
					<%
					}
					%>
					<li class="nav-item mr-3"><a
						class="btn btn-sm btn-outline-secondary nav-link"
						data-target="#loginModal" data-toggle="modal">Đăng nhập</a></li>
					<li class="nav-item"><a
						class="btn btn-sm btn-outline-secondary nav-link" href="signup">Đăng
							ký</a></li>
					<%
					}
					%>
				</ul>
			</div>
		</nav>


		<!-- Modal HTML -->
		<div id="loginModal" class="modal fade">
			<div class="modal-dialog modal-login">
				<div class="modal-content">
					<div class="modal-header">
						<h4 class="modal-title">Đăng nhập</h4>
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">&times;</button>
					</div>
					<div class="modal-body">
						<form action="signin" method="post">
							<div class="form-group">
								<div class="input-group">
									<span class="input-group-addon"><i class="fa fa-user"></i></span>
									<input type="text" class="form-control" name="username"
										placeholder="Tên đăng nhập" required="required">
								</div>
							</div>
							<div class="form-group">
								<div class="input-group">
									<span class="input-group-addon"><i class="fa fa-lock"></i></span>
									<input type="password" class="form-control" name="password"
										placeholder="Mật khẩu" required="required">
								</div>
							</div>
							<div class="form-group">
								<button type="submit" class="btn btn-primary btn-block btn-lg">Đăng
									nhập</button>
							</div>
							<p class="hint-text">
								<a href="forgot">Quên mật khẩu?</a>
							</p>
						</form>
					</div>
					<div class="modal-footer">
						<a href="signup">Tao mới tài khoản</a>
					</div>
				</div>
			</div>
		</div>

		<%
		if (request.getAttribute("paidSuccess") != null) {
		%>
		<div class="container mt-4">
			<div class="row">
				<div class="col">
					<div class="alert alert-success" role="alert">
						<h4 class="alert-heading">Đặt hàng hoàn tất!</h4>
						<p>Nếu quá trình đặt hàng của bạn thành công, bạn sẽ nhận được
							xác nhận đặt hàng qua địa chỉ e-mail mà bạn đã cung cấp tại trang
							thanh toán. Nếu không, xin vui lòng liên hệ với chúng tôi và
							chúng tôi có thể hỗ trợ bạn trong vấn đề này.</p>
						<hr>
						<p class="mb-0">Vui lòng lưu ý rằng thời gian giao hàng ước
							tính (3-5 ngày làm việc) là trong vòng dự tính và có thể thay đổi
							do các yếu tố tác động bên ngoài không thuộc quyền kiểm soát của
							Company và dịch vụ chuyển phát.</p>
					</div>
				</div>
			</div>
		</div>
		<%
		}
		%>

		<%@ include file="list_cart.jsp"%>
	</div>

	<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
</body>
</html>
