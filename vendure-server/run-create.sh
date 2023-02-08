#!/bin/sh
mkdir vendure
cd vendure || exit
npx @vendure/create vendure-server
cd vendure-server || exit
yarn dev