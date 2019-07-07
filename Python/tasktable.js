var editting = false;
var modify   = false;
var editingindx = false;
var isenable = [
                {enable:'false', text:'否'},
                {enable:'true', text:'是'},
               ];
var datatype = [
                {type:'textbox', text:'字符串'},
                {type:'numberbox', text:'数值'},
                {type:'datetimebox', text:'时间'},
               ];

window.onbeforeunload = function() {
　　　if($("#tt").datagrid('getChanges').length){
        return '';
　　　}
};﻿

function init_table(tableid)
{
    $(tableid).datagrid({
        width:660,
        height:250,
        singleSelect:true,
        idField:'dataid',
        columns:[[
                {field:'dataid',title:'编号',width:60},
                {field:'item',title:'列名',width:100,
                    editor:{
                        type:'textbox',
                        options:
                        {
                            required:true
                        }
                    },
                },
                {field:'datatype',title:'数据类型',width:80, align:'center',
                    editor:{
                        type:'combobox',
                        options:
                        {
                            valueField:'type',
                            textField:'text',
                            data:datatype,
                            editable:false,
                            required:true
                        }
                    },
                    formatter:function(value,row){
                        return row.datatype || value;
                    },
                 },
                {field:'editable',title:'可编辑',width:80,align:'center',
                    editor:{
                        type:'combobox',
                        options:
                        {
                            valueField:'enable',
                            textField:'text',
                            data:isenable,
                            editable:false,
                            required:true,
                            
                        }
                    },
                    formatter:function(value,row){
                        return row.editable || value;
                    },
                 },
                {field:'multiple',title:'多选',width:80,align:'center',
                    editor:{
                        type:'combobox',
                        options:
                        {
                            valueField:'enable',
                            textField:'text',
                            data:isenable,
                            editable:false,
                            required:true,
                            missingMessage:'',
                        }
                    },
                    formatter:function(value,row){
                        return row.multiple || value;
                    },
                },
                {field:'options',title:'选项',width:180,align:'center',
                    editor:{
                        type:'textbox',
                    }
                },
                ]],
        toolbar:[
            {iconCls: 'icon-add',    handler:function(){append(tableid)}, text: '添加'},
            {iconCls: 'icon-undo',   handler:function(){cancelrow(tableid)}, text: '取消'},
            {iconCls: 'icon-cancel', handler:function(){deleterow(tableid)}, text: '删除'},
            {iconCls: 'icon-save',   handler:function(){saverow(tableid)}, text: '保存'},
            '-',
            {iconCls: 'icon-reload',     handler:function(){redoall(tableid)}, text: '撤销改动'},
            {iconCls: 'icon-ok',     handler:function(){submittable(tableid)}, text: '提交'},
        ],
        data: [
            {dataid:'1', item:'value12', datatype:'数值',editable:'否', multiple:'否'},
            
        ],
        onEndEdit:function(index,row){
            var item = $(this).datagrid('getEditor', {index: index, field: 'item'});
            var datatype = $(this).datagrid('getEditor', {index: index, field: 'datatype'});
            var editable = $(this).datagrid('getEditor', {index: index, field: 'editable'});
            var multiple = $(this).datagrid('getEditor', {index: index, field: 'multiple'});
            
            row.item = $(item.target).textbox('getText');
            row.datatype = $(datatype.target).combobox('getText');
            row.editable = $(editable.target).combobox('getText');
            row.multiple = $(multiple.target).combobox('getText');
        },
        onBeforeEdit:function(index,row){
            row.editing = true;
            editting = true;
            $(this).datagrid('refreshRow', index);
        },
        onAfterEdit:function(index,row){
            row.editing = false;
            editting = false;
            modify = false;
            $(this).datagrid('refreshRow', index);
        },
        onCancelEdit:function(index,row){
            row.editing = false;
            editting = false;
            modify = false;
            $(this).datagrid('refreshRow', index);
        },
        onDblClickRow:function(index,row)
        {   
            
            if(!editting){
                $(tableid).datagrid('selectRow', index).datagrid('beginEdit', index);
                editingindx = index;
                modify = true;
                editorsetting(tableid, editingindx);
            } else {
                $(tableid).datagrid('selectRow',editingindx);
            }
            
        }
    });
}

function redoall(tableid)
{
 $.messager.confirm('系统提示','是否撤销所有改动?',function(r){
    if (r){
            $(tableid).datagrid('rejectChanges');
        
    }
});
}
function submittable(tableid)
{
    rows = $(tableid).datagrid('getChanges','inserted')
    alert(rows.length);
    rows = $(tableid).datagrid('getChanges','updated')
    alert(rows.length);
    rows = $(tableid).datagrid('getChanges','deleted')
    alert(rows.length);
    //$(tableid).datagrid('acceptChanges');
}

function getRowIndex(tableid){
    row = $(tableid).datagrid('getSelected');
    if(row)
    {
        return $(tableid).datagrid('getRowIndex', row);
    }
    return -1;
}

function deleterow(tableid){
    index = getRowIndex(tableid);
    if(index>=0)
    {
        $.messager.confirm('系统提示','是否删除选中数据?',function(r){
        if (r){
                $(tableid).datagrid('deleteRow', index);
            
        }
    });
    }
}

function saverow(tableid){
    if($(tableid).datagrid('validateRow', editingindx))
    {
        $(tableid).datagrid('endEdit', editingindx);
    }
}
function cancelrow(tableid){
    if(editting&&!modify)
    {
        $(tableid).datagrid('cancelEdit', editingindx).datagrid('deleteRow', editingindx);
    }else{
        $(tableid).datagrid('cancelEdit', editingindx)
    }
}
function append(tableid){

    if(editting)
    {
        if($(tableid).datagrid('validateRow', editingindx))
        {
            $(tableid).datagrid('endEdit', editingindx);
        }
        else
        {
            return;
        }
    }
    
    $(tableid).datagrid('appendRow',{});
    editingindx = $(tableid).datagrid('getRows').length-1;

    $(tableid).datagrid('selectRow',editingindx).datagrid('beginEdit',editingindx);
    editorsetting(tableid, editingindx);
}

function editorsetting(tableid, index)
{
    
    var multiple = $(tableid).datagrid('getEditor', {index: index, field: 'multiple'});
    var options = $(tableid).datagrid('getEditor', {index: index, field: 'options'});
    
    values = $(multiple.target).combobox('getValue')
    texts = $(multiple.target).combobox('getText')
    
    
    multiple.target.combobox({
        onChange:function(){
            ismultiple = $(multiple.target).combobox('getValue');
            var _options = options.target.textbox('options');
            _options.required = false;
            if(ismultiple=='true')
            {
                _options.required = true;
            }
            options.target.textbox(_options) 
            
            
        }
    });
    multiple.target.combobox('setValue',values);
    multiple.target.combobox('setText', texts);
}