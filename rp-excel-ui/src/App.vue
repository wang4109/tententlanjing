<template>
    <div class="monitor-navigation">
        <bk-navigation  :header-title="nav.id" @toggle="handleToggle" :side-title="nav.title" theme-color="#333437" :default-open="true">
            <template slot="header-set">
                <div class="monitor-navigation-header">
                    <span class="header-icon bk-icon icon-exclamation-circle-shape"></span>
                    <span class="header-icon bk-icon icon-qq-shape"></span>
                    <span class="header-avatar">{{header.userName.slice(0, 1).toUpperCase()}}</span>
                </div>
            </template>
           
            <router-view></router-view>
            <template slot="side-icon">
                <span class="header-icon bk-icon icon-qq-shape"></span>
            </template>
            <template slot="menu">
                <bk-navigation-menu ref="menu" @select="handleSelect" :default-active="nav.id"
                    sub-menu-open-bg-color="#27282c" theme-color="#333437" item-default-bg-color="#333437" item-active-bg-color="#18b48a" :toggle-active="nav.toggle">
                    <bk-navigation-menu-item :has-child="item.children && !!item.children.length" :group="item.group"
                        v-for="item in nav.list"
                        :key="item.title"
                        :name="item.title"
                        :icon="item.icon"
                        :url="item.url"
                        :id="item.name">
                        <span>{{item.title}}</span>
                        <div slot="child">
                            <bk-navigation-menu-item 
                                v-for="child in item.children"
                                :id="child.name"  
                                :icon="child.icon"
                                :default-active = "child.active"
                                :key="child.title"
                                :name="child.title"
                                :url="child.url"
                              >
                                <span>{{child.title}}</span>
                            </bk-navigation-menu-item>
                        </div>
                    </bk-navigation-menu-item>
                </bk-navigation-menu>
            </template>
        </bk-navigation>
    </div>
</template>
<script>
    //import Logo from './assets/images/logo.png';
    import { getMenu } from './services/index'
    export default {
        name: 'monitor-navigation',
        components: {
        },
        data () {
            return {
                // Logo,
                isDropdownShow: false,
                nav: {
                    list: [
                        {
                            name: '首页',
                            icon: 'bk-icon icon-home',
                            url: '/',
                        },
                    ],
                    id: '首页',
                    url: '/',
                    toggle: true,
                    submenuActive: false,
                    title: '蓝鲸测试平台'
                },
                header: {
                    select: {
                        list: [],
                        value: 2
                    },
                    userName: 'admin'
                }
            }
        },
        mounted() {
          this.Menu();
        },
        methods: {
            dropdownShow () {
                this.isDropdownShow = true
            },

            dropdownHide () {
                this.isDropdownShow = false
            },
            triggerHandler (val) {
                this.$refs.dropdown.hide()
                if (val === 1) {
                    alert('跳转到 PC 端')
                } else {
                    alert('跳转到移动端')
                }
            },
            handleSelect (id, item) {
                this.nav.url = item.url
                this.nav.id = item.name
                // console.info(item)
                //console.info(`你选择了${this.nav.title}`)
                this.$router.push({path:this.nav.url})
            },
            handleToggle (v) {
                this.nav.toggle = v
                
            },
            // beforeNavChange (newId, oldId) {
            //     //console.info(newId, oldId)
            //     return true
            // },
            async Menu () {
                const { status, data } = await getMenu();
                if (status && /20\d/.test(status)) {
                    this.nav.list= data.data;
                }
            },

        }
    }
</script>

<style lang="postcss">
    /* 以下样式是为了适应例子父级的宽高而设置 */
    .navigation-bar {
        max-height: 80vh !important;
        max-width: 100vw !important;
        height: 100% !important;
        width: 100% !important;
    }
    .navigation-bar-container {
        height: 80vh !important;
        border: 1px solid #ebebeb;
    }
    .monitor-navigation-header {
        display: flex;
        align-items: center;
    }
    .monitor-navigation-header .header-bussiness {
        margin-right: 50px;
    }
    .monitor-navigation-header .header-icon {
        margin-right: 8px;
        display: inline-block;
        color: #63656e;
        font-size: 16px;
        width: 32px;
        height: 32px;
        border-radius: 50%;
        text-align: center;
        line-height: 32px;
    }
    .monitor-navigation-header .header-icon:hover {
        background: #f0f1f5;
        cursor: pointer;
    }
    .monitor-navigation-header .header-avatar {
        display: inline-block;
        width: 28px;
        height: 28px;
        border-radius: 50%;
        font-size: 16px;
        color: #979ba5;
        line-height: 28px;
        text-align: center;
        margin-left: 8px;
        margin-right: 25px;
        background: #f0f1f5;
        box-shadow: 0px 3px 6px 0px rgba(99, 101, 110, 0.06);
        cursor: pointer;
    }
</style>



