const fs = require('fs');
const vm = require('vm');
const html = fs.readFileSync(process.argv[2], 'utf8');
const data = html.match(/<script type="application\/json" id="bertom-views-data">\s*([\s\S]*?)<\/script>/);
const scripts = [...html.matchAll(/<script>([\s\S]*?)<\/script>/g)];
if (!data || !scripts.length) throw Error('Missing embedded data or script');
class Element {
  constructor() { this.children = []; this.listeners = {}; this.dataset = {}; this.attributes = {}; this.textContent = ''; this.checked = false; }
  append(...xs) { this.children.push(...xs); }
  replaceChildren(...xs) { this.children = xs; }
  setAttribute(k, v) { this.attributes[k] = v; }
  addEventListener(k, fn) { this.listeners[k] = fn; }
}
const buttons = ['question', 'survey', 'project'].map(x => { const e = new Element(); e.dataset.start = x; return e; });
const ids = Object.fromEntries(['show-example', 'evidence-cards', 'evidence-links', 'view-heading'].map(id => [id, new Element()]));
ids['bertom-views-data'] = {textContent: data[1]};
const document = { getElementById: id => ids[id], querySelectorAll: () => buttons, createElement: () => new Element() };
const appScript = scripts.find(match => match[1].includes("getElementById('bertom-views-data')"));
if (!appScript) throw Error('Application script missing');
vm.runInNewContext(appScript[1], { document });
function assert(ok, message) { if (!ok) throw Error(message); }
assert(ids['evidence-cards'].children.length === 7, 'Default view must contain seven non-hypothetical records');
assert(ids['evidence-links'].children.length === 7, 'Default view must retain seven links');
buttons[1].listeners.click();
assert(ids['view-heading'].textContent.includes('2014 mussel survey'), 'Survey selection did not change the heading');
assert(buttons[1].attributes['aria-pressed'] === 'true', 'Selection state did not change');
ids['show-example'].checked = true; ids['show-example'].listeners.change();
assert(ids['evidence-cards'].children.length === 8, 'Assessment example did not appear');
assert(ids['evidence-links'].children.length === 9, 'Example links did not appear');
buttons[2].listeners.click();
assert(ids['view-heading'].textContent.includes('Bertom and McCartney'), 'Project selection did not change the heading');
ids['show-example'].checked = false; ids['show-example'].listeners.change();
assert(ids['evidence-cards'].children.length === 7, 'Assessment example was not removed');
console.log('Selector, original links, and opt-in hypothetical assessment checks passed.');
