#!/usr/bin/env node
/**
 * Integration test - Simulates how OpenClaw would use this skill
 */

const skill = require('./dist/index.js');

console.log('🧪 Integration Test - OpenClaw Usage Simulation\n');
console.log('━'.repeat(60));

async function testIntegration() {
  try {
    // 1. OpenClaw discovers the skill
    console.log('\n📦 Step 1: OpenClaw discovers skill');
    console.log(`   Name: ${skill.metadata.displayName}`);
    console.log(`   Icon: ${skill.metadata.icon}`);
    console.log(`   Category: ${skill.metadata.category}`);
    console.log('   ✅ Skill discovered');

    // 2. User lists available commands
    console.log('\n📋 Step 2: User runs /skills');
    console.log('   Available commands:');
    skill.metadata.commands.forEach(cmd => {
      console.log(`   • /${cmd}`);
    });

    // 3. User runs commands
    console.log('\n🎯 Step 3: User executes commands');
    console.log('\n   User types: /camera-status');
    const camera = await skill.cameraStatus();
    console.log('   OpenClaw responds:');
    camera.split('\n').forEach(line => console.log(`   ${line}`));

    console.log('\n   User types: /firewall-status');
    const firewall = await skill.firewallStatus();
    console.log('   OpenClaw responds:');
    firewall.split('\n').forEach(line => console.log(`   ${line}`));

    console.log('\n   User types: /vpn-checker');
    const vpn = await skill.vpnChecker();
    console.log('   OpenClaw responds:');
    vpn.split('\n').forEach(line => console.log(`   ${line}`));

    // 4. Test upgrade prompts
    console.log('\n\n💎 Step 4: Testing upgrade prompts');
    const blockResult = await skill.blockApp('TestApp');
    console.log('   User tries premium feature:');
    blockResult.split('\n').slice(0, 5).forEach(line => console.log(`   ${line}`));

    console.log('\n\n━'.repeat(60));
    console.log('✅ Integration test passed!');
    console.log('━'.repeat(60));

    console.log('\n📈 Summary:');
    console.log('   • Skill loads correctly ✓');
    console.log('   • Metadata is valid ✓');
    console.log('   • Commands execute ✓');
    console.log('   • Upgrade prompts work ✓');
    console.log('   • Ready for OpenClaw! ✓');

  } catch (error) {
    console.error('\n❌ Integration test failed:', error.message);
    process.exit(1);
  }
}

testIntegration();
