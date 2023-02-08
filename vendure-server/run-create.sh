#!/bin/sh
npx @vendure/create vendure-server
cd vendure-server || exit
mv ../vendure-config.ts src/
yarn dev