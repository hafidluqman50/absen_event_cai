<?php $__env->startSection('custom_css'); ?>
    
<?php $__env->stopSection(); ?>

<?php $__env->startSection('content'); ?>
    <div class="block-header">
        <h2>KELOMPOK</h2>
    </div>

    <div class="row clearfix">
        <!-- Task Info -->
        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
            <div class="card">
                <div class="header" style="box-shadow: 2px 3px 2px rgba(0, 0, 0, 0.3);">
                    <h2>DATA KELOMPOK</h2>
                    <a href="#" style="float: right; margin-top:-2.8rem" class="btn btn-default btn-circle waves-effect waves-circle waves-float">
                        <i class="material-icons">group</i>
                    </a>
                </div>
                <div class="body">
                    <div class="table-responsive">
                        <table class="table table-hover dashboard-task-infos" id="table">

                            <thead>
                                <tr>
                                    <th>No</th>
                                    <th>Nama</th>
                                    <th>Lokasi</th>
                                    <th>Aksi</th>
                                </tr>
                            </thead>
                            <tbody>
                                <?php $no = 1; ?>
                                <tr>
                                    <th scope="row"><?= $no++; ?></th>
                                    <td>Nama</td>
                                    <td>Lokasi</td>
                                    <td>
                                        <div class="btn-group" role="group">
                                            <a href="#" title="Edit" class="btn btn-warning waves-effect"><i class="fa fa-pencil"></i></a>
                                            <a href="#" title="Hapus"  class="btn btn-danger waves-effect" onclick="return confirm('Anda Yakin?')"><i class="fa fa-trash"></i></a>
                                        </div>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
        <!-- #END# Task Info -->
    </div>
<?php $__env->stopSection(); ?>

<?php $__env->startSection('custom_js'); ?>
    
<?php $__env->stopSection(); ?>
<?php echo $__env->make('layout.app', array_except(get_defined_vars(), array('__data', '__path')))->render(); ?>