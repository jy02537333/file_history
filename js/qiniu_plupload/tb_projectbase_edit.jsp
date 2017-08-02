<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
	<base href="<%=basePath%>">
	<meta charset="utf-8" />
	<title></title>
	<meta name="description" content="overview & stats" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<link href="static/css/bootstrap.min.css" rel="stylesheet" />
	<link href="static/css/bootstrap-responsive.min.css" rel="stylesheet" />
	<link rel="stylesheet" href="static/css/font-awesome.min.css" />
	<!-- 下拉框 -->
	<link rel="stylesheet" href="static/css/chosen.css" />

	<link rel="stylesheet" href="static/css/ace.min.css" />
	<link rel="stylesheet" href="static/css/ace-responsive.min.css" />
	<link rel="stylesheet" href="static/css/ace-skins.min.css" />

	<!--<link rel="stylesheet" href="static/css/datepicker.css" />日期框 -->
	<script type="text/javascript" src="<%=basePath%>static/js/My97DatePicker/WdatePicker.js"></script>
	<script type="text/javascript" src="static/js/jquery-1.7.2.js"></script>
	<script type="text/javascript" src="static/js/jquery.tips.js"></script>

	<script type="text/javascript">


		//保存
		function save(){
			if($("#tfProjectCode").val()==""){
				$("#tfProjectCode").tips({
					side:3,
					msg:'请输入项目编号',
					bg:'#AE81FF',
					time:2
				});
				$("#tfProjectCode").focus();
				return false;
			}
			if($("#tfProjectName").val()==""){
				$("#tfProjectName").tips({
					side:3,
					msg:'请输入项目名称',
					bg:'#AE81FF',
					time:2
				});
				$("#tfProjectName").focus();
				return false;
			}
			if($("#tfProjectShortName").val()==""){
				$("#tfProjectShortName").tips({
					side:3,
					msg:'请输入项目简称',
					bg:'#AE81FF',
					time:2
				});
				$("#tfProjectShortName").focus();
				return false;
			}
			if($("#tfProjectType").val()==""){
				$("#tfProjectType").tips({
					side:3,
					msg:'请选择项目类型',
					bg:'#AE81FF',
					time:2
				});
				$("#tfProjectType").focus();
				return false;
			}
			if($("#tfProjectNature").val()==""){
				$("#tfProjectNature").tips({
					side:3,
					msg:'请选择项目性质',
					bg:'#AE81FF',
					time:2
				});
				$("#tfProjectNature").focus();
				return false;
			}
			if($("#tfManagementModel").val()==""){
				$("#tfManagementModel").tips({
					side:3,
					msg:'请选择管理模式',
					bg:'#AE81FF',
					time:2
				});
				$("#tfManagementModel").focus();
				return false;
			}
			if($("#tfProjectState").val()==""){
				$("#tfProjectState").tips({
					side:3,
					msg:'请选择项目状态',
					bg:'#AE81FF',
					time:2
				});
				$("#tfProjectState").focus();
				return false;
			}
			if($("#tfConstructionUnitId").val()==""){
				$("#tfConstructionUnitId").tips({
					side:3,
					msg:'请输入建设单位',
					bg:'#AE81FF',
					time:2
				});
				$("#tfConstructionUnitId").focus();
				return false;
			}
			if($("#tfAgentConstructionUnitId").val()==""){
				$("#tfAgentConstructionUnitId").tips({
					side:3,
					msg:'请输入代建单位',
					bg:'#AE81FF',
					time:2
				});
				$("#tfAgentConstructionUnitId").focus();
				return false;
			}
			if($("#tfAgentConstrImplementUnitId").val()==""){
				$("#tfAgentConstrImplementUnitId").tips({
					side:3,
					msg:'请输入代建实施单位',
					bg:'#AE81FF',
					time:2
				});
				$("#tfAgentConstrImplementUnitId").focus();
				return false;
			}
			if($("#tfProjectLegal").val()==""){
				$("#tfProjectLegal").tips({
					side:3,
					msg:'请输入项目法人',
					bg:'#AE81FF',
					time:2
				});
				$("#tfProjectLegal").focus();
				return false;
			}
			if($("#tfProjectStartPoint").val()==""){
				$("#tfProjectStartPoint").tips({
					side:3,
					msg:'请输入工程起点',
					bg:'#AE81FF',
					time:2
				});
				$("#tfProjectStartPoint").focus();
				return false;
			}
			if($("#tfProjectEndPoint").val()==""){
				$("#tfProjectEndPoint").tips({
					side:3,
					msg:'请输入工程终点',
					bg:'#AE81FF',
					time:2
				});
				$("#tfProjectEndPoint").focus();
				return false;
			}
			if($("#tfProjectMileage").val()==""){
				$("#tfProjectMileage").tips({
					side:3,
					msg:'请输入里程长度（km）',
					bg:'#AE81FF',
					time:2
				});
				$("#tfProjectMileage").focus();
				return false;
			}
			if($("#tfRoadWidth").val()==""){
				$("#tfRoadWidth").tips({
					side:3,
					msg:'请输入路幅宽度（m）',
					bg:'#AE81FF',
					time:2
				});
				$("#tfRoadWidth").focus();
				return false;
			}
			if($("#tfDesignSpeed").val()==""){
				$("#tfDesignSpeed").tips({
					side:3,
					msg:'请输入设计时速（km/h）',
					bg:'#AE81FF',
					time:2
				});
				$("#tfDesignSpeed").focus();
				return false;
			}
			if($("#tfTotalInvestment").val()==""){
				$("#tfTotalInvestment").tips({
					side:3,
					msg:'请输入总投资（万元）',
					bg:'#AE81FF',
					time:2
				});
				$("#tfTotalInvestment").focus();
				return false;
			}
			if($("#tfLandExproRemovalFee").val()==""){
				$("#tfLandExproRemovalFee").tips({
					side:3,
					msg:'请输入征拆费（万元）',
					bg:'#AE81FF',
					time:2
				});
				$("#tfLandExproRemovalFee").focus();
				return false;
			}
			if($("#tfConstrInstallFee").val()==""){
				$("#tfConstrInstallFee").tips({
					side:3,
					msg:'请输入建安费（万元）',
					bg:'#AE81FF',
					time:2
				});
				$("#tfConstrInstallFee").focus();
				return false;
			}
			if($("#tfMainStructure").val()==""){
				$("#tfMainStructure").tips({
					side:3,
					msg:'请输入主要结构物',
					bg:'#AE81FF',
					time:2
				});
				$("#tfMainStructure").focus();
				return false;
			}
			if($("#tfProjectDesc").val()==""){
				$("#tfProjectDesc").tips({
					side:3,
					msg:'请输入项目描述',
					bg:'#AE81FF',
					time:2
				});
				$("#tfProjectDesc").focus();
				return false;
			}
			if($("#tfPlanStartTime").val()==""){
				$("#tfPlanStartTime").tips({
					side:3,
					msg:'请输入计划开工日期',
					bg:'#AE81FF',
					time:2
				});
				$("#tfPlanStartTime").focus();
				return false;
			}
			if($("#tfPlanEndTime").val()==""){
				$("#tfPlanEndTime").tips({
					side:3,
					msg:'请输入计划完工日期',
					bg:'#AE81FF',
					time:2
				});
				$("#tfPlanEndTime").focus();
				return false;
			}
			$("#Form").submit();
			$("#zhongxin").hide();
			$("#zhongxin2").show();
		}

	</script>
</head>
<body>
<form action="tb_projectbase/${msg }.do"   name="Form" id="Form" method="post">
	<input type="hidden" name="TFID" id="TFID" value="${pd.TFID}"/>
	<input type="hidden" name="tfSysUserId" id="tfSysUserId" value="${pd.tfSysRolesId}"/>
	<input type="hidden" name="tfSysRolesId" id="tfSysRolesId" value="${pd.tfSysRolesId}"/>
	<input type="hidden" name="tfSysDeptId" id="tfSysDeptId" value="${pd.tfSysDeptId}"/>
	<input type="hidden" name="tfSysUnitId" id="tfSysUnitId" value="${pd.tfSysUnitId}"/>
	<input type="hidden" name="tfDeleteFlag" id="tfDeleteFlag" value="${pd.tfDeleteFlag}"/>
	<input type="hidden" name="tfCreateTime" id="tfCreateTime" value="${pd.ttfCreateTime}"/>
	<div id="zhongxin">
		<table id="table_report" class="table table-striped table-bordered table-hover">
			<tr>
				<td style="width:120px;text-align: right;padding-top: 13px;">项目编号:</td>
				<td><input class="inputCode" style='width:99%;' type="text" name="tfProjectCode" id="tfProjectCode" value="${pd.tfProjectCode}" maxlength="32" placeholder="这里输入项目编号" title="项目编号"/></td>
			</tr>
			<tr>
				<td style="width:120px;text-align: right;padding-top: 13px;">项目名称:</td>
				<td><input style='width:99%;' type="text" name="tfProjectName" id="tfProjectName" value="${pd.tfProjectName}" maxlength="32" placeholder="这里输入项目名称" title="项目名称"/></td>
			</tr>
			<tr>
				<td style="width:120px;text-align: right;padding-top: 13px;">项目简称:</td>
				<td><input style='width:99%;' type="text" name="tfProjectShortName" id="tfProjectShortName" value="${pd.tfProjectShortName}" maxlength="32" placeholder="这里输入项目简称" title="项目简称"/></td>
			</tr>
			<tr>
				<td style="width:120px;text-align: right;padding-top: 13px;">项目类型:</td>
				<td>
					<select name="tfProjectType" id="tfProjectType">
						<option value="">--请选择--</option>
						<option value="0">房建工程</option>
						<option value="1">基建工程</option>
						<option value="2">养护工程</option>
						<option value="3">市政基础建设工程</option>
						<option value="4">水环境治理工程</option>
						<option value="5"> 园林绿化工程</option>
						<option value="6">PPP工程</option>
						<option value="7">其它工程</option>
					</select>
				</td>
			</tr>
			<tr>
				<td style="width:120px;text-align: right;padding-top: 13px;">项目性质:</td>
				<td>
					<select name="tfProjectNature" id="tfProjectNature" >
						<option value="">--请选择--</option>
						<option value="0">待定  </option>
						<option value="1">新建</option>
						<option value="2">改扩建</option>
						<option value="3">续建 </option>
						<option value="4">迁建</option>
						<option value="5">养护</option>
						<option value="6">维修</option>
					</select>
				</td>
			</tr>
			<tr>
				<td style="width:120px;text-align: right;padding-top: 13px;">管理模式:</td>
				<td>
					<select name="tfManagementModel" id="tfManagementModel">
						<option value="">--请选择--</option>
						<option value="0">待定 </option>
						<option value="1">监管模式</option>
						<option value="2">二级管理模式</option>
					</select>
				</td>
			</tr>
			<tr>
				<td style="width:120px;text-align: right;padding-top: 13px;">项目状态:</td>
				<td>
					<select name="tfProjectState" id="tfProjectState">
						<option value="1">待建</option>
						<option value="2">在建</option>
						<option value="3">暂停</option>
						<option value="4">完工</option>
					</select>
				</td>
			</tr>
			<tr>
				<td style="width:120px;text-align: right;padding-top: 13px;">建设单位:</td>
				<td>

					<!-- 				<input style='width:99%;' type="text" name="tfConstructionUnitId" id="tfConstructionUnitId" value="${pd.tfConstructionUnitId}" maxlength="32" placeholder="这里输入建设单位" title="建设单位"/> -->
					<select style='width:99%;' type="text" name="tfConstructionUnitId" id="tfConstructionUnitId"></select>
				</td>
			</tr>
			<tr>
				<td style="width:120px;text-align: right;padding-top: 13px;">代建单位:</td>
				<td>
					<!-- 				<input style='width:99%;' type="text" name="tfAgentConstructionUnitId" id="tfAgentConstructionUnitId" value="${pd.tfAgentConstructionUnitId}" maxlength="32" placeholder="这里输入代建单位" title="代建单位"/> -->
					<select style='width:99%;' type="text" name="tfAgentConstructionUnitId" id="tfAgentConstructionUnitId"></select>
				</td>
			</tr>
			<tr>
				<td style="width:120px;text-align: right;padding-top: 13px;">代建实施单位:</td>
				<td>
					<!-- 				<input style='width:99%;' type="text" name="tfAgentConstrImplementUnitId" id="tfAgentConstrImplementUnitId" value="${pd.tfAgentConstrImplementUnitId}" maxlength="32" placeholder="这里输入代建实施单位" title="代建实施单位"/> -->
					<select style='width:99%;' type="text" name="tfAgentConstrImplementUnitId" id="tfAgentConstrImplementUnitId"></select>
				</td>
			</tr>
			<tr>
				<td style="width:120px;text-align: right;padding-top: 13px;">项目法人:</td>
				<td><input style='width:99%;' type="text" name="tfProjectLegal" id="tfProjectLegal" value="${pd.tfProjectLegal}" maxlength="32" placeholder="这里输入项目法人" title="项目法人"/></td>
			</tr>
			<tr>
				<td style="width:120px;text-align: right;padding-top: 13px;">工程起点:</td>
				<td><input style='width:99%;' type="text" name="tfProjectStartPoint" id="tfProjectStartPoint" value="${pd.tfProjectStartPoint}" maxlength="32" placeholder="这里输入工程起点" title="工程起点"/></td>
			</tr>
			<tr>
				<td style="width:120px;text-align: right;padding-top: 13px;">工程终点:</td>
				<td><input style='width:99%;' type="text" name="tfProjectEndPoint" id="tfProjectEndPoint" value="${pd.tfProjectEndPoint}" maxlength="32" placeholder="这里输入工程终点" title="工程终点"/></td>
			</tr>
			<tr>
				<td style="width:120px;text-align: right;padding-top: 13px;">里程长度（km）:</td>
				<td><input class="inputDevimal" style='width:99%;' type="number" name="tfProjectMileage" id="tfProjectMileage" value="${pd.tfProjectMileage}" maxlength="32" placeholder="这里输入里程长度（km）" title="里程长度（km）"/></td>
			</tr>
			<tr>
				<td style="width:120px;text-align: right;padding-top: 13px;">路幅宽度（m）:</td>
				<td><input class="inputDevimal" style='width:99%;' type="number" name="tfRoadWidth" id="tfRoadWidth" value="${pd.tfRoadWidth}" maxlength="32" placeholder="这里输入路幅宽度（m）" title="路幅宽度（m）"/></td>
			</tr>
			<tr>
				<td style="width:120px;text-align: right;padding-top: 13px;">设计时速（km/h）:</td>
				<td><input class="inputDevimal" style='width:99%;' type="number" name="tfDesignSpeed" id="tfDesignSpeed" value="${pd.tfDesignSpeed}" maxlength="32" placeholder="这里输入设计时速（km/h）" title="设计时速（km/h）"/></td>
			</tr>
			<tr>
				<td style="width:120px;text-align: right;padding-top: 13px;">总投资（万元）:</td>
				<td><input class="inputDevimal" decimalNum="4" style='width:99%;' type="text" name="tfTotalInvestment" id="tfTotalInvestment"
						   value="${pd.tfTotalInvestment}" maxlength="15" placeholder="这里输入总投资（万元）" title="总投资（万元）"
						/></td>
			</tr>
			<tr>
				<td style="width:120px;text-align: right;padding-top: 13px;">征拆费（万元）:</td>
				<td><input class="inputDevimal" decimalNum="4"  style='width:99%;' type="number" name="tfLandExproRemovalFee" id="tfLandExproRemovalFee"
						   value="${pd.tfLandExproRemovalFee}" maxlength="15" placeholder="这里输入征拆费（万元）" title="征拆费（万元）"/></td>
			</tr>
			<tr>
				<td style="width:120px;text-align: right;padding-top: 13px;">建安费（万元）:</td>
				<td><input class="inputDevimal" decimalNum="4"  style='width:99%;' type="number" name="tfConstrInstallFee" id="tfConstrInstallFee"
						   value="${pd.tfConstrInstallFee}" maxlength="15" placeholder="这里输入建安费（万元）" title="建安费（万元）"/></td>
			</tr>
			<tr>
				<td style="width:120px;text-align: right;padding-top: 13px;">主要结构物:</td>
				<td><input style='width:99%;' type="text" name="tfMainStructure" id="tfMainStructure" value="${pd.tfMainStructure}"
						   maxlength="15" placeholder="这里输入主要结构物" title="主要结构物"/></td>
			</tr>
			<tr>
				<td style="width:120px;text-align: right;padding-top: 13px;">项目描述:</td>
				<td><input style='width:99%;' type="text" name="tfProjectDesc" id="tfProjectDesc" value="${pd.tfProjectDesc}" maxlength="15" placeholder="这里输入项目描述" title="项目描述"/></td>
			</tr>
			<tr>
				<td style="width:120px;text-align: right;padding-top: 13px;">计划开工日期:</td>
				<td><input class="span10 date-picker" style='width:99%;' type="text" name="tfPlanStartTime" id="tfPlanStartTime" value="${pd.tfPlanStartTime}" onfocus="WdatePicker({el:'tfPlanStartTime',dateFmt:'yyyy-MM-dd'})" readonly="readonly" placeholder="这里输入计划开工日期" title="计划开工日期"/></td>
			</tr>
			<tr>
				<td style="width:120px;text-align: right;padding-top: 13px;">计划完工日期:</td>
				<td><input class="span10 date-picker" style='width:99%;' type="text" name="tfPlanEndTime" id="tfPlanEndTime" value="${pd.tfPlanEndTime}" onfocus="WdatePicker({el:'tfPlanEndTime',dateFmt:'yyyy-MM-dd'})" readonly="readonly" placeholder="这里输入计划完工日期" title="计划完工日期"/></td>
			</tr>
			<tr>
				<td style="width:120px;text-align: right;padding-top: 13px;">实际开工日期:</td>
				<td><input class="span10 date-picker" style='width:99%;' type="text" name="tfActualStartTime" id="tfActualStartTime" value="${pd.tfActualStartTime}" onfocus="WdatePicker({el:'tfActualStartTime',dateFmt:'yyyy-MM-dd'})" readonly="readonly" placeholder="这里输入实际开工日期" title="实际开工日期"/></td>
			</tr>
			<tr>
				<td style="width:120px;text-align: right;padding-top: 13px;">实际完工日期:</td>
				<td><input class="span10 date-picker" style='width:99%;' type="text" name="tfActualEndTime" id="tfActualEndTime" value="${pd.tfActualEndTime}" onfocus="WdatePicker({el:'tfActualEndTime',dateFmt:'yyyy-MM-dd'})" readonly="readonly" placeholder="这里输入实际完工日期" title="实际完工日期"/></td>
			</tr>
			<tr>
				<td style="width:120px;text-align: right;padding-top: 13px;">附件:</td>
				<td>
					<!-- 				<input style='width:99%;' type="text" name="tfAttach" id="tfAttach" value="${pd.tfAttach}" maxlength="32" placeholder="这里输入附件,关联附件表" title="附件,关联附件表"/> -->
					<div class="container" style="width:100%!important;">
						<div class="tab-content" style="padding: 16px 25px !important;">
							<div role="tabpanel" class="tab-pane fade in active" id="demo" aria-labelledby="demo-tab">

								<div class="row" >
									<input type="hidden" id="logourl"  name="logourl" value="">
									<input type="hidden" id="domain" value="jky-gcgl"><!-- 七牛空间 -->
									<input type="hidden" id="uploadFolder" value="update/project/"><!-- 上传目录 -->
									<input type="hidden" id="isMultipart" value="true"><!--是否多图片上传 -->
									<input type="hidden" id="isFile" value="true"><!--是否多图片上传 -->
									<input type="hidden" id="uptoken_url" value="/appQiNiuUptokenCtrl/uptoken">
									<input type="hidden" id="file_json" name="file_json" value=""><!--上传成功后的文件信息，json格式 -->
									<input type="hidden" id="old_file_json" name="old_file_json" value="">
									<div class="col-md-12">
										<div id="container">
											<a class="btn btn-default btn-lg " id="pickfiles" href="#" >
												<i class="glyphicon glyphicon-plus"></i>
												<span>选择文件</span>
											</a>
											<!--<img id="showImg" style="margin-left:30px;width:50px;height:50px;" src="data:image/jpeg;base64,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">-->
										</div>
									</div>
									<!--<div style="display:none" id="success" class="col-md-12">-->
										<!--<div class="alert-success">-->
										<!--文件上传完毕-->
										<!--</div>-->
									<!--</div>-->
									<div class="col-md-12 ">
										<table class="table table-striped table-hover text-left"   style="display:none">
											<thead>
											<tr>
												<th class="col-md-4">文件名称</th>
												<th class="col-md-2">文件大小</th>
												<th class="col-md-6">状态</th>
												<th class="col-md-6">操作</th>
											</tr>
											</thead>
											<tbody id="fsUploadProgress">
											</tbody>
										</table>
									</div>
								</div>

							</div>
							<div role="tabpanel" class="tab-pane fade" id="code" aria-labelledby="code-tab">

								<div class="row" style="margin-top: 20px;">
									<div class="col-md-12">
								                        <pre><code>

														</code></pre>
									</div>
								</div>

							</div>
							<div role="tabpanel" class="tab-pane fade" id="log" aria-labelledby="log-tab">
								<pre id="qiniu-js-sdk-log"></pre>
							</div>
						</div>
					</div>
					<div id="files">

					</div>

				</td>
			</tr>
			<tr>
				<td style="width:120px;text-align: right;padding-top: 13px;">备注:</td>
				<td><input style='width:99%;' type="text" name="tfRemark" id="tfRemark" value="${pd.tfRemark}" maxlength="32" placeholder="这里输入备注" title="备注"/></td>
			</tr>
			<tr>
				<td style="text-align: center;" colspan="10">
					<a class="btn btn-mini btn-primary" onclick="save();">保存</a>
					<a class="btn btn-mini btn-danger" onclick="top.Dialog.close();">取消</a>
				</td>
			</tr>
		</table>
	</div>
	<div id="zhongxin2" class="center" style="display:none"><br/><br/><br/><br/><br/><img src="static/images/jiazai.gif" /><br/><h4 class="lighter block green">提交中...</h4></div>

</form>


<!-- 引入 -->
<script type="text/javascript">window.jQuery || document.write("<script src='static/js/jquery-1.9.1.min.js'>\x3C/script>");</script>
<script src="static/js/bootstrap.min.js"></script>
<script src="static/js/ace-elements.min.js"></script>
<script src="static/js/ace.min.js"></script>
<script src="static/js/base_data/data.js"></script>
<script src="static/util/confine.js"></script>
<script type="text/javascript" src="static/js/chosen.jquery.min.js"></script><!-- 下拉框 -->
<script type="text/javascript" src="static/plupload/scripts/plupload/js/moxie.js"></script>
<script type="text/javascript" src="static/plupload/scripts/plupload/js/plupload.dev.js"></script>
<script type="text/javascript" src="static/plupload/scripts/plupload/js/i18n/zh_CN.js"></script>
<script type="text/javascript" src="static/plupload/scripts/ui.js"></script>
<script type="text/javascript" src="static/plupload/scripts/qiniu.js"></script>
<script type="text/javascript" src="static/plupload/scripts/highlight.js"></script>
<script type="text/javascript" src="static/plupload/scripts/main.js"></script>
<link rel="stylesheet" href="static/plupload/styles/main.css" />
<script type="text/javascript">
	$(top.hangge());
	$(function() {
		hljs.initHighlightingOnLoad();
		getunitData("#tfConstructionUnitId","${pd.tfConstructionUnitId}");
		getunitData("#tfAgentConstructionUnitId","${pd.tfAgentConstructionUnitId}");
		getunitData("#tfAgentConstrImplementUnitId","${pd.tfAgentConstrImplementUnitId}");
		$("#tfProjectType").val(${pd.tfProjectType});
		$("#tfProjectNature").val(${pd.tfProjectNature});
		$("#tfManagementModel").val(${pd.tfManagementModel});
		$("#tfProjectState").val(${pd.tfProjectState});
		//单选框
		$(".chzn-select").chosen();
		$(".chzn-select-deselect").chosen({allow_single_deselect:true});
		uploader.initData("${pd.TFID}","<%=basePath %>");
	});
</script>
</body>
</html>