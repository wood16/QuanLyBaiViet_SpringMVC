<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@include file="/common/taglib.jsp"%>
<c:url var="newURL" value="/quan-tri/bai-viet/danh-sach"/>
<c:url var="editNewURL" value="/quan-tri/bai-viet/chinh-sua"/>
<c:url var="newAPI" value="/api/new"/>

<html>
<head>
<title>Chỉnh sửa bài viết</title>
</head>
<body>
	<div class="main-content">
		<div class="main-content-inner">
			<div class="breadcrumbs" id="breadcrumbs">
				<script type="text/javascript">
					try {
						ace.settings.check('breadcrumbs', 'fixed')
					} catch (e) {
					}
				</script>

				<ul class="breadcrumb">
					<li><i class="ace-icon fa fa-home home-icon"></i> <a href="#">Trang chủ</a>
					</li>

					<li><a href="#">Bài viết</a></li>
					<li class="active">Thêm mới bài viết</li>
				</ul>
				<!-- /.breadcrumb -->

				<div class="nav-search" id="nav-search">
					<form class="form-search">
						<span class="input-icon"> <input type="text"
							placeholder="Search ..." class="nav-search-input"
							id="nav-search-input" autocomplete="off" /> <i
							class="ace-icon fa fa-search nav-search-icon"></i>
						</span>
					</form>
				</div>
				<!-- /.nav-search -->
			</div>

			<div class="page-content">

				<div class="row">
					<div class="col-xs-12">
						<!-- PAGE CONTENT BEGINS -->
						<c:if test="${not empty message}">
							<div class="alert alert-${alert}">
							  ${message}
							</div>
						</c:if>
						
						
						<!-- Spring form -->
						<form:form class="form-horizontal" role="form" id="formSubmit" modelAttribute="model"> 				<!-- FORM -->
							
							<div class="form-group">
									<label class="col-sm-3 control-label no-padding-right" 
									for="form-field-select-2"><i class="ace-icon fa fa-leaf green"></i> Thể loại </label>
								  <div class="col-sm-9">
									  <%-- <select class="col-xs-10 col-sm-6"  id="categoryCode" name="categoryCode">
									    <c:forEach var="item" items="${categories}">
									    	<option value="${item.code}">${item.name}</option>
									    </c:forEach>
									  </select> --%>
									  
									  <form:select path="categoryCode" id="categoryCode">
									  	<form:option value="" label="-- Chọn thể loại --"></form:option>
									  	<form:options items="${categories}"/>
									  </form:select>
								  </div>
							</div>

							<div class="form-group">
								<label class="col-sm-3 control-label no-padding-right"
									for="form-field-1"><i class="ace-icon fa fa-leaf green"></i> Tiêu đề </label>

								<div class="col-sm-9">
									
										<form:input path="title" cssClass="col-xs-10 col-sm-6" id="title"/>
								</div>
							</div>
							
							<div class="form-group">
								<label class="col-sm-3 control-label no-padding-right"
									for="form-field-1"><i class="ace-icon fa fa-leaf green"></i> Ảnh </label>

								<div class="col-sm-9">
									<div class="col-xs-10 col-sm-6">
										<label class="ace-file-input ace-file-multiple">
											<input type="file" id="thumbnail" name="thumbnail"
											class="col-xs-10 col-sm-5" />
											<span class="ace-file-container" data-title="Drop images here or click to choose">
												<span class="ace-file-name" data-title="No File ...">
													<i class=" ace-icon ace-icon fa fa-picture-o"></i>
												</span>
											</span>
										</label>	
									</div>
								</div>
							</div>

							<div class="form-group">
								<label class="col-sm-3 control-label no-padding-right"
									for="form-field-1"><i class="ace-icon fa fa-leaf green"></i> Mô tả ngắn </label>
								<div class="col-sm-9">
										
								  		<form:textarea path="shortDescription" rows="4" cssClass="col-xs-10 col-sm-6" id="shortDescription"/>
								</div>
							</div>

							<div class="form-group">
								<label class="col-sm-3 control-label no-padding-right"
									for="form-field-1"><i class="ace-icon fa fa-leaf green"></i> Nội dung </label>
								<div class="col-sm-9">
								  		
								  		<form:textarea path="content" rows="10" cssClass="col-xs-10 col-sm-6" id="content"/>
								  </div>
							</div>

							<form:hidden path="id" id="newId"/>
							
							<!-- Submit -->

							<div class="clearfix form-actions">
								<div class="col-md-offset-3 col-md-9">
								
								
								<c:if test="${not empty model.id}">
									<button class="btn btn-info" type="button" id="btnAddOrUpdate">
										<i class="ace-icon fa fa-check bigger-110"></i> Cập nhật
									</button>
								</c:if>
								
								
								<c:if test="${empty model.id}">
									<button class="btn btn-info" type="button" id="btnAddOrUpdate">
										<i class="ace-icon fa fa-check bigger-110"></i> Thêm mới
									</button>
								</c:if>
									

									&nbsp; &nbsp; &nbsp;
									<button class="btn" type="reset">
										<i class="ace-icon fa fa-undo bigger-110"></i> Reset
									</button>
								</div>
							</div>
						</form:form>
					</div>
					<!-- /.col -->
				</div>
				<!-- /.row -->
			</div>
			<!-- /.page-content -->
		</div>
	</div>
	<!-- main content -->
<script>
	$('#btnAddOrUpdate').click(function (e){
		// neu khong khai bao thi mac dinh se submit vao url hien tai dang dung
		e.preventDefault();
		var data = {};
		var formData = $('#formSubmit').serializeArray();
		$.each(formData, function(i,v){
			data["" + v.name +""] = v.value;
		});
		
		var id = $('#newId').val();
		if(id == ""){
			addNew(data);
		}
		else{
			updateNew(data);
		}
		/* console.log(formData); */
		
	});
	
	function addNew(data){
		$.ajax({
            url: '${newAPI}',
            type: 'POST',
            contentType: 'application/json',
            data: JSON.stringify(data),
            dataType: 'json',
            success: function (result) {
            	window.location.href = "${editNewURL}?id="+result.id+"&message=insert_success";
            },
            error: function (error) {
            	window.location.href = "${newURL}?page=1&limit=2&message=error_system";
            }
        });
	}
	function updateNew(data){
		$.ajax({
            url: '${newAPI}',
            type: 'PUT',
            contentType: 'application/json',
            data: JSON.stringify(data),
            dataType: 'json',
            success: function (result) {
            	window.location.href = "${editNewURL}?id="+result.id+"&message=update_success";
            },
            error: function (error) {
            	window.location.href = "${editNewURL}?id="+result.id+"&message=error_system";
            }
		});
	}
		
	
</script>
</body>
</html>
