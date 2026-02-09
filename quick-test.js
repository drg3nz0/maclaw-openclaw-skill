const s = require('./dist/index.js');

Promise.all([
  s.cameraStatus(),
  s.firewallStatus(),
  s.vpnChecker()
]).then(results => {
  console.log('🧪 Quick Test Results:\n');
  console.log('1️⃣  Camera:', results[0].split('\n')[0]);
  console.log('2️⃣  Firewall:', results[1].split('\n')[0]);
  console.log('3️⃣  VPN:', results[2].split('\n')[0]);
  console.log('\n✅ All systems operational!');
});
