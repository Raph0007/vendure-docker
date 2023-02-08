#!/bin/sh
mkdir vendure
cd vendure
npx @vendure/create vendure-server
cd vendure-server
yarn dev