import { httpRequestWithCredentials } from '../utils/http';
import * as types from '../store/types';

//获取菜单
export function getMenu() {
    return httpRequestWithCredentials.get(types.GET_API_URL+"api/getMenus/");
}

//获取用户名
export function getName() {
    return httpRequestWithCredentials.get(types.GET_API_URL+"api/getName/");
}
