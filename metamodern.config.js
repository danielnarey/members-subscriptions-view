import path from 'path';
import json from '@rollup/plugin-json';
import elm from 'rollup-plugin-elm';
import pkg from './package.json';


const typefaces = Object.keys(pkg.dependencies).filter(
  (str) => str.startsWith('typeface-'),
);


const assets = typefaces.map((name) => [
  `node_modules/${name}/files`,
  'files',
]);


const postcss = {
  external: typefaces,
};


const rollupPlugins = [
  json(),
  elm({
    exclude: 'elm-stuff/**',
    compiler: {
      optimize: true,
      debug: false,
      pathToElm: path.resolve(__dirname, 'node_modules/elm/bin/elm'),
    },
  }),
];


const metamodernConfig = {
  assets,
  postcss,
  rollupPlugins,
};


export default metamodernConfig;
