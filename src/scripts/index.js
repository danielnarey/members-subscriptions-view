/* global document */

import Elm from '../app/Main.elm';
import members from '../data/members.json';


try {  
  Elm.Main.init({ 
    node: document.getElementById('appRoot'),
    flags: members,
  });
} catch (err) {
  console.error(err);
}
