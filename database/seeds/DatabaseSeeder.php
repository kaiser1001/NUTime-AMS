<?php

use App\User;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Spatie\Permission\Models\Role;
use Spatie\Permission\Models\Permission;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     *
     * @return void
     */
    public function run()
    {
        $this->call(RolesAndPermissionsSeeder::class);

        $user = User::create([
            'name'          => 'Admin',
            'email'         => 'admin@gmail.com',
            'password'      => bcrypt('admin123'),
            'created_at'    => date("Y-m-d H:i:s")
        ]);

        $user->assignRole('Admin');

        $user2 = User::create([
            'name'          => 'Teacher',
            'email'         => 'teacher@gmail.com',
            'password'      => bcrypt('teacher123'),
            'created_at'    => date("Y-m-d H:i:s")
        ]);

        $user2->assignRole('Teacher');

        $user3 = User::create([
            'name'          => 'Student',
            'email'         => 'student@gmail.com',
            'password'      => bcrypt('student123'),
            'created_at'    => date("Y-m-d H:i:s")
        ]);

        $user3->assignRole('Student');

        DB::table('teachers')->insert([
            [
                'user_id'           => $user2->id,
                'gender'            => 'male',
                'phone'             => '09123456789',
                'dateofbirth'       => '1990-01-01',
                'current_address'   => 'Calamba City',
                'permanent_address' => 'Calamba City',
                'created_at'        => date("Y-m-d H:i:s")
            ]
        ]);

        DB::table('grades')->insert([
            'teacher_id'        => 1,
            'class_numeric'     => 1,
            'class_name'        => 'A',
            'class_description' => 'Class A'
        ]);

        DB::table('students')->insert([
            [
                'user_id'           => $user3->id,
                'parent_id'         => 1,
                'class_id'          => 1,
                'roll_number'       => 1,
                'gender'            => 'female',
                'phone'             => '09123412342',
                'dateofbirth'       => '2000-01-01',
                'current_address'   => 'Calamba City',
                'permanent_address' => 'Calamba City',
                'created_at'        => date("Y-m-d H:i:s")
            ]
        ]);

    }
}
