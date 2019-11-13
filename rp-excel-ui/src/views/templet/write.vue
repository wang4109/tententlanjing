<template>
    <div style="width: 600px;">
        <bk-form :label-width="200" :model="formData" :rules="rules" ref="validateForm">
            <bk-form-item label="业务名称" :required="true" :property="'task'">
                <bk-select v-model="formData.task" searchable>
                    <bk-option v-for="option in taskList"
                        :key="option.bk_biz_id"
                        :id="option.bk_biz_name"
                        :name="option.bk_biz_name">
                    </bk-option>
                </bk-select>
            </bk-form-item>
            <bk-form-item label="模板类型" :required="true" :property="'type'">
                <bk-select v-model="formData.type" searchable>
                    <bk-option v-for="option in typeList"
                        :key="option.id"
                        :id="option.id"
                        :name="option.name">
                    </bk-option>
                </bk-select>
            </bk-form-item>
            <bk-form-item label="模板名称" :required="true" :property="'name'">
                <bk-input v-model="formData.name" placeholder="请输入2到10个以内的字符"></bk-input>
            </bk-form-item>
            <bk-form-item label="模板导入" :required="true" :property="'templet'">
            <bk-input :disabled="true" v-model="formData.templet" placeholder="请导入正确模板文件"></bk-input>
            <bk-upload
                    :tip="'请选择要导入业务对应的模板文件，文件格式为*.xls或者*.xlsx'"
                    :with-credentials="true"
                    :handle-res-code="handleRes"
                    :accept="'application/vnd.ms-excel'"
                    :url="upload"
            ></bk-upload>
            <a :href="demo" class="bk-text-button bk-primary" title="下载">
                <i class="bk-icon icon-download"></i>模板样例文件下载
            </a>
            </bk-form-item>
            <bk-form-item>
                <bk-button theme="primary" title="提交" @click.stop.prevent="validate" :loading="isChecking">提交</bk-button>
                <bk-button theme="default" :disabled="showStatus" @click="visiable = true">预览</bk-button>
                <bk-button theme="default" title="取消" @click="handleClick">返回</bk-button>
            </bk-form-item>
        </bk-form>
        <bk-dialog v-model="visiable"
        width="800"
        :position="{top:100,left:150}"
        title="模板预览">
           <bk-table style="margin-top: 15px;"
            :data="data"
            :span-method="arraySpanMethod"
            header-row-class-name="templet-show-class"
            :stripe="true"
            >
            <bk-table-column label="步骤类别" prop="step"></bk-table-column>
            <bk-table-column label="序号" prop="id" width="70"></bk-table-column>
            <bk-table-column label="操作事项" prop="operate_attention"></bk-table-column>
            <bk-table-column label="备注" prop="comment"></bk-table-column>
            <bk-table-column label="责任人" prop="responser" ></bk-table-column>
        </bk-table>
        </bk-dialog>
    </div>
</template>
<script>
    import * as type from '../../store/types';
    import { getBusinessList,getTypeList,addTemplet } from '../../services/templet';

    export default {
        components: {
        },
        data () {
            return {
                data: [],merge:[],
                demo:type.GET_API_URL+'./static/static/checklist.xls',
                upload:type.GET_API_URL+'api/loadExcel/',
                showStatus: true,
                visiable: false,
                isChecking: false,
                formData: {
                    name: '',
                    type: '',
                    task: '',
                    templet:''
                   
                },
                taskList:[],
                typeList:[],
                rules: {
                    name: [
                        {
                            required: true,
                            message: '必填项',
                            trigger: 'blur'
                        },
                        {
                            min: 2,
                            message: function (val) {
                                return `${val}不能小于2个字符`
                            },
                            trigger: 'blur'
                        },
                        {
                            max: 10,
                            message: '不能多于10个字符',
                            trigger: 'blur'
                        },
                    ],
                    type: [
                        {
                            required: true,
                            message: '请选择模板类型',
                            trigger: 'blur'
                        }
                    ],
                    task: [
                        {
                            required: true,
                            message: '请选择业务名称',
                            trigger: 'blur'
                        }
                    ],
                    templet:[
                        {
                            required: true,
                            message: '请导入xls或者xlsx模板文件',
                            trigger: 'blur'
                        }
                    ]
                }
            }
        },
        mounted() {
            this.fetchBusinessList();
            this.fetchTypeList();
        },
        methods: {
            async fetchBusinessList() {
                const { data, status } = await getBusinessList();
                if (/20\d/.test(status)) {
                    this.taskList=data.data.info
                }
            },
            async fetchTypeList() {
                const { data, status } = await getTypeList();
                if (/20\d/.test(status)) {
                    this.typeList=data.data
                }
            },
            handleRes: function (response) {
                if (response.code === 0) {
                    this.formData.templet=response.data.uuid
                    this.showStatus=false
                    this.data=response.data.parm_data
                    this.merge=response.data.merge
                    return true
                } 
                return false
            },
            handleClick(){
                this.$router.push({name:'templetList'})
            },
            validate () {
                this.isChecking = true
                this.$refs.validateForm.validate().then(validator => {
                    addTemplet(this.formData).then(res=>{
                        if (res.status && /20\d/.test(res.status)) {
                            if (res.data.status){
                                this.$bkInfo({
                                type: 'success',
                                title: res.data.message,
                                showFooter: false,
                                })
                                this.$router.push({name:'templetList'})
                                
                            }else{
                                this.$bkInfo({
                                type: 'error',
                                title: res.data.message,
                                showFooter: false,
                                })
                            }
                            
                        }
                    })       
                    this.isChecking = false
                }, validator => {
                    this.isChecking = false
                    // 显示第一个出错位置
                    this.$bkInfo({
                    type: 'error',
                    title: `${validator.content}`,
                    showFooter: false,
                    })
                })
            },
            /**
             * 表格合并
             * @param { row, column, rowIndex, columnIndex }
             * row 表格每一行的数据
             * column 表格每一列的数据
             * rowIndex 表格的行索引,不包括表头,从0开始
             * columnIndex 表格的列索引,从0开始
             */
            arraySpanMethod ({ row, column, rowIndex, columnIndex }) {
    
                for (var i in this.merge){
                    if (columnIndex>=this.merge[i].col && columnIndex<this.merge[i].col+this.merge[i].colspan && rowIndex>=this.merge[i].row && rowIndex < this.merge[i].row+this.merge[i].rowspan){
                        if (columnIndex===this.merge[i].col && rowIndex ===this.merge[i].row){
                            return [this.merge[i].rowspan,this.merge[i].colspan]
                        }
                        return [0,0]
                    }
                }
                
            },
        }
    }
</script>
<style lang="postcss">
    .templet-show-class th {
        background-color: #d6ebf1;
        text-align: center;
    }
</style>