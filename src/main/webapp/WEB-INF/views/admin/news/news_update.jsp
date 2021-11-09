<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/layouts/taglib.jsp"%>

<title>Admin - News</title>
<body>

	<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css" rel="stylesheet">
	<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet">
	
	<link href="<c:url value="/assets/admin/css/admin_upload_file.css" />" rel="stylesheet">

	<div class="main-content">
		<div class="container-fluid">
			<div class="row">
				<div class="col-md-12">
					<div class="card ">
						<div class="header">
							<div class="col-md-8">
								<h3 class="title">
									Admin: <b>Updating News</b>
								</h3>
								<p class="category">Chỉnh sửa nội dung tin tức</p>
							</div>
							<div class="col-md-4">
								<a href="<c:url value='/admin/news/list' />" style="float: right;">
									<button type="button" class="btn btn-success btn-fill btn-wd"><b>List News</b></button>
								</a>
							</div>
						</div>
						<div class="content">
							<div class="row">
								<div class="col-md-12" style="padding-top: 2%;">
									<c:url value="/admin/updateNews?${_csrf.parameterName}=${_csrf.token}" var="updateNews" />
									<form:form action="${updateNews}" method="POST" modelAttribute="news" enctype="multipart/form-data">
									
										<div class="col-md-8" style="padding-top: 1%;">
											<table class="table table-striped">
												<tr>
													<td width="18%">Mã: </td>
													<td><form:input path="id" class="form-control" readonly="true" required="required" /></td>
												</tr>
												<tr>
													<td>Hình ảnh: </td>
													<td><form:input path="img" class="form-control" id="img_name" readonly="true" required="required" /></td>
												</tr>
												<tr>
													<td>Title: </td>
													<td><form:input path="title" class="form-control" required="required" /></td>
												</tr>
												<tr>
													<td>Content: </td>
													<td>
														<form:textarea path="content" class="form-control" rows="5" required="required"></form:textarea>
													</td>
												</tr>
												<tr>
													<td>Url: </td>
													<td><form:input path="url" class="form-control" required="required" /></td>
												</tr>
												<tr>
													<td>Classify: </td>
													<td>
														<form:select path="news_type" class="form-control" id="select2">
													    	<form:option value="0">Loại tin tức...</form:option>
													    	<c:forEach var="item" items="${ listNews_type }" varStatus="index">
													    		<form:option value="${item.id}">${item.name}</form:option>
													    	</c:forEach>
													    	<%-- <form:options items="${listNews_type}"></form:options> --%>
													  	</form:select>
													</td>
												</tr>
												<tr>
													<td>Updated by: </td>
													<td><form:input path="updated_by" value="${username}" class="form-control" readonly="true" required="required" /></td>
												</tr>
												<!-- <tr style="background-color: white;">
													<td></td>
													<td><button type="submit" class="btn btn-warning btn-fill" style="width: 20%; font-weight: bold; font-size: 18px;">Update</button></td>
												</tr> -->
											</table><br>
											<a href="javascript:void(0)" onclick="history.go(-1);">Previous page</a>
										</div>
										
										<div class="col-md-4">
											<div class="container-upload-file center">
												<div class="row">
													<div class="col-md-12">
														<h3 class="white"><b>Chọn ảnh trước khi đăng bài</b></h3>
													</div>
												</div>
												
												<div class="row">
													<div class="col-md-10 col-md-offset-1 center">
														<div class="btn-container">
															<!--the three icons: default, ok file (img), error file (not an img)-->
															<h1 class="imgupload">
																<i class="fas fa-image"></i>
															</h1>
															<h1 class="imgupload ok">
																<i class="fa fa-check"></i>
															</h1>
															<h1 class="imgupload stop">
																<i class="fa fa-times"></i>
															</h1>
															<!-- Định dạng file cho phép được upload -->
															<p id="namefile">File cho phép! (png, jpg, jpeg)</p>
															<!--our custom btn which which stays under the actual one-->
															<button type="button" id="btnup" class="btn btn-primary btn-lg">
																Chọn ảnh của bạn!
															</button>
															<!--this is the actual file input, is set with opacity=0 beacause we wanna see our custom one-->
															<input type="file" value="" name="fileup" id="fileup">
														</div>
													</div>
												</div>
												<!--additional fields-->
												<div class="row">			
													<div class="col-md-12">
														<!--the defauld disabled btn and the actual one shown only if the three fields are valid-->
														<input type="submit" value="Đăng bài!" class="btn btn-primary" id="submitbtn" onclick="return validate_form()">
														<button type="button" class="btn btn-default" disabled="disabled" id="fakebtn">
															Đăng bài! <i class="fa fa-minus-circle"></i>
														</button>
													</div>
												</div>
											</div>
										</div>
										
									</form:form>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
	
	<script src="<c:url value="/assets/admin/js/admin_upload_file.js" />"></script>
	
</body>