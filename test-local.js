#!/usr/bin/env node
/**
 * Test script for MaclawPro OpenClaw Skill
 * Usage: node test-local.js
 */

const skill = require('./dist/index.js');

console.log('\n🛡️  Testing MaclawPro OpenClaw Security Skill\n');
console.log('━'.repeat(60));

async function runTests() {
  try {
    // Test 1: Camera Status
    console.log('\n📹 Test 1: /camera-status');
    console.log('━'.repeat(60));
    const cameraResult = await skill.cameraStatus();
    console.log(cameraResult);

    // Test 2: Firewall Status
    console.log('\n\n🔥 Test 2: /firewall-status');
    console.log('━'.repeat(60));
    const firewallResult = await skill.firewallStatus();
    console.log(firewallResult);

    // Test 3: VPN Checker
    console.log('\n\n🔐 Test 3: /vpn-checker');
    console.log('━'.repeat(60));
    const vpnResult = await skill.vpnChecker();
    console.log(vpnResult);

    // Bonus Tests
    console.log('\n\n📡 Bonus Test: /wifi-scanner');
    console.log('━'.repeat(60));
    const wifiResult = await skill.wifiScanner();
    console.log(wifiResult);

    console.log('\n\n🔌 Bonus Test: /open-ports');
    console.log('━'.repeat(60));
    const portsResult = await skill.openPorts();
    console.log(portsResult);

    console.log('\n\n🎤 Bonus Test: /microphone-status');
    console.log('━'.repeat(60));
    const micResult = await skill.microphoneStatus();
    console.log(micResult);

    console.log('\n\n━'.repeat(60));
    console.log('✅ All tests completed!');
    console.log('━'.repeat(60));

    // Show metadata
    console.log('\n📦 Skill Metadata:');
    console.log(JSON.stringify(skill.metadata, null, 2));

  } catch (error) {
    console.error('\n❌ Error running tests:', error.message);
    process.exit(1);
  }
}

runTests();
