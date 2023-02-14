rm -rf module_abc/module_a.run
rm -rf module_abc/module_b.run
rm -rf module_abc/module_c.run

rm -rf module_xyz/module_x.run
rm -rf module_xyz/module_y.run
rm -rf module_xyz/module_z.run

# x86-64 ISA
rustc module_abc/module_a.rs -o module_abc/module_a.run
rustc module_abc/module_b.rs -o module_abc/module_b.run
rustc module_abc/module_c.rs -o module_abc/module_c.run

rustc module_xyz/module_x.rs -o module_xyz/module_x.run
rustc module_xyz/module_y.rs -o module_xyz/module_y.run
rustc module_xyz/module_z.rs -o module_xyz/module_z.run
