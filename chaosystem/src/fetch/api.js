import axios from './fetch';

export function register (data){
    return axios({
        method: 'post',
        url: 'api/register',
        data
      });
}