/**
 * Created by zhukovsd on 04.06.2017.
 */

import Swagger from 'swagger-client';

Swagger('/v2/api-docs')
    .then( client => {
        // alert(JSON.stringify(client.spec));

        client.apis['test-controller'].messageUsingGET({name: 'mate'}).then((res) => {
            alert(JSON.stringify(res.body));
        });
});
