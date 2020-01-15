/* global document */

import fetch from 'unfetch';
import Elm from '../app/Main.elm';


fetch('http://localhost:3000/members')
  .then((res) => res.json())
  .then((json) => {
    Elm.Main.init({
      node: document.getElementById('appRoot'),
      flags: json.data,
    });
  })
  .catch((err) => {
    console.error(err);
  });
