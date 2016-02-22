/*
	Author	:	S. Kumaravelan
	Created	:	Feb 23 2016
	Desc	:
			Usage:
			var newObject = new vzTable("tableID:string","url:string","data:object","jsonData:object", "pagerOptions:object","sorterOptions:object");
			newObject.drawJsonTable();
			
			
	Version		Date			Modified by				Desc
	1.0			Feb 23 2016		Kumaravelan				
*/

var vzTableCollection = {};

var vzTable = function(tableID,url,data,jsonData,pagerOptions,sorterOptions){
    //debugger;
	//Paging
	var defaultPagerOptions = {
		// target the pager markup - see the HTML block below
		container: $(".pager"),
		// output string - default is '{page}/{totalPages}'; possible variables: {page}, {totalPages}, {startRow}, {endRow} and {totalRows}
		output: '{startRow} - {endRow} / {filteredRows} ({totalRows})',
		// if true, the table will remain the same height no matter how many records are displayed. The space is made up by an empty
		// table row set to a height to compensate; default is false
		fixedHeight: false,
		// remove rows from the table to speed up the sort of large tables.
		// setting this to false, only hides the non-visible rows; needed if you plan to add/remove rows with the pager enabled.
		removeRows: false,
		// go to page selector - select dropdown that sets the current page
		cssGoto: '.gotoPage',
		size: 10
	};
	
	var defaultSorterOptions = {
		widthFixed: false, 
		headerTemplate : '{content} {icon}',
		widgets: ['zebra', 'filter'],
		
		//If you want to sort by default
		/*sortList: [[0,0], [1,0]],*/
		
		showProcessing : true,	
		'.nosort': { sorter: false }					
	};
	
	this.tableID = tableID || null;
	this.url = url || null;
	this.data = data || null;
	this.jsonData= jsonData||null;
	this.pagerOptions=$.extend(defaultPagerOptions,pagerOptions)||defaultPagerOptions;
	this.sorterOptions=$.extend(defaultSorterOptions,sorterOptions)||defaultSorterOptions;
	this.currentRowIndex = 0;
	
	//You can add more global variables
}

vzTable.prototype.drawJsonTable = function() {
    //thisObj = this;
	//if(this.url && this.url.replace(/ /g,"").length>0){
		
	//	$.ajax({
	//		url: this.url,
	//		type: "post",
	//		data: this.data,
	//		type: 'GET',
	//		contentType: 'application/json; charset=utf-8',
	//		success: function (data, textStatus, jqXHR) {
	//		    // since we are using jQuery, you don't need to parse response
	//		    thisObj.jsonData = data;
	//		    thisObj.drawTable(thisObj.jsonData);
	//		    $("#" + thisObj.tableID).tablesorter(thisObj.sorterOptions).tablesorterPager(thisObj.pagerOptions);
	//		},
	//		error: function (e) {
	//			alert(e);
	//			//for (var i in e) {
	//			 //   alert(i + " e[i] = " + e[i]);
	//			//}
	//		}
	//	});

	//}
	
	if(this.jsonData){	
		//This function should call inside the ajax 'success' function...
	    this.drawTable(this.jsonData);
	    //$("#" + this.tableID).tablesorter(this.sorterOptions).tablesorterPager(this.pagerOptions);
	    //$("#" + thisObj.tableID).tablesorter(thisObj.sorterOptions).tablesorterPager(thisObj.pagerOptions);
	}
	
	//Defining the datatable, sorter, filter and paging
    $("#" + this.tableID).tablesorter(this.sorterOptions).tablesorterPager(this.pagerOptions);  // Natarajan 
    //Commented... as we should execute only after the ajax call...
}

vzTable.prototype.drawTable = function (d) {

    //debugger;
	//Draw Table Header
	this.drawTableHead(d.Header);

	//Draw Table Rows
	this.drawRow(d.Header, d.Rows);
	
	thisObj = this;
	
	$('#addRow').click(function (e) {
	    thisObj.addClickRow(d.Header, d.Rows);
	});
	

	$("#"+this.tableID+" > tbody tr").click(function(e){
	    //debugger;
	    
	    //Retriving the vzTable object from global variable vzTableCollection to know the JSON data and other objects
	    var tblID = $(this).parents("table:eq(0)").attr("id");
	    var objID = tblID.replace("vzTable_", "");
	    var thisObj = eval(vzTableCollection[''+objID+'']);

	    //If same row selected
		if(thisObj.currentRowIndex == $(this).attr("jsonrowindex")) return;
		
		//Get the values from controls and apply into the label
		if (e.target.tagName == "TD" || e.target.tagName == "LABEL") {
			thisObj.setRowValues(e.target);
		}
		
		thisObj.currentRowIndex = $(this).attr("jsonrowindex");
		
        //If already objects created, let it hide the label and show the controls only.
		if($(this).attr('class').indexOf("ObjCreated")!=-1){
			$("td.editable",this).each(function(e){
				var label = $(this).children('label');
				label.hide().next().show();
			});
			return;
		}
		
        //If controls not yet created, lets create based on Header property
		$("td.editable",this).each(function(e){
		    //debugger;
			//Reference the Label.
			var label = $(this).children('label');
			var editType = $(this).attr('editType') || "text";
			var colIndex = $(this).attr('jsonCellIndex');
            //change by Natarajan 
			//var w = thisObj.jsonData.Header[colIndex]["width"] ? (parseInt(thisObj.jsonData.Header[colIndex]["width"]) - 10) + 'px' : 'auto';
			var w = thisObj.jsonData.Header[colIndex]["width"] ? (parseInt(thisObj.jsonData.Header[colIndex]["width"]) - 10) + 'px' : 'auto';
						
			switch (editType) {
				case "select":
					var id = $(label).attr('id').replace("lbl", "dd");
				    //var ddArray = thisObj.jsonData.headers[colIndex]["editOptions"].value;

					var strEditOption = JSON.stringify(thisObj.jsonData.Header[colIndex]["editOptions"]);

					var ddArray = strEditOption.split("#");

					$(this).append("<select id='" + id + "' style='display:none; width:" + w + "'></select>");
					for (k in ddArray) {
					    var dropValue = ddArray[k].split(":");
					    //var selected = label.html() == ddArray[k] ? "selected='selected'" : "";
					    var selected = label.html() == dropValue[1].trim() ? "selected='selected'" : "";
						//$(this).children('select').append("<option value='" + k + "' " + selected + ">" + ddArray[k] + "</option>");
						$(this).children('select').append("<option value='" + dropValue[0].trim() + "'" + selected + ">" + dropValue[1].trim() + "</option>");
					}
					break;
				case "date":
					var id = $(label).attr('id').replace("lbl", "txt");
					label.after("<input type = 'text' name='" + id + "' id='" + id + "' maxlength='" + $(label).attr('maxlength') + "' value='" + label.html() + "' style = 'display:none;  width:" + w + "' />");
					var dateOptions = thisObj.jsonData.headers[colIndex]["dateOptions"];
					if (label.html().length > 3) dateOptions.defaultDate = label.html();
					$(label.next()).datepicker(dateOptions);

					/*
					var dateOptions = {
					minDate: new Date(cYear - 1, cMon, 1),
					maxDate: new Date(cYear, cMon, dayM),
					hideIfNoPrevNext: true,
					dateFormat: 'mm-dd-yy',
					//dateFormat: 'DD, MM, d, yy',
					constrainInput: true,
					beforeShowDay: enableDay
					};
					var myTextBox = "<%=myTextBox.ClientID%>";
					$('#' + myTextBox).datepicker(dateOptions);
					*/

					break;
				default:
					var id = $(label).attr('id').replace("lbl", "txt");
					if (colIndex == "0") {
						label.after("<input readonly type = 'text'   name='" + id + "' id='" + id + "' maxlength='" + $(label).attr('maxlength') + "' value='" + label.html() + "' style = 'display:none;  width:" + w + "' />");
					}
					else {

						label.after("<input type = 'text'  name='" + id + "' id='" + id + "' maxlength='" + $(label).attr('maxlength') + "' value='" + label.html() + "' style = 'display:none;  width:" + w + "' />");
					}
					break;
					/*
					var id = $(label).attr('id').replace("lbl", "txt");
					label.after("<input type = 'text' name='" + id + "' id='" + id + "' maxlength='" + $(label).attr('maxlength') + "' value='" + label.html() + "' style = 'display:none;  width:" + w + "' />");
					break;*/
			}
			label.hide().next().show().parents("tr:eq(0)").addClass('ObjCreated');		
		});
		
		e.stopPropagation();
	});
	
	

}

vzTable.prototype.setRowValues = function (o) {
    //debugger;
	//alert($(e.target).prop('tagName'));
	thisObj = this;
	$(o).parents("table:eq(0)").find('tr.rowSelected').each(function () {
		$(this).removeClass('rowSelected');

		$(this).find("td.editable").each(function () {
			$(this).children('label').show().next().hide();
			var editType = $(this).attr('editType') || "text";
			switch (editType) {
				case "select":
					$(this).children('label').html($(this).children('label').next().find('option:selected').text());
					break;
				case "date":
				default:
					$(this).children('label').html($(this).children('label').next().val());
					break;
			}

			var rowIndex = $(this).parent().attr('jsonRowIndex');
			var colIndex = $(this).parent().children().index($(this).parent());
			
			//alert("Row index = " + rowIndex + " , colIndex = " + colIndex);
			//debugger;
			var originalVal = thisObj.jsonData.Rows[rowIndex];
			var currentVal = thisObj.rowToJsonArray($(this).parent());

			originalVal = originalVal.cell.split(",");
			

			//alert(originalVal.cell);
			//alert("originalVal = " + originalVal);
			//alert("currentVal = " + currentVal);

			var diff = $(originalVal).not(currentVal).get();
			//alert("diff = " + diff);
			
			if (diff.length > 0) {
			    //$(this).parents("tr").eq(0).addClass('rowEdited');
			    $(this).parents("tr:eq(0)").addClass('rowEdited');
			}
			else {
			    $(this).parents("tr:eq(0)").removeClass('rowEdited');
			}

		});
	});

	var allEditableTD = $(o).parents("tr:eq(0)").addClass('rowSelected').find("td.editable");
	//alert(allEditableTD.length);
	$(allEditableTD).each(function () {
		$(this).children('label').hide();
		$(this).children('label').next().show();
		//.focus();
	});
}

vzTable.prototype.drawTableHead = function(h) {
	var cells = "";
	for (var i = 0; i < h.length; i++) {
		var width = h[i]["width"] ? h[i]["width"] + 'px' : 'auto';
	    //cells += "<th style='width:" + width + "'>" + h[i]["title"] + "</th>";
	    cells += "<th style='width:" + width + "'>" + h[i]["Caption"] + "</th>";
	}
	$("#" + this.tableID).append("<thead><tr>" + cells + "</tr></thead>");
}

vzTable.prototype.drawRow = function (h, r) {
    //debugger;
	var rows = "";
	var c = "";
	var splitRow = [];

	for (var i = 0; i < r.length; i++) {
	    var cells = "";
	    splitRow = [];
		//for (var j = 0; j < r[i].length; j++) {
		//    //c = h[j]["editable"] == true ? "editable" : "";
		//    c = h[j]["IsEditable"] == true ? "IsEditable" : "";
		    
		//	var max = h[j]["maxlength"] ? h[j]["maxlength"] : 50;
		//	//cells += "<td class='" + c + "' editType='" + h[j]["editType"] + "' jsonCellIndex='" + j + "'><label id='lbl_R" + i + "C" + j + "' maxlength='" + max + "'>" + r[i][j] + "</td>";
		//	cells += "<td class='" + c + "' editType='" + h[j]["RenderType"] + "' jsonCellIndex='" + j + "'><label id='lbl_R" + i + "C" + j + "' maxlength='" + max + "'>" + r[i][j] + "</td>";

			
		//}
		//var table = rows += "<tr id=row_'" + i + "' jsonRowIndex='" + i + "'>" + cells + "</tr>";
		splitRow = r[i].cell.split(',');
		for (var j = 0; j < splitRow.length; j++) {
		    c = h[j]["IsEditable"] == true ? "editable" : "";
		    var max = h[j]["ColumnSize"] ? h[j]["ColumnSize"] : 50;
		    cells += "<td class='" + c + "' editType='" + h[j]["RenderType"] + "' jsonCellIndex='" + j + "'><label id='lbl_R" + i + "C" + j + "' maxlength='" + max + "'>" + splitRow[j] + "</td>";
		}

		var table = rows += "<tr class='trSelectEditRow' id=row_'" + i + "' jsonRowIndex='" + i + "'>" + cells + "</tr>";

	}
	$("#" + this.tableID).append("<tbody>" + rows + "</tbody>");
}

vzTable.prototype.addClickRow = function(h, r) {
	var rows = "";
	var c = "";
	for (var i = 0; i < r.length - 1; i++) {
		var cells = "";
		for (var j = 0; j < r[i].length; j++) {
		    //c = h[j]["editable"] == true ? "editable" : "";
		    c = h[j]["IsEditable"] == true ? "IsEditable" : "";
			var max = h[j]["maxlength"] ? h[j]["maxlength"] : 50;
			//cells += "<td class='" + c + "' editType='" + h[j]["editType"] + "' jsonCellIndex='" + j + "'><label id='lbl_R" + i + "C" + j + "' maxlength='" + max + "'>" + r[i][j] + "</td>";
			cells += "<td class='" + c + "' editType='" + h[j]["RenderType"] + "' jsonCellIndex='" + j + "'><label id='lbl_R" + i + "C" + j + "' maxlength='" + max + "'>" + r[i][j] + "</td>";
		}
		rows += "<tr id=row_'" + i + "' jsonRowIndex='" + i + "'>" + cells + "</tr>";
	}
	$("#" + this.tableID).append("<tbody>" + rows + "</tbody>");
}

vzTable.prototype.saveMyTable = function(o) {
	this.setRowValues($("#" + this.tableID).find('td:eq(0)'));
	var rows = new Array();
	$("#" + this.tableID).find('tr.rowEdited').each(function () {
		var a = this.rowToJsonArray($(this));
		rows.push(a);
		alert(a);
	});
	//alert(rows);
}

vzTable.prototype.rowToJsonArray = function(tr) {
	var arr = new Array();
	$(tr).find('td').each(function () {
		arr.push($(this).find('label').html());
	});
	//alert("rowToJsonArray = " + arr);
	return arr;
}