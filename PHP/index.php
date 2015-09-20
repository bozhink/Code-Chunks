<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script type='text/javascript'>
// <![CDATA[


function addTag(tag) { 
	o = document.addform; 
	tags = o.story_tags.value;
	while (tags.substring(tags.length-1, tags.length) == ' ') {
		tags = tags.substring(0,tags.length-1);
	}	
	tags = tags + " " + tag + " ";
	o.story_tags.value=tags; 
	document.addform.submit();
} 

function deleteTag(tag) { 
	o = document.addform; 
	tags = o.story_tags.value;
	newtags = tags.replace(tag,"");
	o.story_tags.value=newtags;
	o.tag_update.value=1;
	document.addform.submit();
} 


function doconfirm(text,url) {
	if (confirm(text)) document.location = url;
}

function doWindow(name,width,height) {
	var win = window.open("",name,"toolbar=no,location=no,directories=no,status=yes,scrollbars=yes,resizable=yes,copyhistory=no,width="+width+",height="+height);
	win.focus();
}

function sendWindow(name,width,height,url) {
	var win = window.open("",name,"toolbar=no,location=no,directories=no,status=yes,scrollbars=yes,resizable=yes,copyhistory=no,width="+width+",height="+height);
	win.document.location=url.replace(/&amp;/, '&');
	win.focus();
}

function typeChange() {
	if (document.addform) f = document.addform;
	else f = document.storyform;
	f.typeswitch.value=1;
	f.submit();
}

function submitForm() {
	if (typeof(window.editor) != "undefined") {
		window.editor._textArea.value = editor.getHTML();
	}
	document.addform.submit();
}

function submitFormLink(step) {
	if (typeof(window.editor) != "undefined") {
		window.editor._textArea.value = editor.getHTML();
	}
	document.addform.step.value = step;
	document.addform.submit();
}

function submitPrevButton() {
	document.addform.prevbutton.value = '1';
	if (typeof(window.editor) != "undefined") {
		window.editor._textArea.value = editor.getHTML();
	}
	document.addform.submit();
}

function submitNextButton() {
	document.addform.nextbutton.value = '1';
	if (typeof(window.editor) != "undefined") {
		window.editor._textArea.value = editor.getHTML();
	}
	document.addform.submit();
}

function cancelForm() {
	document.addform.cancel.value = '1';
	if (typeof(window.editor) != "undefined") {
		window.editor._textArea.value = editor.getHTML();
	}
	document.addform.submit();
}

function delEditor(n) {
	if (confirm('ALERT: Removing an editor will completely remove all their permissions from every part of your site! If you wish to revoke privileges for this part only, uncheck all the associated boxes instead of removing them. Continue if you are sure you want to remove all privileges for this user.')) {		
		f = document.addform;
		f.edaction.value = 'del';
		f.edname.value = n;
		document.forms["addform"].submit();
	}
}

/*
    Copyright Robert Nyman, http://www.robertnyman.com
    Free to use if this text is included
*/
function getElementsByAttribute(oElm, strTagName, strAttributeName, strAttributeValue){
    var arrElements = (strTagName == "*" && oElm.all)? oElm.all : oElm.getElementsByTagName(strTagName);
    var arrReturnElements = new Array();
    var oAttributeValue = (typeof strAttributeValue != "undefined")? new RegExp("(^|\\s)" + strAttributeValue + "(\\s|$)") : null;
    var oCurrent;
    var oAttribute;
    for(var i=0; i<arrElements.length; i++){
        oCurrent = arrElements[i];
        oAttribute = oCurrent.getAttribute(strAttributeName);
        if(typeof oAttribute == "string" && oAttribute.length > 0){
            if(typeof strAttributeValue == "undefined" || (oAttributeValue && oAttributeValue.test(oAttribute))){
                arrReturnElements.push(oCurrent);
            }
        }
    }
    return arrReturnElements;
}

// ]]>
</script>
	
	<style type="text/css">
		/* Default Styles */
		
		body {
			margin: 0px;
		}
		
		.desc {
			padding-left: 20px;
			font-size: 11px;
			margin-bottom: 5px;
		}
		
		input.small {
			font-size: 10px;
			vertical-align: middle;	
		}
		
		.small { font-size: 10px; }
		
		.title {
			font-size: 16px;
		}
		
		.smaller {font-size: smaller;}
		
		.contenttitle {font-weight: bolder;}
		
		.story {
			margin-bottom: 10px
		}
		
		.contentinfo {
			margin-top: 10px;
			font-size: 10px;
			text-align: right;
		}
		
		.content {padding-bottom: 5px;}
		
		.red {color: #900;}
		.green {color: #070;}
		
		.breadcrumbs {
			text-align: left;
			margin-bottom: 5px; 
			margin-left: 10px; 
			font-size: 9px;
		}
		
		.multi_page_links {
			text-align: right;
		}
		
		.rss_link {
			text-align: right;
			font-size: 9px;
		}
		
		.previous_page_link {
			font-size: 11px; 
			float: left; 
			text-align: left;
		}
		
		.next_page_link {
			font-size: 11px; 
			text-align: right;
		}
		
		.nav_extras {
			text-align: right;
		}
		
		/*********************************************************
		 * Versioning styles
		 *********************************************************/
		.version_table {
			width: 100%;
		}
		
		.version_table td {
			width: 50%;
			vertical-align: top;
			border: 1px dotted #CCC;
		}
		
		.version_table th .timestamp {
			font-weight: normal;
		}
		
		.version_table thead th {
			text-align: left;
			font-weight: bold;
			padding-top: 10px;
		}
		
		.diff_table {
			width: 100%;
		}		
		
		.diff_table thead th {
			text-align: left;
			font-weight: bold;
			padding-top: 10px;
			border-bottom: 1px dotted #CCC;
		}
		
		.diff_table td {
			text-align: center;
		}
		.diff_table .diff-context {
			text-align: left;
		}
		
		.diff_table .diff-addedline {
			color: #000;
			text-align: left;
			background-color: #CFC;
			width: 45%;
		}
		
		.diff_table .diff-deletedline {
			color: #000;
			text-align: left;
			background-color: #FCC;
			width: 45%;
		}
	
	</style>
<style type='text/css'>

body {
	 background-color: #FFFFFF; 
}



/* ------------------------------------------ */
/*  REQUIRED CLASSES    */
/* ------------------------------------------ */

/*    LINKS   */
a {
	color: #990000;
	text-decoration: none;
}

.sectionnav { 
	font-size: 12px;
}

.sidesectionnav { 
	font-size: 12px;
	border-top: 1px solid #000033; 
	border-bottom: 1px solid #000033;
	padding-top: 2px; 
	padding-bottom: 2px;
}

.nav { 
	font-size: 12px;
}

.subnav { 
	margin-left: 7px;
	font-size: 12px;
}

a:hover {
	text-decoration: underline;
}

body { 
	color: #444;
	font-family: Verdana, Arial, Helvetica, sans-serif;
	font-size: 12px;
}

div.hr {
	height: 1px;
	color: #000033;
    background-color: #000033;
    margin-top: 5px;
	margin-bottom: 5px;
	clear: both;
}

div.hr hr {
  display: none;
}


div.story {
	clear: both;
}

div.edit_links {
	 clear: both;
	 text-align: right;
}



/*    INPUT BUTTONS    */
.button {
	color: #000000;
	border: 1px solid #555;
	background-color: #FFFFFF;
	color: #000000;
}

/*     TEXTFIELDS    */
.textfield {
	color: #000000;
	border: 1px solid #555;
	background-color: #fff;
}

input.small {
	font-size: 10px;
	vertical-align: middle;	
}


select, textarea, input {
	font-size: 12px;
}

/*		THE STATUS BAR      */
.headerbox {
	padding: 0px;
	margin-left: 0px;
	margin-right: 0px;
	text-align: right;
}



/*     THE BUTTONS IN EDIT MODE (for delete, edit, etc)    */
.btnlink {
	color: #990000;
	font-size: 10px;
	border: 1px solid #990000;
	padding-left: 1px;
	padding-right: 1px;
/* 	width: 15px; */
	margin-right: 0px;
}

.btnlink2 {
	color: #990000;
	font-size: 10px;
	border: 1px solid #990000;
	padding: 3px;
	margin-bottom: 7px;
}

.versions {
	color: #990000;
	border: 1px solid #990000;
	padding-left: 3px;
	padding-right: 3px;
	padding-top: 3px;
	padding-bottom: 3px;/* 	width: 15px; */
	margin-right: 0px;
}

/*     BLOCK DIVIDERS           */
.block {
	height: 1px;
	border: 1px dashed;
}

/*     TITLES           */
.title {
	color: #aaa;
	border-bottom: 1px solid #aaa;
	padding: 5px;
	font-size: 16px;
	padding-left: 0px;
	margin-bottom: 7px;
	font-variant: small-caps;
	font-weight: bolder;
}

.title2 {
	border-bottom: 1px solid #aaa;
	padding: 3px;
	font-size: 12px;
	padding-left: 0px;
	margin-bottom: 3px;

}

.foundtext {
	font-weight: bold;
}

th {
	font-size: 12px;
	font-weight: normal;
	color: #777;
	background-color: #e9e9e9;
}

.td0, .td1 {
	font-size: 10px;
	font-weight: normal;
	color: #333;
	padding: 2px;
}

.td1 { background-color: #f6f6ff; }
.td0 { background-color: #e6e6ff; }

.inlineth {
	font-size: 14px;
	font-weight: bold;
	font-variant: small-caps;
	background-color: #f6f6f6;
	color: #aaa;
	padding-left: 30px;
}

/*      DATE AND TIME DISPLAYS, ETC (below content blocks)  */
.contentinfo {
	color: #999;
}

.contentinfo2 {
	color: #999;
	border: 1px solid #990000;
	padding-left: 1px;
	padding-right: 1px;
}

.editinfo {
	font-size: 10px;
	color: #999;
	border-bottom: 1px solid #999;
	margin-bottom: 20px;
}


/*      THE, UH, I FORGOT (oh yeah... the download bar thingy)  */
.downloadbar {
		border: 1px solid #999;
	padding: 5px;
	padding-left: 15px;
}

/*********************************************************
 * Discussion Styles
 *********************************************************/
.subject { 
	font-weight: bolder; 
	font-color: #666666;
}

.subject a {
	color: #666666;
}

.dtext {
	padding-top: 0px;
	padding-bottom: 20px;
	padding-left: 0px;
	padding-right: 0px;
}


.dheader {
	font-size: 14px;
	font-color: #666666;
	color: #666666;
	border-top: 1px solid #000033;
	border-bottom: 1px solid #000033;
	background: #FFFFFF;
	padding-left: 5px;
	padding-top: 5px;
}

.dheader a {
	color: #666666;
}

.dheader2 {
	border-top: 1px solid #000033;
	border-bottom: 1px solid #000033;
	background: #FFFFFF;
	color: #666666;
	padding-right: 5px;
	padding-top: 5px;
}

.dheader2 a {
	color: #666666;
}


.dheader3 {
	border: 1px solid #000033;
	background: #FFFFFF;
	color: #666666;
	font-color: #666666;
	padding-left: 5px;
	padding-right: 5px;
}

.dheader3 a {
	color: #666666;
}


.dinfo1 {
	border: 1px solid #000;
	border: 1px solid #000033;
	padding-left: 2px;
	padding-right: 2px;
}

/*********************************************************
 * Version Styles
 *********************************************************/

.versionborders {
	border-bottom: 1px dotted #000033;
}

.versionshade {
	border-bottom: 1px dotted #000033;
}

/* ------------------------------------------ */
/* THEME-SPECIFIC CLASSES */
/* ------------------------------------------ */


.leftnav {
/* 	float: left; */
	border-right: 1px dashed #000033;
	width: 150px;
	padding: 5px;
	vertical-align: top;
}
.rightnav {
/* 	float: left; */
	border-left: 1px dashed #000033;
	width: 150px;
	padding: 5px;
	vertical-align: top;
}


.header {
	margin-bottom: 0px;
	background: #FFFFFF;	
}

.heading {
	border-top: 1px solid #000033; 
	border-bottom: 1px solid #000033; 
	padding-top: 2px; padding-bottom: 2px;
}

.heading2 {
	border-top: 1px solid #000033; 
	padding-top: 2px; padding-bottom: 2px;
}


.topnav {
	padding: 5px;
	background: #FFFFFF;

}

.contentarea {
	vertical-align: top;
	padding: 10px;
	background-color: #fff;
	border-bottom: 1px dashed #000033;
	border-top: 1px dashed #000033;
//	border-right: 1px dashed #000033;
//	border-left: 1px dashed #000033;


}

.contenttable {
	background-color: #fff;
	border-right: 1px dashed #000033;
	border-left: 1px dashed #000033;

}


.content {
	padding: 10px;

}


.status {
	padding: 5px;
	margin-right: 5px;
	background: #FFFFFF;
	color: #999999;
}

.status a {
	color: #666666;
	text-decoration: none;
}

.status a:hover {
	text-decoration: underline;
}


.subject { 
	font-weight: bolder; 
}

.dtext {
	padding-top: 0px;
	padding-bottom: 20px;
	padding-left: 0px;
	padding-right: 0px;
}

.dheader {
	font-size: 14px;
	border-top: 1px solid #000033;
	border-bottom: 1px solid #000033;
	background: #FFFFFF;
	padding-left: 5px;
	padding-top: 5px;
}

.dheader2 {
	border-top: 1px solid #000033;
	border-bottom: 1px solid #000033;
	background: #FFFFFF;
	padding-right: 5px;
	padding-top: 5px;
}

.dheader3 {
	border: 1px solid #000033;
	background: #FFFFFF;
	padding-left: 5px;
	padding-right: 5px;
}

.dinfo1 {
	border: 1px solid #000;
	padding-left: 2px;
	padding-right: 2px;
}


</style><title>SCIENCE > Section One > Page One</title>
</head>
<body style='margin: 0px'>




<table width='100%' cellpadding='0' cellspacing='0' >
		<tr>	
	<td class='header'>
	<table  width='95%' align='center' cellpadding='0' cellspacing='0'>
		<tr><td>
	<div class='status'><div style='height: 32px; overflow: hidden;'><script type="JavaScript">
 var ol_textfont = "Arial,Geneva,Helvetica,sans-serif";
				 var ol_fgcolor =  "#FFFFCC";
				 var ol_bgcolor = "#FAE952";
				 var ol_textcolor = "#000000";
				 var ol_captionfont = "Arial,Geneva,Helvetica,sans-serif";
				 var ol_capcolor = "#000000";
				 var ol_textsize = "2";
				 var ol_captionsize = "2";
				 var ol_closesize = "2";
			</script>
			<div id="overDiv" style="position:absolute; visibility:hidden; z-index:1000;"></div>
			<script type="JavaScript" src="themes/common/overlib.js"></script>
			<form action='?&amp;action=site&amp;site=admin&amp;section=23&amp;page=76&amp;story=51&amp;detail=51' id='loginform' name='loginform' method='post'>
<table width='100%' cellspacing='0' cellpadding='0'><tr><td align='left' class='small'><a href='?' class='navlink'>home</a> 
 | <a href='username_lookup.php?' onclick='doWindow("lookup",300,300)' target='lookup' class='navlink'>directory</a> | <a href='viewlogs.php?&amp;site=admin' target='sites' onclick='doWindow("sites",600,600)' class='navlink'>tracking</a>
 | <a href='users.php?' target='sites' onclick='doWindow("sites",700,600)' class='navlink'>admin tools</a>
</td><td align='right' class='headerbox small'>Administrator (administrator)  | <a href='?login=logout&amp;action=site&amp;site=admin&amp;section=23&amp;page=76&amp;story=51&amp;detail=51' class='navlink'>logout</a>
<br /> change active user: <input type='text' name='changeauser' size='10' class='textfield small'/> <input type='submit' class='button small' value='GO'/>
<input type='hidden' name='action' value='change_auser' /></td></tr></table></form>
</div></div><div align='center' style='margin-bottom: 3px'></div>
			<div style='float: right; margin-right: 0px; height: 20px; overflow: hidden;'><form action='?&amp;site=admin&amp;section=23&amp;page=76&amp;action=site&amp;site=admin&amp;section=23&amp;page=76&amp;story=51&amp;detail=51' id='search' name='search' method='get'>

	<div class='headerbox small' align='center'>
 
		<input type='text' class='textfield small' name='search' size='9' value=''/>
		<input type='hidden' name='site' value='admin'/>
		<input type='hidden' name='section' value='23'/>
		<input type='hidden' name='page' value='76'/>
		<input type='hidden' name='action' value='site'/>
		<input type='submit' class='button small' name='button' value='Find'/><br />
	</div>

</form>

			</div>
			<div style='float: left; '><div class='breadcrumbs'><a href='?&amp;action=site&amp;site=admin' class='navlink'>SCIENCE</a> &gt; <a href='?&amp;action=site&amp;site=admin&amp;section=23' class='navlink'>Section One</a> &gt; <a href='?&amp;action=site&amp;site=admin&amp;section=23&amp;page=76' class='navlink'>Page One</a></div>
			</div>	</td></tr>
	</table>
	</td></tr>
		<tr>
	<td class='topnav' align='center'>
	<div class='sectionnav'>
Section One | <a href='?&amp;site=admin&amp;section=24&amp;action=site'  class='navlink' >Section Two</a>

	<div class='nav_extras'></div>
</div>
	</td>
	</tr>
		<tr>
	<td class='contentarea'>
	
	<table  width='95%' align='center' cellpadding='0' cellspacing='0'>
		<tr>
		
						<td class='leftnav'>

				<table width='100%' cellpadding='2' cellspacing='0'>
					<tr>
						<td>

						</td>
					</tr>

<!-- Start Nav Item 76 -->
					<tr>
						<td>

							<div class='nav'><a href='?&amp;site=admin&amp;section=23&amp;page=76&amp;action=site' target='_self'  class='navlink' ><b>Page One</b></a>

							</div>
						</td>
					</tr>
<!-- End Nav Item -->
<!-- Start Nav Item 77 -->
					<tr>
						<td>

							<div class='nav'><a href='?&amp;site=admin&amp;section=23&amp;page=77&amp;action=site' target='_self'  class='navlink' >Page Two</a>

							</div>
						</td>
					</tr>
<!-- End Nav Item -->
<!-- Start Nav Item 78 -->
					<tr>
						<td>

							<div class='nav'><a href='?&amp;site=admin&amp;section=23&amp;page=78&amp;action=site' target='_self'  class='navlink' >Page Three</a>

							</div>
						</td>
					</tr>
<!-- End Nav Item -->
				</table>
<div class='nav_extras'></div>

						</td>
		<td class='content' valign='top'>
		
<table width='100%' id='maintable' cellspacing='1'>
	<tr>
		<td align='left' class='title'>
			<a href='index.php?action=site&amp;site=admin&amp;section=23&amp;page=76'>Page One</a>
			&gt; ÐŸÑ€ÐµÐ´Ð½Ð°Ð·Ð½Ð°Ñ‡ÐµÐ½Ð¸Ðµ Ð½Ð° ÑÐ°Ð¹Ñ‚Ð° &gt; in depth
		</td>
	</tr>
	<tr>
		<td align='left'>
			<strong>ÐŸÑ€ÐµÐ´Ð½Ð°Ð·Ð½Ð°Ñ‡ÐµÐ½Ð¸Ðµ Ð½Ð° ÑÐ°Ð¹Ñ‚Ð°</strong>
		</td>
	</tr>
	<tr>
		<td style='padding-bottom: 15px; font-size: 12px'>
			Целта на този сайт е да се превърне в един от големите научни on-line портали, въпреки че няма вид на нещо сериозно.
		</td>
	</tr>
	<tr>
		<td style='padding-bottom: 15px; font-size: 12px'>
			
		</td>
	</tr>
</table>
<table>
	<tr>
		<td align='left'>
			<br /><a href='index.php?action=site&amp;site=admin&amp;section=23&amp;page=76'>Page One</a> &gt; in depth</td>
	</tr></table>

				<br />
				<div class='rss_link'>
					<a href='/e-learning/index.php?&amp;action=rss&amp;site=admin&amp;section=23&amp;page=76&amp;story=51&amp;detail=51'>
						<img border='0' src='themes/common/images/rss_icon02.png' alt='rss' title='RSS feed of this page'/> RSS
					</a>
				</div>		</td>
			
		</tr>
		</table>
	</td>
	</tr>
		
	<tr>
	<td>
	<div class='topnav' align='center'>
	<div class='sectionnav'>
Section One | <a href='?&amp;site=admin&amp;section=24&amp;action=site'  class='navlink' >Section Two</a>

	<div class='nav_extras'></div>
</div>
<center></center>
<br /> 

<div align='right'>
	<input type='button' style='width: 125px; text-decoration: none;' class='button' name='preview_as' value=' &nbsp; Preview Site As... &nbsp;' onclick='sendWindow("preview_as",400,300,"preview.php?&amp;site=admin&amp;query=%26action%3Dsite%26site%3Dadmin%26section%3D23%26page%3D76%26story%3D51%26detail%3D51")' />
<input type='submit' class='button' value='Edit This Site' onclick="window.location='?&amp;action=viewsite&amp;site=admin&amp;section=23&amp;page=76&amp;'" />
</div><br /><div style='font-size: 9px;' align='right'><img border='0' src='themes/common/images/rss_icon02.png' alt='rss' /> <a href='viewrss.php?site=admin' target='rss' onclick='doWindow("rss",450,200)' class='navlink' title='click for more RSS feeds...'>More RSS...</a></div>
<br />
<div align='right'>
<div style='font-size: 1px;'>powered by segue</div>
<a href='http://segue.sourceforge.net' target='_blank'>
<img border='0' src='themes/common/images/segue_logo_trans_solid.gif' alt='segue_logo'/>
</a>
</div>	</div>
	</td>
	</tr>
	</table>
</body>
</html>

