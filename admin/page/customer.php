<div class="table-data__tool">
    <!-- <div class="table-data__tool-right">
        <button class="au-btn au-btn-icon au-btn--green au-btn--small" id="AddUser">
            <i class="zmdi zmdi-plus"></i>Thêm tài khoản</button>
    </div> -->
</div>
<div class="table-responsive m-b-40">
<!-- <form method="post" id="user"> -->
    <table class="table table-borderless table-data3">
        <thead>
            <tr>
                <th>Mã</th>
                <th>Tên tài khoản</th>
                <th>Password</th>
                <th>Vai trò</th>
                <th>chi tiết</th>
                <th>Cấp quyền</th>
            </tr>
        </thead>
        <tbody id="table_product">
            <?php 
            $result = getAllUser(0);
            while ($row = $result->fetch_assoc()) {
                ?>
            <tr>
                <td><?php echo $row['id'] ?></td>
                <td><?php echo $row['username'] ?></td>
                <td><?php echo md5($row['password']) ?></td>
                <td>
                    <?php 
                    if ($row['admin'] == 1) echo '<span class="role admin">admin</span>';
                    else
                        echo '<span class="role member">member</span>';
                    ?>
                </td>
                <td>
                    <div class="table-data-feature">
                        <button onclick="moreUser(<?php echo $row['id'] ?>)" class="item" data-placement="top" title="More" data-toggle="modal" data-target="#moreUser">
                            <i class="zmdi zmdi-more"></i>
                        </button>
                        <?php
                        //     if ($row['admin'] == 1) echo '<button class="item" data-toggle="tooltip" data-placement="top" title="Edit">
                        //     <i class="zmdi zmdi-edit"></i>
                        // </button>';

                        ?>
                    </div>
                </td>
                <td>
                
                    <?php
                        if($row['admin']==1){
                            echo '<button onclick="permiss(';
                            echo $row['id'];
                            echo ')">hủy quyền</button>';
                        }else{
                            echo '<button onclick="permiss(';
                            echo $row['id'];
                            echo ')">cấp quyền</button>';
                        }
                    ?>
                </td>
            </tr>
            <?php 
        }
        ?>
        </tbody>
    </table>
