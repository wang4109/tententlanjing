import axios from 'axios';
import Qs  from 'qs';
const httpRequest = axios.create({
headers: {
    'Content-Type': 'application/json;charset=utf-8',
    },
    withCredentials: true, // 删除避免cookie造成的cors问题
});

httpRequest.interceptors.response.use(res => {
    if (res.status === 200){
        if (res.data.code === 302){
            window.location.href = res.data.data.url;
        }
    }
    return res;
}, (err) => {
    const { response = {} } = err;
    return {
        ...err,
        errStatus: response.status,
        errMessage: response.data ? (response.data.message || response.data) : '未知错误',
        status: response.status,
        data: response.data,
    };
});

const httpRequestWithCredentials = axios.create({
    headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
    },
    withCredentials: true,
    transformRequest: [function (data) {
        data = Qs.stringify(data);
        return data;
    }],
});


httpRequestWithCredentials.interceptors.response.use(res => {
    if (res.status === 200){
        if (res.data.code === 302){
            window.location.href = res.data.data.url;
        }
    }
    return res;
}, (err) => {
    const { response = {} } = err;
    return {
        ...err,
        errStatus: response.status,
        errMessage: response.data ? (response.data.message || response.data) : '未知错误',
        status: response.status,
        data: response.data,
    };
});


export { httpRequestWithCredentials, httpRequest };