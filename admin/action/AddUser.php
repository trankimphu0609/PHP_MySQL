<div class="modal fade" id="addNewUser" tabindex="-1" role="dialog" aria-labelledby="mediumModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-body">
                <form id="formAddNewProduct" action="action/addNewUser.php" method="post" class="" enctype='multipart/form-data'>
                    <div class="form-group">
                    <div class="form-group">
                        <label for="title" class=" form-control-label">Username</label>
                        <input type="text" name="title" id="title" placeholder="Mời Tựa đề" class="form-control">
                    </div>
                    <div class="form-group">
                        <label for="title" class=" form-control-label">Password</label>
                        <input type="text" name="brand" id="brand" placeholder="Mời Tác giả" class="form-control">
                    </div>
                    <div class="form-group">
                        <label for="price" class=" form-control-label">Password</label>
                        <input type="number" name="price" id="price" placeholder="Mời nhập Giá" class="form-control">
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                        <button type="button" class="btn btn-primary" id="btnThem" onclick="addNewUser()">Thêm</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div> 