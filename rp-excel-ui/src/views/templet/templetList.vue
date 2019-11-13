<template>
    <div>
        <bk-form form-type="inline" :model="formData" >
            <bk-form-item label="业务名称" >
                <bk-select v-model="formData.task" searchable style="width:120px">
                    <bk-option v-for="option in taskList"
                        :key="option.bk_biz_id"
                        :id="option.bk_biz_name"
                        :name="option.bk_biz_name">
                    </bk-option>
                </bk-select>
            </bk-form-item>
            <bk-form-item label="模板类型">
                <bk-select v-model="formData.type" searchable style="width:120px">
                    <bk-option v-for="option in typeList"
                        :key="option.id"
                        :id="option.id"
                        :name="option.name">
                    </bk-option>
                </bk-select>
            </bk-form-item>
            <bk-form-item label="模板名称">
                <bk-input placeholder="名称" v-model="formData.name"></bk-input>
            </bk-form-item>
            <bk-form-item>
                <bk-button theme="default" title="新增" icon="bk-icon icon-search" @click="fetchTaskList()" class="mr5">搜索</bk-button>
                <bk-button theme="primary" title="新增" icon="plus" @click="$router.push({name:'templetWrite'})">新增</bk-button>
            </bk-form-item>
        </bk-form>
        <bk-table style="margin-top: 15px;"
            :data="data"
            :size="size"
            :stripe="true"
            :pagination="pagination"
            @page-change="handlePageChange"
            @page-limit-change="handlePageLimitChange">
            <!-- <bk-table-column type="selection" width="60" align="center"></bk-table-column> -->
            <bk-table-column type="index" label="序列" align="center" width="60"></bk-table-column>
            <bk-table-column label="模板名称" prop="templetName"></bk-table-column>
            <bk-table-column label="业务名称" prop="business"></bk-table-column>
            <bk-table-column label="模板类型" prop="type"></bk-table-column>
            <bk-table-column label="创建者" prop="user"></bk-table-column>
            <bk-table-column label="创建时间" prop="createTime" ></bk-table-column>
            <bk-table-column label="更新者" prop="updateUser"></bk-table-column>
            <bk-table-column label="更新时间" prop="updateTime" ></bk-table-column>
            <bk-table-column label="操作" width="150">
                <template slot-scope="props">
                    <bk-button style="border:0"  icon="bk-icon icon-cog-shape"  class="mr3" @click="visiable2 = true;formData2.type=props.row.type;formData2.name=props.row.templetName;formData2.task=props.row.business;"></bk-button>
                    <bk-button style="border:0"  icon="bk-icon icon-download"  class="mr3" @click="dowmload(props.row.templetUrl)"></bk-button>
                    <bk-button style="border:0"  icon="bk-icon icon-close"  class="mr3" @click="visiable = true;delId = props.row.id;row_index = props.row"></bk-button>
                </template>
            </bk-table-column>
        <bk-dialog v-model="visiable"
            :render-directive="'if'"
            :mask-close="false"
            :show-mask="false"
            :header-position="'left'"
            @confirm="remove()"
            title="删除确认">
            该模板将被删除，操作确认？
        </bk-dialog>
         <bk-dialog v-model="visiable2" title="创建代办任务"
        :header-position="'center'" 
        :width="500"
        :position="{top:100}"
        >
        <bk-form  :model="formData2" :rules="rules" ref="validateForm">
            <bk-form-item label="业务名称" :required="true" :property="'task'">
                <bk-input :disabled="true" v-model="formData2.task" ></bk-input>
            </bk-form-item>
            <bk-form-item label="模板类型" :required="true" :property="'type'">
                <bk-input :disabled="true" v-model="formData2.type" ></bk-input>
            </bk-form-item>
            <bk-form-item label="模板名称" :required="true" :property="'name'">
                <bk-input :disabled="true" v-model="formData2.name" ></bk-input>
            </bk-form-item>
            <bk-form-item label="操作识别号" :required="true" :property="'uuid'">
                <bk-input  v-model="formData2.uuid" placeholder="全局唯一的待办操作识别号"></bk-input>
            </bk-form-item>
        </bk-form>
        </bk-dialog>
        </bk-table>
    </div>
</template>
<script>
    import { getBusinessList,getTypeList,getTempletList,delTemplet} from '../../services/templet';

    import * as type from '../../store/types';
    export default {
        components: {
        },
        data () {
            return {
                size: 'small',
                delId: 0,visiable: false,row_index:-1,
                visiable2: false,
                data: [],
                formData: {
                    name: '',
                    type: '',
                    task: '',
                },
                formData2: {
                    name: '',
                    type: '',
                    task: '',
                    uuid: '',
                },
                rules: {
                    uuid: [
                        {
                            required: true,
                            message: '请输入操作识别码',
                            trigger: 'blur'
                        }
                    ],
                },
                taskList:[],
                typeList:[],
                pagination: {
                    current: 1,
                    count: 1,
                    limit: 20
                }
            }
        },
        mounted() {
            this.fetchTaskList();
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
            handlePageLimitChange (index) {
                this.fetchTaskList({size:index})
            },
            handlePageChange (page) {
                this.pagination.current = page
                this.fetchTaskList({page:page})
            },
            async fetchTaskList(opt) {
                let def = {
                    page: 1,
                    size: 10,
                    type: this.formData.type,
                    business: this.formData.task,
                    name:this.formData.name
                };
                def = { ...def, ...opt };
                const { data, status } = await getTempletList(def);
                if (/20\d/.test(status)) {
                    this.pagination.current = data.data.page;
                    this.pagination.limit = data.data.size;
                    this.pagination.count = data.data.total;
                    this.data = data.data.task_list;
                }
            },
            remove () {
                if(this.delId){
                    delTemplet({'pk':this.delId}).then(res=>{
                        if (res.status && /20\d/.test(res.status)) {
                            if (res.data.status){
                                this.$bkInfo({
                                type: 'success',
                                title: res.data.message,
                                showFooter: false,
                                })
                                const index = this.data.indexOf(this.row_index)
                                if (index !== -1) {
                                    this.data.splice(index, 1)
                                }
                            }else{
                                this.$bkInfo({
                                type: 'error',
                                title: res.data.message,
                                showFooter: false,
                                })
                            }
                            
                        }
                    })  
                }
                
                
            },
            dowmload (url) {
                let a = document.createElement('a')
                a.href =type.GET_API_URL+url
                a.download = "demo"
                a.click();
            },

        }
    }
</script>