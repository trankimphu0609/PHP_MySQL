<?php 
require "../../PHP/database.php";
require "../../PHP/code.php";
$result = getAllInfoProduct($_GET['id']);
$row = $result->fetch_assoc();
?>
<td><input type="checkbox" value="<?php echo $row['idpr']?>"></inut></td>
<td><?php echo $row['idpr'] ?></td>
<td><img src="../PHP/public/img/product/<?php echo $row['image'] ?>" alt=""></td>
                <td><?php echo $row['namepr'] ?></td>
                <td><?php echo $row['idbr'] ?></td>
                <td><?php echo number_format($row['price']) ?>VND</td>
                <td>
                    <?php
                        // $result1=getSumProduct($row['idpr']);
                        // while($row1 = $result1->fetch_assoc())
                        // echo $row1['soluong'];
                        echo $row['totalamount']
                    ?>
                </td>
                <td><?php echo $row['counting_buy'] ?></td>
<td>
    <div class="table-data-feature">
        <button onclick="updateProduct(<?php echo $row['idpr'] ?>)" style="margin:2px;" type="button" class="btn btn-secondary  mb-1" data-toggle="modal" data-target="#updateProduct">
            <i class="zmdi zmdi-edit"></i>
        </button>
        <button style="margin:2px;" class="btn btn-secondary  mb-1" data-toggle="tooltip" data-placement="top" onclick="deleteProduct(<?php echo $row['idpr'] ?>)" title="Delete">
            <i class="zmdi zmdi-delete"></i>
        </button>
        <button style="margin:2px;" type="button" class="btn btn-secondary  mb-1" data-toggle="modal" data-target="#moreProduct" onclick="moreProduct(<?php echo $row['idpr'] ?>)">
            <i class="zmdi zmdi-more"></i>
        </button>
    </div>
</td> 