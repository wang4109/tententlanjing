import { httpRequestWithCredentials } from '../utils/http';
import * as types from '../store/types';

//获取业务列表
export function getBusinessList(params) {
    return httpRequestWithCredentials.get(types.GET_API_URL+"api/getBusiness/", {params});
}
//获取模板类型
export function getTypeList(params) {
    return httpRequestWithCredentials.get(types.GET_API_URL+"api/getType/", {params});
}
//新增模板
export function addTemplet(data) {
    return httpRequestWithCredentials.post(types.GET_API_URL+"api/addTemplet/",data);
}
//删除模板
export function delTemplet(data) {
    return httpRequestWithCredentials.post(types.GET_API_URL+"api/delTemplet/",data);
}
//获取模板列表
export function getTempletList(params) {
    return httpRequestWithCredentials.get(types.GET_API_URL+"api/templetList/", {params});
}