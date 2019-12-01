<?php

use Illuminate\Database\Seeder;
use Spatie\Permission\Models\Role;
use Spatie\Permission\Models\Permission;

class RolesAndPermissionsSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        /// Reset cached roles and permissions
        app()[\Spatie\Permission\PermissionRegistrar::class]->forgetCachedPermissions();

        // create permissions
        Permission::create(['name' => 'create master']);
        Permission::create(['name' => 'read master']);
        Permission::create(['name' => 'update master']);
        Permission::create(['name' => 'delete master']);

        Permission::create(['name' => 'create transaction']);
        Permission::create(['name' => 'read transaction']);
        Permission::create(['name' => 'update transaction']);
        Permission::create(['name' => 'delete transaction']);

        Permission::create(['name' => 'create utilities']);
        Permission::create(['name' => 'read utilities']);
        Permission::create(['name' => 'update utilities']);
        Permission::create(['name' => 'delete utilities']);

        $role_adm = Role::create(['name' => 'admin']);
        $role_adm->givePermissionTo(['create master', 'read master', 'update master', 'delete master', 'create transaction', 'read transaction', 'update transaction', 'delete transaction']);

        $role = Role::create(['name' => 'super-admin']);
        $role->givePermissionTo(Permission::all());

    }
}
