// import * as authKey from '../store/authKey';

  const projectMenus = [
    {
      title: '总览统计',
      icon: 'md-podium',
      name: 'SummaryStatistics',
      link: '/',
      submenu: [{
        title: '日报总览',
        name: 'DailyNews',
        link: '/daily/news',
      },],
    },
    {
      title: '作业平台',
      icon: 'ios-bookmarks',
      name: 'JobWork',
      link: '/',
      submenu: [{
        title: '日报填写',
        name: 'DailyWrite',
        link: '/daily/write',
      }, {
        title: '日报管理',
        name: 'DailyManage',
        link: '/daily/manage',
      }],
    },
  ];
  
  export {
    projectMenus,
  };
  