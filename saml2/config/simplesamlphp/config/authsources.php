<?php
$config = [
    'admin' => [
        'core:AdminPassword',
    ],
    'default-sp' => [
        'exampleauth:UserPass',
        'user1:user1pass' => [
            'username' => 'user1',
            'uid' => ['1'],
            'eduPersonAffiliation' => ['group1'],
            'email' => 'user1@example.com',
        ],
        'user2:user2pass' => [
            'username' => 'user2',
            'uid' => ['2'],
            'eduPersonAffiliation' => ['group2'],
            'email' => 'user2@example.com',
        ],
    ],
];
